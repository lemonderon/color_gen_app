import 'package:color_gen_app/app/app.dart';
import 'package:color_gen_app/init/error_handling.dart';
import 'package:color_gen_app/models/data_fetched_on_start.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Whether [DevicePreview] MediaQuery simulation is activated.
const kDevicesPreviewIsActive = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeErrorHandling();

  final dataFetchedOnStart = DataFetchedOnStart(
    packageInfo: await PackageInfo.fromPlatform(),
  );

  runApp(
    DevicePreview(
      enabled: kDevicesPreviewIsActive && !kReleaseMode,
      builder: (context) => App(
        dataFetchedOnStart: dataFetchedOnStart,
      ),
    ),
  );
}
