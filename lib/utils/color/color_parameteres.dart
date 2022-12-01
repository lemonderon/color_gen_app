import 'package:flutter/material.dart';

const _kPerceivedLuminanceHighBrightnessBoundary = 0.6;

///  Returns `true` if [color] has high human perceived brightness.
bool calculatePerceivedColorBrightness(Color color) {
  return color.computeLuminance() > _kPerceivedLuminanceHighBrightnessBoundary;
}
