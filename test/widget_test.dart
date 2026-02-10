import 'package:flutter_test/flutter_test.dart';

import 'package:inspiro/main.dart';

void main() {
  testWidgets('Inspire Me button smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const InspiroApp());

    // Verify that we have a button "Inspire Me".
    expect(find.text('Inspire Me'), findsOneWidget);

    // Tap the 'Inspire Me' button and trigger a frame.
    await tester.tap(find.text('Inspire Me'));
    await tester.pumpAndSettle();

    // Verify that the button is still there (smoke test passed)
    expect(find.text('Inspire Me'), findsOneWidget);
  });
}
