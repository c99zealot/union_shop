import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purple Hoodie'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Product image
          Container(
            height: 250,
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

          // Product title
          const Text(
            'Purple Hoodie',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // Price
          const Text(
            '£35.00',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 16),

          // Description
          const Text(
            'A comfortable purple hoodie featuring the word "Portsmouth". '
            'Perfect for everyday wear and official university events.',
            style: TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 24),

          // Size selector (dummy)
          const Text(
            'Size',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            items: const [
              DropdownMenuItem(value: 'S', child: Text('Small')),
              DropdownMenuItem(value: 'M', child: Text('Medium')),
              DropdownMenuItem(value: 'L', child: Text('Large')),
              DropdownMenuItem(value: 'XL', child: Text('Extra Large')),
            ],
            onChanged: (value) {},
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select size',
            ),
          ),

          const SizedBox(height: 24),

          // Quantity selector (dummy)
          const Text(
            'Quantity',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<int>(
            items: List.generate(
              5,
              (index) => DropdownMenuItem(
                value: index + 1,
                child: Text('${index + 1}'),
              ),
            ),
            onChanged: (value) {},
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select quantity',
            ),
          ),

          const SizedBox(height: 32),

          // Add to cart button (dummy)
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Add to cart not implemented yet'),
                ),
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