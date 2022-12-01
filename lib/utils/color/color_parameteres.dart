import 'package:flutter/material.dart';

bool calculatePerceivedColorBrightness(Color color) {
  return color.computeLuminance() > 0.6;
}
