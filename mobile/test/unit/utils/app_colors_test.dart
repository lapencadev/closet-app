import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/utils/app_colors.dart';

void main() {
  group('AppColors', () {
    test('primary color should be correctly defined', () {
      expect(AppColors.primary, const Color(0xFF6C63FF));
    });

    test('accent color should be correctly defined', () {
      expect(AppColors.accent, const Color(0xFFFF7675));
    });

    test('background color should be correctly defined', () {
      expect(AppColors.background, const Color(0xFFF8F9FA));
    });
  });
}
