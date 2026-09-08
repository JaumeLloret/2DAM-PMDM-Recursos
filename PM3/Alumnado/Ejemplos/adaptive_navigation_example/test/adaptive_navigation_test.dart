import 'package:adaptive_navigation_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> setSize(WidgetTester tester, Size size) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  testWidgets('uses NavigationBar in compact space', (tester) async {
    await setSize(tester, const Size(390, 800));
    await tester.pumpWidget(const AdaptiveExampleApp());
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
  });

  testWidgets('uses NavigationRail in wide space', (tester) async {
    await setSize(tester, const Size(900, 700));
    await tester.pumpWidget(const AdaptiveExampleApp());
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });
}

