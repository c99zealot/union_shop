import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';
import '../models/cart_item.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Example product (model-driven)
  final Product product = Product(
    title: 'Purple Hoodie',
    basePrice: 35.00,
    isOnSale: true,
  );

  // State
  String selectedSize = 'M';
  int quantity = 1;

  // Size price modifiers
  final Map<String, double> sizeModifiers = {
    'S': 0.0,
    'M': 0.0,
    'L': 2.0,
    'XL': 4.0,
  };

  double get unitPrice =>
      product.basePrice + (sizeModifiers[selectedSize] ?? 0.0);

  double get totalPrice => unitPrice * quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Image placeholder
          Container(
            height: 260,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.image,
              size: 80,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 24),

          // Title
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // Sale badge
          if (product.isOnSale)
            const Text(
              'On Sale',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

          const SizedBox(height: 16),

          // Unit price
          Text(
            '£${unitPrice.toStringAsFixed(2)} per item',
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 24),

          // Size selector
          const Text(
            'Size',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedSize,
            items: sizeModifiers.keys
                .map(
                  (size) => DropdownMenuItem(
                    value: size,
                    child: Text(size),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                selectedSize = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 24),

          // Quantity selector
          const Text(
            'Quantity',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                onPressed: quantity > 1
                    ? () {
                        setState(() {
                          quantity--;
                        });
                      }
                    : null,
                icon: const Icon(Icons.remove),
              ),
              Text(
                quantity.toString(),
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Total price
          Text(
            'Total: £${totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 32),

          // Add to cart
          ElevatedButton(
            onPressed: () {
              Provider.of<CartService>(context, listen: false).addItem(
                CartItem(
                  product: product,
                  size: selectedSize,
                  quantity: quantity,
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to cart')),
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4d2963),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              'Add to Cart',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
