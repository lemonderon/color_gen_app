import 'dart:math';
import 'dart:ui';

import 'package:color_gen_app/utils/app_logger.dart';
import 'package:color_gen_app/utils/color/rgb_component.dart';
import 'package:flutter/foundation.dart';

const _kColorFullyOpaqueVal = 0xFF;

/// Generates colors using ARGB [Color] representation.
///
/// By default will generate 256^3=16777216 colors using red, green and blue
/// color components. If custom generator function [compGen] is provided
/// then (r,g,b) components of the resulting [Color] will be calculated
/// depending on current [RGBComponent].
Color generateColorFromRGB([
  int Function(RGBComponent) compGen = _defaultColorComponentGenerator,
]) {
  // Color consists of 4 components and corresponding 4 positioned bytes
  // in the resulting integer.
  final int blueComp = (compGen(RGBComponent.BLUE) & 0xFF) << 0;
  final int greenComp = (compGen(RGBComponent.GREEN) & 0xFF) << 8;
  final int redComp = (compGen(RGBComponent.RED) & 0xFF) << 16;
  //TODO: int is not byte Any checks?
  const int alphaComp = _kColorFullyOpaqueVal << 24;

  final colorIntVal = alphaComp | redComp | greenComp | blueComp;

  final res = Color(colorIntVal);
  if (kDebugMode) {
    logger.d("Generated: $res");
  }
  return res;
}

/// Generates random values in range (0..255) using [Random.nextInt]
int _defaultColorComponentGenerator(RGBComponent _) {
  final rnd = Random();

  // Upper boundary for color value generation (0xFF + 1).
  const kMaxColorGeneratorVal = 0x100;

  // Using uniformly distributed generation
  return rnd.nextInt(kMaxColorGeneratorVal);
}
