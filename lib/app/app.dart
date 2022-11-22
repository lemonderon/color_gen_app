import 'package:color_gen_app/app/app_home_page.dart';
import 'package:color_gen_app/models/data_fetched_on_start.dart';
import 'package:color_gen_app/providers/riverpod_providers.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends StatelessWidget {
  final DataFetchedOnStart dataFetchedOnStart;

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
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Random color generator',
        home: AppHomePage(),
      ),
    );
  }
}
