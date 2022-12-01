import 'dart:math';

import 'package:color_gen_app/modals/generic_modals.dart';
import 'package:color_gen_app/providers/riverpod_providers.dart';
import 'package:color_gen_app/screens/home_screen/color_generation_screen_constants.dart';
import 'package:color_gen_app/theme/app_theming_constants.dart';
import 'package:color_gen_app/utils/color/color_generation.dart';
import 'package:color_gen_app/utils/color/color_parameteres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Main screen for this app. Allows user to generate random colors by tapping.
class ColorGenerationScreen extends ConsumerStatefulWidget {
  /// [Key] used for finding central button widget on this screen's widget tree.
  static const Key centralButtonKey =
      Key('#color_generation_central_button_key');

  /// Screen which generates random colors by tapping.
  const ColorGenerationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ColorGenerationScreen> createState() =>
      _ColorGenerationScreenState();
}

class _ColorGenerationScreenState extends ConsumerState<ColorGenerationScreen> {
  final ValueNotifier<Color> _backgroundColorNotifier =
      ValueNotifier(kStartupBackgroundColor);

  int _centralBtnConsequentTapsN = 0;

  @override
  void dispose() {
    _backgroundColorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _backgroundColorNotifier,
      builder: (context, scaffoldBackgroundColor, child) {
        return Scaffold(
          backgroundColor: scaffoldBackgroundColor,
          body: SafeArea(
            child: InkWell(
              onTap: _onBackgroundTaps,
              child: Center(
                child: _CentralButton(
                  scaffoldBackgroundColor: scaffoldBackgroundColor,
                  onTap: _onCentralBtnTaps,
                  key: ColorGenerationScreen.centralButtonKey,
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
    ref.read(colorGenerationScreenTimerProvider).reset();
    // counter resetting
    _centralBtnConsequentTapsN = 0;
  }

  Future<void> _onCentralBtnTaps() async {
    _backgroundColorNotifier.value = generateColorFromRGB();
    ++_centralBtnConsequentTapsN;

    final timer = ref.read(colorGenerationScreenTimerProvider);
    timer.start();

    if (_centralBtnConsequentTapsN >= kMaxCentralBtnConsequentTapsN &&
        timer.isActive) {
      // counter resetting
      _centralBtnConsequentTapsN = 0;

      final String versionN =
          ref.read(dataFetchedOnStartProvider).packageInfo?.version ?? '';

      await showSimpleInfoDialog(
        context,
        titleStr: appVersionDialogTitle,
        contentStr: 'v $versionN',
      );
    }
  }
}

class _CentralButton extends StatelessWidget {
  final Color scaffoldBackgroundColor;
  final Future<void> Function() onTap;

  const _CentralButton({
    required this.onTap,
    required this.scaffoldBackgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final double minMqVal = min(mq.height, mq.width);

    final double centralBtnSize = (minMqVal > kMaxCentralSquareBtnSize * 2)
        ? kMaxCentralSquareBtnSize
        : minMqVal * 0.3;

    final bool isColorPerceivedAsBright = calculatePerceivedColorBrightness(
      scaffoldBackgroundColor,
    );

    final centralBtnColor = isColorPerceivedAsBright
        ? kHighPerceivedBrightnessCentralBtnColor
        : kLowPerceivedBrightnessCentralBtnColor;

    return Ink(
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
        onTap: onTap,
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
                fontSize: kGenericTextFontSize,
                color: isColorPerceivedAsBright
                    ? kHighPerceivedBrightnessCentralTextColor
                    : kLowPerceivedBrightnessCentralTextColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
