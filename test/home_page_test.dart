import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/home_page.dart';

void main() {
  Widget buildTestableHome() {
    return const MaterialApp(
      home: HomePage(),
    );
  }

  group('HomePage Widget Tests', () {
    testWidgets('HomePage renders without errors', (tester) async {
      await tester.pumpWidget(buildTestableHome());

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('HeaderSection is displayed', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1200, 800);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });

      await tester.pumpWidget(buildTestableHome());

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Collections'), findsOneWidget);
      expect(find.text('Sale'), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('View cart'), findsOneWidget);
    });

    testWidgets('HeroSection headline text is displayed', (tester) async {
      await tester.pumpWidget(buildTestableHome());

      expect(find.text('Welcome to The Union Shop!'), findsOneWidget);
      expect(find.text("UoP Students' Union Shop"), findsOneWidget);
    });

    testWidgets('Featured products section is displayed', (tester) async {
      await tester.pumpWidget(buildTestableHome());

      expect(find.text('Featured Products'), findsOneWidget);

      expect(find.text('Purple Hoodie'), findsOneWidget);
      expect(find.text('University T-Shirt'), findsOneWidget);
      expect(find.text('Campus Tote Bag'), findsOneWidget);
      expect(find.text('University Mug'), findsOneWidget);
    });

    testWidgets('Featured products are tappable', (tester) async {
      await tester.pumpWidget(buildTestableHome());

      final tappableProducts = find.byType(InkWell);

      expect(tappableProducts, findsWidgets);

      await tester.tap(tappableProducts.first);
      await tester.pump();
    });

    testWidgets('FooterSection is displayed with expected links', (tester) async {
      await tester.pumpWidget(buildTestableHome());

      expect(find.text('Union Shop'), findsOneWidget);
      expect(find.text('About Us'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
      expect(find.text('Privacy Policy'), findsOneWidget);
      expect(find.text('Terms & Conditions'), findsOneWidget);
    });

    testWidgets('HeaderSection shows mobile layout on small screens',
      (tester) async {
        tester.binding.window.physicalSizeTestValue = const Size(375, 800);
        tester.binding.window.devicePixelRatioTestValue = 1.0;

        addTearDown(() {
          tester.binding.window.clearPhysicalSizeTestValue();
          tester.binding.window.clearDevicePixelRatioTestValue();
        });

        await tester.pumpWidget(buildTestableHome());

        expect(find.text('Home'), findsNothing);
        expect(find.text('Collections'), findsNothing);
        expect(find.text('Sale'), findsNothing);
        expect(find.text('Sign In'), findsNothing);
        expect(find.text('View cart'), findsNothing);

        expect(find.byIcon(Icons.search), findsOneWidget);
        expect(find.byIcon(Icons.person_outline), findsOneWidget);
        expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
        expect(find.byIcon(Icons.menu), findsOneWidget);
      });
  });
}