import 'package:color_gen_app/app/app.dart';
import 'package:color_gen_app/models/data_fetched_on_start.dart';
import 'package:color_gen_app/screens/home_screen/color_generation_screen.dart';
import 'package:color_gen_app/screens/home_screen/color_generation_screen_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Text "$kHomePageCentralBtnText" is present in the home screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const App(
          dataFetchedOnStart: DataFetchedOnStart.empty(),
        ),
      );

      expect(find.text(kHomePageCentralBtnText), findsOneWidget);
    },
  );
  testWidgets("App's version is shown on multiple consequent taps",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const App(
        dataFetchedOnStart: DataFetchedOnStart.empty(),
      ),
    );

    final centralBtnFinder = find.byKey(
      ColorGenerationScreen.centralButtonKey,
    );
    expect(centralBtnFinder, findsOneWidget);

    for (int i = 0; i < kMaxCentralBtnConsequentTapsN; ++i) {
      await tester.tap(centralBtnFinder);
    }
    await tester.pump();
    expect(find.text(appVersionDialogTitle), findsOneWidget);
  });
}
