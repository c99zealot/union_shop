import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/pages/cart_page.dart';
import 'package:union_shop/services/cart_service.dart';

void main() {
  final product = Product(
    title: 'Cart Test Mug',
    basePrice: 8.00,
    isOnSale: true,
    imagePath: 'images/portsmouth_mug.png',
  );

  Widget buildApp(CartService cart) {
    return ChangeNotifierProvider<CartService>.value(
      value: cart,
      child: const MaterialApp(
        home: CartPage(),
      ),
    );
  }

  group('CartPage', () {
    testWidgets('shows empty state when cart has no items', (tester) async {
      final cart = CartService();
      await tester.pumpWidget(buildApp(cart));

      expect(find.text('Your Cart'), findsOneWidget);
      expect(find.text('Your cart is empty'), findsOneWidget);
    });

    testWidgets('shows items and updates total when quantity changes', (tester) async {
      final cart = CartService();
      cart.addItem(CartItem(product: product, size: 'M', quantity: 1));

      await tester.pumpWidget(buildApp(cart));
      await tester.pump(); // allow provider rebuilds

      expect(find.text('Cart Test Mug'), findsOneWidget);

      expect(find.text('Total: £8.00'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add).first);
      await tester.pump();

      expect(find.text('Total: £16.00'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.remove).first);
      await tester.pump();

      expect(find.text('Total: £8.00'), findsOneWidget);
    });

    testWidgets('delete removes item from cart and shows empty state', (tester) async {
      final cart = CartService();
      cart.addItem(CartItem(product: product, size: 'M', quantity: 1));

      await tester.pumpWidget(buildApp(cart));
      await tester.pump();

      expect(find.text('Cart Test Mug'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete).first);
      await tester.pump();

      expect(find.text('Your cart is empty'), findsOneWidget);
    });
  });
}