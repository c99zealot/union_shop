import 'package:flutter/material.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final collections = [
      {
        'title': 'Autumn Favourites',
        'description': 'Popular items for the autumn season',
      },
      {
        'title': 'Hoodies & Sweatshirts',
        'description': 'Official University hoodies and sweatshirts',
      },
      {
        'title': 'Accessories',
        'description': 'Bags, mugs, and more',
      },
      {
        'title': 'Sale Items',
        'description': 'Discounted products and offers',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: collections.length,
        itemBuilder: (context, index) {
          final collection = collections[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      collection['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      collection['description']!,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Collection page not implemented yet'),
                          ),
                        );
                      },
                      child: const Text('View Collection'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}