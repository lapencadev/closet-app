import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobile/config/secrets.dart';

class ClothingAnalysis {
  final String? name;
  final String? type;
  final String? colour;
  final String? season;
  final String? sleeveLength;
  final String? fabricType;
  final String? pattern;
  final String? description;

  ClothingAnalysis({
    this.name,
    this.type,
    this.colour,
    this.season,
    this.sleeveLength,
    this.fabricType,
    this.pattern,
    this.description,
  });

  factory ClothingAnalysis.fromJson(Map<String, dynamic> json) {
    return ClothingAnalysis(
      name: json['name'] as String?,
      type: json['type'] as String?,
      colour: json['colour'] as String?,
      season: json['season'] as String?,
      sleeveLength: json['sleeveLength'] as String?,
      fabricType: json['fabricType'] as String?,
      pattern: json['pattern'] as String?,
      description: json['description'] as String?,
    );
  }
}

class ClaudeService {
  static const String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';

  Future<ClothingAnalysis> analyzeClothing(File imageFile) async {
    if (geminiApiKey.isEmpty || geminiApiKey == 'YOUR_GEMINI_API_KEY_HERE') {
      throw Exception(
        'Gemini API key not configured.\n'
        'Edit lib/config/secrets.dart and add your key.\n'
        'Get a free key at aistudio.google.com',
      );
    }

    final bytes = await imageFile.readAsBytes();
    final base64Image = base64Encode(bytes);
    final ext = imageFile.path.split('.').last.toLowerCase();
    final mimeType = ext == 'png' ? 'image/png' : 'image/jpeg';

    final response = await http
        .post(
          Uri.parse('$_baseUrl?key=$geminiApiKey'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'contents': [
              {
                'parts': [
                  {
                    'inline_data': {
                      'mime_type': mimeType,
                      'data': base64Image,
                    },
                  },
                  {'text': _prompt},
                ],
              },
            ],
            'generationConfig': {
              'maxOutputTokens': 512,
              'temperature': 0.1,
            },
          }),
        )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw Exception('Gemini API error ${response.statusCode}: ${response.body}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final content =
        ((data['candidates'] as List).first['content']['parts'] as List).first['text'] as String;

    final jsonMatch = RegExp(r'\{[\s\S]*\}').firstMatch(content);
    if (jsonMatch == null) throw Exception('Could not parse AI response');

    return ClothingAnalysis.fromJson(
      jsonDecode(jsonMatch.group(0)!) as Map<String, dynamic>,
    );
  }

  static const String _prompt = '''
Analyze this clothing item image. Return ONLY a JSON object (no markdown, no explanation).

{
  "name": "descriptive item name e.g. 'Black Short-Sleeve T-Shirt'",
  "type": "one of: Shirt, Pant, Dress, Jacket, Skirt, Jumper, Swimsuit, Footwear, Accessory",
  "colour": "one of: RED, GREEN, BLUE, BLACK, WHITE, NAVY_BLUE, GOLD, LAVENDER, MINT, ORANGE, YELLOW, PURPLE, PINK, BROWN, GREY, BEIGE, CREAM, TEAL, CORAL, TURQUOISE, MAGENTA, OLIVE, MAROON, SILVER, COPPER, LILAC, PEACH, KHAKI, MUSTARD, BURGUNDY, INDIGO, CYAN, LIME, ROSE, FUCHSIA, AMBER, CHARCOAL, IVORY, SAND, BLUSH, COBALT, EMERALD",
  "season": "one of: SPRING, SUMMER, AUTUMN, WINTER, ALL_SEASONS",
  "sleeveLength": "one of: SHORT, MEDIUM, LONG — only for tops/dresses, omit for other types",
  "fabricType": "fabric if identifiable e.g. cotton, denim, silk, wool, polyester, linen",
  "pattern": "one of: solid, striped, floral, checkered, polka_dots, graphic, animal_print, geometric, abstract — omit if unsure",
  "description": "one brief sentence describing the item"
}

Only include fields you can confidently identify. Omit any field you are unsure about.
''';
}