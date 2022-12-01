import 'package:package_info_plus/package_info_plus.dart';

/// Model containing data fetched on app's startup.
class DataFetchedOnStart {
  /// Received [PackageInfo] from startup.
  final PackageInfo? packageInfo;

  /// Constructor with only [packageInfo] received from startup.
  const DataFetchedOnStart({
    required this.packageInfo,
  });

  /// Constructor used for the use in providers.
  /// Creates class with empty values.
  const DataFetchedOnStart.empty() : packageInfo = null;
}
