import 'package:color_gen_app/models/data_fetched_on_start.dart';
import 'package:color_gen_app/screens/home_screen/color_generation_screen_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pausable_timer/pausable_timer.dart';

/// Used to access prefetched app's data which was fetched
/// on startup sequence.
final dataFetchedOnStartProvider = Provider<DataFetchedOnStart>(
  (_) => const DataFetchedOnStart.empty(),
);

/// Creates [PausableTimer] which is to be used in color generation screens.
/// Timer duration is [kConsequentBtnTapsRegistrationTime].
final colorGenerationScreenTimerProvider = Provider.autoDispose<PausableTimer>(
  (_) => PausableTimer(kConsequentBtnTapsRegistrationTime, () {
    return;
  }),
);
