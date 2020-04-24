import 'package:flutter_test/flutter_test.dart';
import 'package:schoolable_demo/main.dart';
import 'package:flutter/material.dart';



void main() {
  testWidgets('scholable demo test', (WidgetTester tester)
  async {

// Find textfield in the App
    await tester.pumpWidget(MyApp());
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    
// Test that PTA Meeting comments are present on the screen
  expect(find.text('PTA Meeting'), findsOneWidget);
  expect(find.byType(SliverAppBar), findsOneWidget);

// Test that text entered appears on the screen
    await tester.enterText(textField, 'Good day Teachers');
    expect(find.text('Good day Teachers'), findsOneWidget);
    var button = find.byIcon(Icons.near_me);
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump(new Duration(milliseconds: 400));
    expect(find.text('Good day Teachers'), findsOneWidget);

//  Test on sufficient scroll that PTA Meeting disappears and comment is the current header
    await tester.enterText(textField, 'Good day Teachers');
    await tester.tap(button);
    await tester.pump(new Duration(milliseconds: 400));


    await tester.enterText(textField, 'Schoolable combines school fees collection, expense management and online business banking all in one place');
    await tester.tap(button);
    await tester.pump(new Duration(milliseconds: 400));

    await tester.enterText(textField, 'Schoolable combines school fees collection, expense management and online business banking all in one place');
    await tester.tap(button);
    await tester.pump(new Duration(milliseconds: 400));

    await tester.enterText(textField, 'Schoolable combines school fees collection, expense management and online business banking all in one place');
    await tester.tap(button);
    await tester.pump(new Duration(milliseconds: 400));


    final gesture = await tester.startGesture(Offset(0, 300));
    await gesture.moveBy(Offset(0, -700));
    await tester.pumpAndSettle();

    // check is PTA meeting leaves the screen and Comments is still on screen
    expect(find.text('PTA Meeting'), findsNothing);
    expect(find.byType(SliverAppBar), findsOneWidget);


  });
}