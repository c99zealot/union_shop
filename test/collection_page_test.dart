import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/models/product.dart';

void main() {
  Widget buildApp() {
    return MaterialApp(
      routes: {
        '/': (_) => const CollectionPage(),
        '/product': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          final product = args as Product;
          return Scaffold(body: Text('PRODUCT:${product.title}'));
        },
      },
    );
  }

  group('CollectionPage (product listings)', () {
    testWidgets('renders controls and first page of products', (tester) async {
      await tester.pumpWidget(buildApp());

      expect(find.text('Sort:'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsOneWidget);
      expect(find.text('Show sale products only'), findsOneWidget);

      expect(find.text('Campus Tote Bag'), findsOneWidget);
      expect(find.text('Logo Mug'), findsOneWidget);
      expect(find.text('Purple Hoodie'), findsOneWidget);

      expect(find.text('Sticker Pack'), findsNothing);
      expect(find.text('University T-Shirt'), findsNothing);
    });

    testWidgets('pagination shows next set of products', (tester) async {
      await tester.pumpWidget(buildApp());

      await tester.tap(find.text('Next'));
      await tester.pump();

      expect(find.text('Sticker Pack'), findsOneWidget);
      expect(find.text('University T-Shirt'), findsOneWidget);

      expect(find.text('Campus Tote Bag'), findsNothing);
    });

    testWidgets('sale-only filter limits products to sale items', (tester) async {
      await tester.pumpWidget(buildApp());

      await tester.tap(find.byType(CheckboxListTile));
      await tester.pump();

      expect(find.text('Purple Hoodie'), findsOneWidget);
      expect(find.text('Logo Mug'), findsOneWidget);

      expect(find.text('Campus Tote Bag'), findsNothing);
      expect(find.text('Sticker Pack'), findsNothing);
      expect(find.text('University T-Shirt'), findsNothing);
    });

    testWidgets('sorting by price low-to-high brings Sticker Pack onto first page', (tester) async {
      await tester.pumpWidget(buildApp());

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Price: Low to High').last);
      await tester.pump();

      expect(find.text('Sticker Pack'), findsOneWidget);
    });

    testWidgets('tapping View Product navigates to product route with correct argument', (tester) async {
      await tester.pumpWidget(buildApp());

      final viewButtons = find.widgetWithText(TextButton, 'View Product');
      expect(viewButtons, findsWidgets);

      await tester.tap(viewButtons.first);
      await tester.pumpAndSettle();

      expect(find.textContaining('PRODUCT:'), findsOneWidget);
    });
  });
}