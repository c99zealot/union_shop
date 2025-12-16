import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collections_page.dart';

void main() {
  Widget buildApp() {
    return const MaterialApp(
      home: CollectionsPage(),
    );
  }

  group('CollectionsPage', () {
    testWidgets('renders app bar and controls', (tester) async {
      await tester.pumpWidget(buildApp());

      expect(find.text('Collections'), findsOneWidget);
      expect(find.text('Sort:'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsOneWidget);
      expect(find.text('Show sale collections only'), findsOneWidget);

      expect(find.text('Previous'), findsOneWidget);
      expect(find.text('Next'), findsOneWidget);
      expect(find.textContaining('Page '), findsOneWidget);
    });

    testWidgets('pagination switches between pages', (tester) async {
      await tester.pumpWidget(buildApp());

      expect(find.text('Accessories'), findsOneWidget);
      expect(find.text('Autumn Favourites'), findsOneWidget);
      expect(find.text('Filler 1'), findsOneWidget);

      await tester.tap(find.text('Next'));
      await tester.pump();

      expect(find.text('Filler 3'), findsOneWidget);
      expect(find.text('Filler 4'), findsOneWidget);
      expect(find.text('Filler 5'), findsOneWidget);

      await tester.tap(find.text('Previous'));
      await tester.pump();

      expect(find.text('Accessories'), findsOneWidget);
      expect(find.text('Autumn Favourites'), findsOneWidget);
      expect(find.text('Filler 1'), findsOneWidget);
    });

    testWidgets('sale-only filter shows only Sale Items when checked', (tester) async {
      await tester.pumpWidget(buildApp());

      await tester.tap(find.byType(CheckboxListTile));
      await tester.pump();

      expect(find.text('Sale Items'), findsOneWidget);
      expect(find.text('Accessories'), findsNothing);
      expect(find.text('Autumn Favourites'), findsNothing);
      expect(find.text('Hoodies & Sweatshirts'), findsNothing);
    });

    testWidgets('sorting dropdown changes which items appear on first page', (tester) async {
      await tester.pumpWidget(buildApp());

      expect(find.text('Accessories'), findsOneWidget);
      expect(find.text('Autumn Favourites'), findsOneWidget);
      expect(find.text('Filler 1'), findsOneWidget);

      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Z-A').last);
      await tester.pump();

      expect(find.text('Sale filler 8'), findsOneWidget);
      expect(find.text('Sale filler 7'), findsOneWidget);
      expect(find.text('Sale filler 6'), findsOneWidget);
    });
  });
}
