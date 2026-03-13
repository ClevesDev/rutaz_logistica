// This is a basic Flutter widget test.
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rutaz/app.dart';

void main() {
  testWidgets('RutaZ smoke test', (WidgetTester tester) async {
    // Build our app with ProviderScope and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: RutaZApp()));

    // Verify that our welcome text is present.
    expect(find.text('RutaZ: Logistics Dashboard'), findsOneWidget);
  });
}
