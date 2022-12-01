import 'package:color_gen_app/models/data_fetched_on_start.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [Provider] used to access prefetched app's data which was fetched
/// on startup sequence.
final dataFetchedOnStartProvider = Provider<DataFetchedOnStart>(
  (_) => const DataFetchedOnStart.empty(),
);
