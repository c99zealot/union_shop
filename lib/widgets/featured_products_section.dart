import 'package:flutter/material.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    final products = [
      {
        'title': 'Placeholder Product 1',
        'price': '£10.00',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      },
      {
        'title': 'Placeholder Product 2',
        'price': '£15.00',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      },
      {
        'title': 'Placeholder Product 3',
        'price': '£20.00',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      },
      {
        'title': 'Placeholder Product 4',
        'price': '£25.00',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text(
            'PRODUCTS',
            style: TextStyle(fontSize: 20, letterSpacing: 1),
          ),
          const SizedBox(height: 48),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isWide ? 2 : 1,
            crossAxisSpacing: 24,
            mainAxisSpacing: 48,
            children: products.map((product) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      product['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product['title']!,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['price']!,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}