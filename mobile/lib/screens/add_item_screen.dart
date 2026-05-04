import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/models/item_model.dart';
import 'package:mobile/services/gemini_service.dart';
import 'package:mobile/services/closet_database.dart';
import 'package:mobile/utils/app_colors.dart';

// ── Enum data ────────────────────────────────────────────────────────────────

const List<String> _types = [
  'Shirt',
  'Pant',
  'Dress',
  'Jacket',
  'Skirt',
  'Jumper',
  'Swimsuit',
  'Footwear',
  'Accessory',
];

const List<String> _colours = [
  'BLACK',
  'WHITE',
  'GREY',
  'CHARCOAL',
  'IVORY',
  'CREAM',
  'BEIGE',
  'SAND',
  'BROWN',
  'KHAKI',
  'OLIVE',
  'COPPER',
  'RED',
  'MAROON',
  'BURGUNDY',
  'CORAL',
  'PINK',
  'BLUSH',
  'ROSE',
  'FUCHSIA',
  'MAGENTA',
  'ORANGE',
  'AMBER',
  'GOLD',
  'MUSTARD',
  'YELLOW',
  'PEACH',
  'LIME',
  'GREEN',
  'MINT',
  'TEAL',
  'EMERALD',
  'BLUE',
  'NAVY_BLUE',
  'COBALT',
  'INDIGO',
  'CYAN',
  'TURQUOISE',
  'PURPLE',
  'LAVENDER',
  'LILAC',
  'SILVER',
];

const Map<String, Color> _colourSwatches = {
  'BLACK': Color(0xFF212121),
  'WHITE': Color(0xFFFAFAFA),
  'GREY': Color(0xFF9E9E9E),
  'CHARCOAL': Color(0xFF37474F),
  'IVORY': Color(0xFFFFF8E7),
  'CREAM': Color(0xFFFFFDD0),
  'BEIGE': Color(0xFFF5F5DC),
  'SAND': Color(0xFFC2B280),
  'BROWN': Color(0xFF795548),
  'KHAKI': Color(0xFFC3B091),
  'OLIVE': Color(0xFF6B6B2A),
  'COPPER': Color(0xFFB87333),
  'RED': Color(0xFFE53935),
  'MAROON': Color(0xFF800000),
  'BURGUNDY': Color(0xFF722F37),
  'CORAL': Color(0xFFFF7F7F),
  'PINK': Color(0xFFF48FB1),
  'BLUSH': Color(0xFFDE5D83),
  'ROSE': Color(0xFFFF4081),
  'FUCHSIA': Color(0xFFFF00FF),
  'MAGENTA': Color(0xFFE91E63),
  'ORANGE': Color(0xFFFF7043),
  'AMBER': Color(0xFFFFC107),
  'GOLD': Color(0xFFFFD700),
  'MUSTARD': Color(0xFFFFDB58),
  'YELLOW': Color(0xFFFFEE58),
  'PEACH': Color(0xFFFFDAB9),
  'LIME': Color(0xFFCDDC39),
  'GREEN': Color(0xFF43A047),
  'MINT': Color(0xFF80CBC4),
  'TEAL': Color(0xFF00897B),
  'EMERALD': Color(0xFF50C878),
  'BLUE': Color(0xFF1E88E5),
  'NAVY_BLUE': Color(0xFF1A237E),
  'COBALT': Color(0xFF0047AB),
  'INDIGO': Color(0xFF3F51B5),
  'CYAN': Color(0xFF00BCD4),
  'TURQUOISE': Color(0xFF40E0D0),
  'PURPLE': Color(0xFF8E24AA),
  'LAVENDER': Color(0xFFE1BEE7),
  'LILAC': Color(0xFFC8A2C8),
  'SILVER': Color(0xFFC0C0C0),
};

const List<String> _seasons = [
  'SPRING',
  'SUMMER',
  'AUTUMN',
  'WINTER',
  'ALL_SEASONS',
];
const List<String> _sizes = [
  'XS',
  'S',
  'M',
  'L',
  'XL',
  'XXL',
  'XXXL',
  'ONE_SIZE',
  'CUSTOM',
];
const List<String> _sleeveLengths = ['SHORT', 'MEDIUM', 'LONG'];
const Set<String> _typesWithSleeves = {'Shirt', 'Dress', 'Jumper', 'Jacket'};

// ── Helpers ──────────────────────────────────────────────────────────────────

String _fmt(String v) {
  if (v.startsWith('SIZE_')) return v.substring(5);
  return v
      .split('_')
      .map(
        (w) => w.isEmpty
            ? ''
            : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}',
      )
      .join(' ');
}

