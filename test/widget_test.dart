import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:state_managment/main.dart';

void main() {
  testWidgets('password is hidden initially and can be revealed', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final passwordField = find.byType(TextField).last;
    expect(tester.widget<TextField>(passwordField).obscureText, isTrue);
    expect(find.byIcon(Icons.visibility_off), findsOneWidget);

    await tester.enterText(passwordField, 'secret');
    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pump();

    expect(tester.widget<TextField>(passwordField).obscureText, isFalse);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
    expect(
      tester
          .widget<EditableText>(find.byType(EditableText).last)
          .controller
          .text,
      'secret',
    );
  });
}
