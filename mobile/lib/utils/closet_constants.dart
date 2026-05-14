import 'package:flutter/material.dart';

class ClosetConstants {
  static const List<String> types = ['CLOTHES', 'ACCESSORY'];

  static const Map<String, List<String>> subTypes = {
    'CLOTHES': [
      'SHIRT',
      'PANT',
      'DRESS',
      'JACKET',
      'SKIRT',
      'JUMPER',
      'SWIMSUIT',
      'FOOTWEAR',
    ],
    'ACCESSORY': [
      'BAG',
      'BELT',
      'HAT',
      'SCARF',
      'JEWELLERY',
      'SUNGLASSES',
      'WATCH',
      'GLOVES',
      'SOCKS',
      'TIGHTS',
      'BOW_TIE',
      'TIE',
      'BROOCH',
      'HAIR_ACCESSORY',
      'BACKPACK',
      'WALLET',
    ],
  };

  static const Map<String, Color> colourPalette = {
    'BLACK': Color(0xFF212121),
    'WHITE': Color(0xFFFAFAFA),
    'GREY': Color(0xFF9E9E9E),
    'BEIGE': Color(0xFFF5F5DC),
    'BROWN': Color(0xFF795548),
    'RED': Color(0xFFE53935),
    'ORANGE': Color(0xFFFF7043),
    'PINK': Color(0xFFF48FB1),
    'YELLOW': Color(0xFFFFEE58),
    'GREEN': Color(0xFF43A047),
    'TEAL': Color(0xFF00897B),
    'BLUE': Color(0xFF1E88E5),
    'NAVY_BLUE': Color(0xFF1A237E),
    'PURPLE': Color(0xFF8E24AA),
    'LAVENDER': Color(0xFFE1BEE7),
    'GOLD': Color(0xFFFFD700),
    'SILVER': Color(0xFFC0C0C0),
    'MULTICOLOUR': Colors.transparent,
    'PATTERNED': Colors.transparent,
    'ANIMAL_PRINT': Colors.transparent,
  };

  static const List<String> seasons = [
    'SPRING',
    'SUMMER',
    'AUTUMN',
    'WINTER',
    'ALL_SEASONS',
  ];

  static const List<String> sizes = [
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

  static const List<String> sleeveLengths = ['SHORT', 'MEDIUM', 'LONG'];

  static const Set<String> typesWithSleeves = {
    'SHIRT',
    'DRESS',
    'JUMPER',
    'JACKET',
  };
}
