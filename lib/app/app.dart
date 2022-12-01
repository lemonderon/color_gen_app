import 'package:color_gen_app/models/data_fetched_on_start.dart';
import 'package:color_gen_app/providers/riverpod_providers.dart';
import 'package:color_gen_app/screens/home_screen/color_generation_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Material App creation screen.
class App extends StatelessWidget {
  /// Received data from startup.
  final DataFetchedOnStart dataFetchedOnStart;

  /// Creates new MaterialApp to be run
  const App({
    required this.dataFetchedOnStart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        dataFetchedOnStartProvider.overrideWithValue(dataFetchedOnStart),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Random color generator',
        home: const ColorGenerationScreen(),
      ),
    );
  }
}
