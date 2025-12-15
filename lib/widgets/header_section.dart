import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  void placeholderCallback() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'Lorem Ipsum',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.network(
                    'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                    height: 18,
                    errorBuilder: (_, __, ___) {
                      return const Icon(Icons.image_not_supported, size: 18);
                    },
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search, size: 18),
                        onPressed: placeholderCallback,
                      ),
                      IconButton(
                        icon: const Icon(Icons.person_outline, size: 18),
                        onPressed: placeholderCallback,
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_bag_outlined, size: 18),
                        onPressed: placeholderCallback,
                      ),
                      IconButton(
                        icon: const Icon(Icons.menu, size: 18),
                        onPressed: placeholderCallback,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}