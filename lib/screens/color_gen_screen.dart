import 'dart:math';

import 'package:color_gen_app/constants/app_theming_constants.dart';
import 'package:color_gen_app/constants/home_page_constants.dart';
import 'package:color_gen_app/modals/generic_modals.dart';
import 'package:color_gen_app/providers/riverpod_providers.dart';
import 'package:color_gen_app/utils/color/color_generation.dart';
import 'package:color_gen_app/utils/color/color_parameteres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pausable_timer/pausable_timer.dart';

class ColorGenerationScreen extends ConsumerStatefulWidget {
  const ColorGenerationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ColorGenerationScreen> createState() =>
      _ColorGenerationScreenState();
}

class _ColorGenerationScreenState extends ConsumerState<ColorGenerationScreen> {
  final ValueNotifier<Color> _backgroundColorNotifier =
      ValueNotifier(kStartupBackgroundColor);

  final PausableTimer _centralBtnConsequentTapsRegistrationTimer =
      PausableTimer(kConsequentBtnTapsRegistrationTime, () {
    return;
  });

  int _centralBtnConsequentTapsN = 0;

  @override
  void dispose() {
    _centralBtnConsequentTapsRegistrationTimer.cancel();
    _backgroundColorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final double minMqVal = min(mq.height, mq.width);

    final double centralBtnSize = (minMqVal > kMaxCentralSquareBtnSize * 2)
        ? kMaxCentralSquareBtnSize
        : minMqVal * 0.3;

    return ValueListenableBuilder(
      valueListenable: _backgroundColorNotifier,
      builder: (context, scaffoldBackgroundColor, child) {
        final bool isColorPerceivedAsBright = calculatePerceivedColorBrightness(
          scaffoldBackgroundColor,
        );

        final centralBtnColor = isColorPerceivedAsBright
            ? kHighPerceivedBrightnessCentralBtnColor
            : kLowPerceivedBrightnessCentralTextColor;

        return Scaffold(
          backgroundColor: scaffoldBackgroundColor,
          body: SafeArea(
            child: InkWell(
              onTap: _onBackgroundTaps,
              child: Ink(
                decoration: BoxDecoration(
                  color: centralBtnColor,
                  border: Border.all(
                    color: centralBtnColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(kGeneralRoundingValue),
                  ),
                ),
                child: InkWell(
                  onTap: _onCentralBtnTaps,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(kGeneralRoundingValue),
                  ),
                  child: SizedBox(
                    width: centralBtnSize,
                    height: centralBtnSize,
                    child: Center(
                      child: Text(
                        kHomePageCentralBtnText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: kCentralButtonFontSize,
                          color: isColorPerceivedAsBright
                              ? kHighPerceivedBrightnessCentralTextColor
                              : kLowPerceivedBrightnessCentralTextColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onBackgroundTaps() {
    _backgroundColorNotifier.value = generateColorFromRGB();
    _centralBtnConsequentTapsRegistrationTimer.reset();
    // counter resetting
    _centralBtnConsequentTapsN = 0;
  }

  Future<void> _onCentralBtnTaps() async {
    _backgroundColorNotifier.value = generateColorFromRGB();
    _centralBtnConsequentTapsRegistrationTimer.start();

    ++_centralBtnConsequentTapsN;

    if (_centralBtnConsequentTapsN >= kMaxCentralBtnConsequentTapsN &&
        _centralBtnConsequentTapsRegistrationTimer.isActive) {
      // counter resetting
      _centralBtnConsequentTapsN = 0;

      final String versionN =
          ref.read(dataFetchedOnStartProvider).packageInfo?.version ?? '';

      showSimpleInfoDialog(
        context,
        titleStr: "App version:",
        contentStr: 'v $versionN',
      );
    }
  }
}
