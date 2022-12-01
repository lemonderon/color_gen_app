import 'package:flutter/material.dart';

/// Number of taps required on the central button to activate button's modal
/// during [kConsequentBtnTapsRegistrationTime] period from the first central
/// button tap.
const int kMaxCentralBtnConsequentTapsN = 3;

/// Amount of time given to reach [kMaxCentralBtnConsequentTapsN] from the first
/// central button tap.
const Duration kConsequentBtnTapsRegistrationTime = Duration(microseconds: 300);

/// Maximum screen's central button size in points.
const double kMaxCentralSquareBtnSize = 100;

/// [Color] to be used as the start background.
const Color kStartupBackgroundColor = Colors.black;

/// [Color] to be used as the central button's background and border color
/// when background has high perceived brightness value
const Color kHighPerceivedBrightnessCentralBtnColor = Colors.black;

/// [Color] to be used as the central button's background and border color
/// when background has low perceived brightness value
const Color kLowPerceivedBrightnessCentralBtnColor = Colors.yellow;

/// [Color] to be used as the central button's text color when background has
/// high perceived brightness value
const Color kHighPerceivedBrightnessCentralTextColor = Colors.white;

/// [Color] to be used as the central button's text color when background has
/// low perceived brightness value
const Color kLowPerceivedBrightnessCentralTextColor = Colors.black;

/// Central button on the main
const String kHomePageCentralBtnText = 'Hey there';
