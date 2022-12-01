import 'package:color_gen_app/utils/color/color_generation.dart';
import 'package:color_gen_app/utils/color/rgb_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Random color generation', () {
    test('Generated color using predefined values matches the expected', () {
      int compGen(RGBComponent comp) {
        return 0x0F;
      }

      final generatedColor = generateColorFromRGB(compGen);

      expect(generatedColor, const Color(0xFF0F0F0F));
    });
    test(
        'Passing compGen function that generates values over 0xFF provides '
        'correct results', () {
      int compGen(RGBComponent comp) {
        return 1234567890;
      }

      final generatedColor = generateColorFromRGB(compGen);

      expect(generatedColor, const Color(0xFFD2D2D2));
    });
  });
}
