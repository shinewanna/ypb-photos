import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:ypb_photos/app/modules/photos/widgets/photo.dart';
import 'package:ypb_photos/app/modules/widgets/custom_textfield.dart';
import 'package:ypb_photos/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Full app test', (tester) async {
    app.main();
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.drag(find.byType(Slider), Offset(100, 0));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.enterText(find.byType(CustomTextField).last, '1080');
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.tap(find.byType(DropdownButton<int>));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.tap(find.byKey(Key('1')).last, warnIfMissed: false);
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(Duration(seconds: 3));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(Duration(seconds: 10));
    await tester.tap(find.byType(Photo).first);
    await tester.pumpAndSettle(Duration(seconds: 3));
  });
}
