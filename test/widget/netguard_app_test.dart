import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netguard/app.dart';

void main() {
  testWidgets('NetGuardApp renders onboarding screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: NetGuardApp()));

    expect(find.textContaining('Take control'), findsOneWidget);
    expect(find.byType(FilledButton), findsOneWidget);
  });
}
