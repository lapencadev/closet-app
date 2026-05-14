import 'dart:convert';
import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';
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

class GeminiService {
  Future<ClothingAnalysis> analyzeClothing(File imageFile) async {
    if (geminiApiKey.isEmpty || geminiApiKey == 'YOUR_GEMINI_API_KEY_HERE') {
      throw Exception(
        'Gemini API key not configured.\n'
        'Edit lib/config/secrets.dart and add your key.\n'
        'Get a free key at aistudio.google.com',
      );
    }

    final model = GenerativeModel(
      model: 'gemini-3.1-flash-lite-preview',
      apiKey: geminiApiKey,
      generationConfig: GenerationConfig(
        maxOutputTokens: 512,
        temperature: 0.1,
      ),
    );

    final bytes = await imageFile.readAsBytes();
    final ext = imageFile.path.split('.').last.toLowerCase();
    final mimeType = ext == 'png' ? 'image/png' : 'image/jpeg';

    final response = await model.generateContent([
      Content.multi([TextPart(_prompt), DataPart(mimeType, bytes)]),
    ]);

    final text = response.text;
    if (text == null || text.isEmpty) throw Exception('Empty AI response');

    final jsonMatch = RegExp(r'\{[\s\S]*\}').firstMatch(text);
    if (jsonMatch == null) throw Exception('Could not parse AI response');

    return ClothingAnalysis.fromJson(
      jsonDecode(jsonMatch.group(0)!) as Map<String, dynamic>,
    );
  }

  static const String _prompt = '''
Analyze this clothing item image. Return ONLY a JSON object (no markdown, no explanation). Use exactly the values provided.

{
  "name": "descriptive item name e.g. 'Blue Denim Jacket'",
  "type": "one of: SHIRT, PANT, DRESS, JACKET, SKIRT, JUMPER, SWIMSUIT, FOOTWEAR, BAG, BELT, HAT, SCARF, JEWELLERY, SUNGLASSES, WATCH, GLOVES, SOCKS, TIGHTS, BOW_TIE, TIE, BROOCH, HAIR_ACCESSORY, BACKPACK, WALLET",
  "colour": "one of: BLACK, WHITE, GREY, BEIGE, BROWN, RED, ORANGE, PINK, YELLOW, GREEN, TEAL, BLUE, NAVY_BLUE, PURPLE, LAVENDER, GOLD, SILVER, MULTICOLOUR, PATTERNED, ANIMAL_PRINT",
  "season": "one of: SPRING, SUMMER, AUTUMN, WINTER, ALL_SEASONS",
  "sleeveLength": "one of: SHORT, MEDIUM, LONG — only for shirts/dresses/jumpers/jackets, omit otherwise",
  "fabricType": "fabric if identifiable e.g. cotton, denim, silk, wool, polyester, linen",
  "pattern": "one brief word describing the pattern e.g. solid, striped, floral, checkered",
  "description": "one brief sentence describing the item"
}

Only include fields you can confidently identify. Omit any field you are unsure about.
''';
}
