import 'package:package_info_plus/package_info_plus.dart';


class DataFetchedOnStart {
  final PackageInfo? packageInfo;

  const DataFetchedOnStart({
    required this.packageInfo,
  });

  const DataFetchedOnStart.empty() : packageInfo = null;
}
