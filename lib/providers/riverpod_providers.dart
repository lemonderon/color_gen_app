import 'package:color_gen_app/models/data_fetched_on_start.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final dataFetchedOnStartProvider = Provider<DataFetchedOnStart>(
  (_) => const DataFetchedOnStart.empty(),
);