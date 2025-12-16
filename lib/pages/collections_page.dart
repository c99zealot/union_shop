import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  String sortOrder = 'A–Z';

  final List<Collection> allCollections = [
    Collection(
      title: 'Autumn Favourites',
      description: 'Popular items for the autumn season',
    ),
    Collection(
      title: 'Hoodies & Sweatshirts',
      description: 'Official University hoodies and sweatshirts',
    ),
    Collection(
      title: 'Accessories',
      description: 'Bags, mugs, and more',
    ),
    Collection(
      title: 'Sale Items',
      description: 'Discounted products and offers',
      isSale: true,
    ),
  ];

  List<Collection> get sortedCollections {
    final collections = List<Collection>.from(allCollections);

    if (sortOrder == 'A–Z') {
      collections.sort((a, b) => a.title.compareTo(b.title));
    } else if (sortOrder == 'Z–A') {
      collections.sort((a, b) => b.title.compareTo(a.title));
    }

    return collections;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Sort control
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text(
                  'Sort:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: sortOrder,
                  items: const [
                    DropdownMenuItem(
                      value: 'A–Z',
                      child: Text('A–Z'),
                    ),
                    DropdownMenuItem(
                      value: 'Z–A',
                      child: Text('Z–A'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        sortOrder = value;
                      });
                    }
                  },
                ),
              ],
            ),
          ),

          // Collections list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: sortedCollections.length,
              itemBuilder: (context, index) {
                final collection = sortedCollections[index];

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
                        children: [
                          Text(
                            collection.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(collection.description),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () {
                              if (collection.isSale) {
                                Navigator.pushNamed(context, '/sale');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Collection page not implemented yet'),
                                  ),
                                );
                              }
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
          ),
        ],
      ),
    );
  }
}