// ── Screen ───────────────────────────────────────────────────────────────────

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _brandController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _fabricController = TextEditingController();
  final _patternController = TextEditingController();
  final _colourFieldKey = GlobalKey<FormFieldState<String?>>();
  final _sizeFieldKey = GlobalKey<FormFieldState<String?>>();

  File? _image;
  String _type = 'Shirt';
  String? _colour;
  String? _season;
  String? _size;
  String? _sleeveLength;
  bool _isFavourite = false;
  bool _isAnalyzing = false;
  bool _isSaving = false;

  final _picker = ImagePicker();
  final _aiService = GeminiService();

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _descriptionController.dispose();
    _fabricController.dispose();
    _patternController.dispose();
    super.dispose();
  }

  // ── Actions ────────────────────────────────────────────────────────────────

  void _showImageSourceSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(ImageSource.gallery);
                },
              ),
              if (_image != null)
                ListTile(
                  leading: const Icon(
                    Icons.delete_outline,
                    color: AppColors.error,
                  ),
                  title: const Text(
                    'Remove photo',
                    style: TextStyle(color: AppColors.error),
                  ),
                  onTap: () {
                    Navigator.pop(ctx);
                    setState(() => _image = null);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picked = await _picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1024,
    );
    if (picked != null && mounted) {
      setState(() => _image = File(picked.path));
    }
  }

  Future<void> _analyzeWithAI() async {
    if (_image == null) return;
    setState(() => _isAnalyzing = true);
    try {
      final analysis = await _aiService.analyzeClothing(_image!);
      if (!mounted) return;
      setState(() {
        if (analysis.name?.isNotEmpty == true) {
          _nameController.text = analysis.name!;
        }
        if (analysis.type != null && _types.contains(analysis.type)) {
          _type = analysis.type!;
        }
        if (analysis.colour != null && _colours.contains(analysis.colour)) {
          _colour = analysis.colour;
          _colourFieldKey.currentState?.didChange(_colour);
        }
        if (analysis.season != null && _seasons.contains(analysis.season)) {
          _season = analysis.season;
        }
        if (analysis.sleeveLength != null &&
            _sleeveLengths.contains(analysis.sleeveLength)) {
          _sleeveLength = analysis.sleeveLength;
        }
        if (analysis.fabricType?.isNotEmpty == true) {
          _fabricController.text = analysis.fabricType!;
        }
        if (analysis.pattern?.isNotEmpty == true) {
          _patternController.text = analysis.pattern!;
        }
        if (analysis.description?.isNotEmpty == true) {
          _descriptionController.text = analysis.description!;
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Fields filled in — review and adjust as needed'),
          backgroundColor: AppColors.success,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: AppColors.error),
      );
    } finally {
      if (mounted) setState(() => _isAnalyzing = false);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    try {
      final db = ClosetDatabase();
      final model = ItemModel(
        name: _nameController.text.trim(),
        type: _type,
        colour: _colour,
        season: _season,
        size: _size,
        imagePath: _image?.path,
        isFavorite: _isFavourite,
        brand: _brandController.text.trim().isEmpty
            ? null
            : _brandController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        sleeveLength: _sleeveLength,
        fabricType: _fabricController.text.trim().isEmpty
            ? null
            : _fabricController.text.trim(),
        pattern: _patternController.text.trim().isEmpty
            ? null
            : _patternController.text.trim(),
      );
      await db.into(db.items).insert(model.toCompanion());
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  Widget _buildSaveAction() {
    if (_isSaving) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: PlatformCircularProgressIndicator(),
          ),
        ),
      );
    }
    return PlatformTextButton(
      onPressed: _save,
      cupertino: (context, _) =>
          CupertinoTextButtonData(padding: EdgeInsets.zero),
      child: const Text('Save', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('Add Item'),
        trailingActions: [_buildSaveAction()],
      ),
      body: Material(
        color: Colors.transparent,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildImagePicker(),
              const SizedBox(height: 16),
              _buildSection('Basic Info', [
                _buildNameField(),
                const SizedBox(height: 12),
                _buildTypeSelector(),
                const SizedBox(height: 12),
                _buildTextField(
                  _brandController,
                  'Brand',
                  hint: 'e.g. Zara, H&M',
                ),
              ]),
              const SizedBox(height: 16),
              _buildSection('Appearance', [
                _buildColourDropdown(),
                const SizedBox(height: 12),
                _buildSizeDropdown(),
                const SizedBox(height: 16),
                _buildLabel('Season'),
                const SizedBox(height: 8),
                _buildSeasonChips(),
                if (_typesWithSleeves.contains(_type)) ...[
                  const SizedBox(height: 16),
                  _buildLabel('Sleeve length'),
                  const SizedBox(height: 8),
                  _buildSleeveLengthChips(),
                ],
                const SizedBox(height: 12),
                _buildTextField(
                  _fabricController,
                  'Fabric type',
                  hint: 'e.g. cotton, denim, silk',
                ),
                const SizedBox(height: 12),
                _buildTextField(
                  _patternController,
                  'Pattern',
                  hint: 'e.g. solid, striped, floral',
                ),
              ]),
              const SizedBox(height: 16),
              _buildSection('Notes', [
                _buildTextField(
                  _descriptionController,
                  'Description',
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                _buildFavouriteToggle(),
              ]),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // ── Image picker ──────────────────────────────────────────────────────────

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _showImageSourceSheet,
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          color: AppColors.greyLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.greyMedium, width: 1.5),
        ),
        clipBehavior: Clip.hardEdge,
        child: _image != null
            ? Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(_image!, fit: BoxFit.cover),
                  Positioned(top: 8, right: 8, child: _buildAIButton()),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: _buildChangePhotoChip(),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo_outlined,
                    size: 48,
                    color: AppColors.greyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add a photo',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Camera or gallery',
                    style: TextStyle(color: AppColors.greyMedium, fontSize: 12),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildAIButton() {
    return _isAnalyzing
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.65),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Analyzing…',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: _analyzeWithAI,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.auto_awesome, color: Colors.white, size: 14),
                  SizedBox(width: 6),
                  Text(
                    'Auto-fill with AI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget _buildChangePhotoChip() {
    return GestureDetector(
      onTap: _showImageSourceSheet,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.edit, color: Colors.white, size: 12),
            SizedBox(width: 4),
            Text('Change', style: TextStyle(color: Colors.white, fontSize: 11)),
          ],
        ),
      ),
    );
  }

  // ── Form fields ───────────────────────────────────────────────────────────

  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        labelText: 'Name *',
        hintText: 'e.g. Black Crew-Neck T-Shirt',
        border: OutlineInputBorder(),
      ),
      validator: (v) =>
          (v == null || v.trim().isEmpty) ? 'Name is required' : null,
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    String? hint,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
        alignLabelWithHint: maxLines > 1,
      ),
    );
  }

  Widget _buildTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Type'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: _types.map((t) {
            final selected = _type == t;
            return ChoiceChip(
              label: Text(t),
              selected: selected,
              onSelected: (_) => setState(() {
                _type = t;
                if (!_typesWithSleeves.contains(t)) _sleeveLength = null;
              }),
              selectedColor: AppColors.primaryLight.withValues(alpha: 0.35),
              labelStyle: TextStyle(
                color: selected ? AppColors.primary : AppColors.textSecondary,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColourDropdown() {
    return DropdownButtonFormField<String>(
      key: _colourFieldKey,
      initialValue: _colour,
      decoration: const InputDecoration(
        labelText: 'Colour',
        border: OutlineInputBorder(),
      ),
      hint: const Text('Select colour'),
      isExpanded: true,
      items: _colours.map((c) {
        final swatch = _colourSwatches[c] ?? Colors.grey;
        final isLight = swatch.computeLuminance() > 0.7;
        return DropdownMenuItem(
          value: c,
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: swatch,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isLight ? AppColors.greyMedium : Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(_fmt(c)),
            ],
          ),
        );
      }).toList(),
      onChanged: (v) => setState(() => _colour = v),
    );
  }

  Widget _buildSizeDropdown() {
    return DropdownButtonFormField<String>(
      key: _sizeFieldKey,
      initialValue: _size,
      decoration: const InputDecoration(
        labelText: 'Size',
        border: OutlineInputBorder(),
      ),
      hint: const Text('Select size'),
      items: _sizes
          .map((s) => DropdownMenuItem(value: s, child: Text(_fmt(s))))
          .toList(),
      onChanged: (v) => setState(() => _size = v),
    );
  }

  Widget _buildSeasonChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: _seasons.map((s) {
        final selected = _season == s;
        return ChoiceChip(
          label: Text(_fmt(s)),
          selected: selected,
          onSelected: (_) => setState(() => _season = selected ? null : s),
          selectedColor: AppColors.primaryLight.withValues(alpha: 0.35),
          labelStyle: TextStyle(
            color: selected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSleeveLengthChips() {
    return Wrap(
      spacing: 8,
      children: _sleeveLengths.map((s) {
        final selected = _sleeveLength == s;
        return ChoiceChip(
          label: Text(_fmt(s)),
          selected: selected,
          onSelected: (_) =>
              setState(() => _sleeveLength = selected ? null : s),
          selectedColor: AppColors.primaryLight.withValues(alpha: 0.35),
          labelStyle: TextStyle(
            color: selected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFavouriteToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Mark as favourite'),
        PlatformSwitch(
          value: _isFavourite,
          onChanged: (v) => setState(() => _isFavourite = v),
          activeTrackColor: AppColors.primary,
        ),
      ],
    );
  }
}
