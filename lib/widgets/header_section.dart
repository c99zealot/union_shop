import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  void placeholderCallback() {}

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
          ),

          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Image.asset(
                  'images/union_logo.png',
                  height: 32,
                  errorBuilder: (_, __, ___) {
                    return const Icon(Icons.image_not_supported, size: 32);
                  },
                ),

                const SizedBox(width: 24),

                if (isDesktop) ...[
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Home'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/collections');
                    },
                    child: const Text('Collections'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sale');
                    },
                    child: const Text('Sale'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth');
                    },
                    child: const Text('Sign In'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: const Text('View cart'),
                  ),
                ],

                const Spacer(),

                if (!isDesktop) ...[
                  IconButton(
                    icon: const Icon(Icons.search, size: 20),
                    onPressed: placeholderCallback,
                  ),
                  IconButton(
                    icon: const Icon(Icons.person_outline, size: 20),
                    onPressed: placeholderCallback,
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined, size: 20),
                    onPressed: placeholderCallback,
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu, size: 20),
                    onPressed: placeholderCallback,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}