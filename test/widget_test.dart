import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ypb_photos/app/routes/app_pages.dart';
import 'package:ypb_photos/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Widget Test', () {
    testWidgets('Splash View', (tester) async {
      AppPages.INITIAL = Routes.SPLASH;
      await tester.pumpWidget(PrePage());
      await tester.pump();
      //* Check logo appear
      expect(find.byType(FlutterLogo), findsOneWidget);
      //* Check start button appear
      expect(find.text('Start'), findsOneWidget);
      //* Check app name is right
      expect(find.text('YPB Photos'), findsOneWidget);
    });
  });
}
