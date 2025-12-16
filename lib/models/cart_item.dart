import 'product.dart';

class CartItem {
  final Product product;
  String size;
  int quantity;

  CartItem({
    required this.product,
    required this.size,
    required this.quantity,
  });

  double get unitPrice {
    const sizeModifiers = {
      'S': 0.0,
      'M': 0.0,
      'L': 2.0,
      'XL': 4.0,
    };

    return product.basePrice + (sizeModifiers[size] ?? 0.0);
  }

  double get totalPrice => unitPrice * quantity;
}
