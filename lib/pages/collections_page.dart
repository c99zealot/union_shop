import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  String sortOrder = 'A-Z';

  bool showSaleOnly = false;

  static const int pageSize = 4;
  int currentPage = 0;

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
    Collection(
      title: 'Sale filler 1',
      description: 'Sale filler',
      isSale: true,
    ),
    Collection(
      title: 'Sale filler 2',
      description: 'Sale filler',
      isSale: true,
    ),
    Collection(
      title: 'Sale filler 3',
      description: 'Sale filler',
      isSale: true,
    ),
    Collection(
      title: 'Sale filler 4',
      description: 'Sale filler',
      isSale: true,
    ),
    Collection(
      title: 'Sale filler 5',
      description: 'Sale filler',
      isSale: true,
    ),
    Collection(
      title: 'Sale filler 6',
      description: 'Sale filler',
      isSale: true,
    ),
    Collection(
      title: 'Sale filler 7',
      description: 'Sale filler',
      isSale: true,
    ),
    Collection(
      title: 'Sale filler 8',
      description: 'Sale filler',
      isSale: true,
    ),
    Collection(
      title: 'Filler 1',
      description: 'Sale filler',
    ),
    Collection(
      title: 'Filler 2',
      description: 'Sale filler',
    ),
    Collection(
      title: 'Filler 3',
      description: 'Sale filler',
    ),
    Collection(
      title: 'Filler 4',
      description: 'Sale filler',
    ),
    Collection(
      title: 'Filler 5',
      description: 'Sale filler',
    ),
    Collection(
      title: 'Filler 6',
      description: 'Sale filler',
    ),
    Collection(
      title: 'Filler 7',
      description: 'Sale filler',
    ),
    Collection(
      title: 'Filler 8',
      description: 'Sale filler',
    ),
  ];

  void resetPagination() {
    currentPage = 0;
  }

  List<Collection> get processedCollections {
    List<Collection> collections = List.from(allCollections);

    if (showSaleOnly) {
      collections = collections.where((c) => c.isSale).toList();
    }

    if (sortOrder == 'A-Z') {
      collections.sort((a, b) => a.title.compareTo(b.title));
    } else {
      collections.sort((a, b) => b.title.compareTo(a.title));
    }

    return collections;
  }

  List<Collection> get paginatedCollections {
    final start = currentPage * pageSize;
    final end = start + pageSize;

    if (start >= processedCollections.length) return [];

    return processedCollections.sublist(
      start,
      end > processedCollections.length
          ? processedCollections.length
          : end,
    );
  }

  int get totalPages =>
      (processedCollections.length / pageSize).ceil().clamp(1, 999);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                          value: 'A-Z',
                          child: Text('A-Z'),
                        ),
                        DropdownMenuItem(
                          value: 'Z-A',
                          child: Text('Z-A'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          sortOrder = value;
                          resetPagination();
                        });
                      },
                    ),
                  ],
                ),

                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Show sale collections only'),
                  value: showSaleOnly,
                  onChanged: (value) {
                    setState(() {
                      showSaleOnly = value ?? false;
                      resetPagination();
                    });
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: paginatedCollections.length,
              itemBuilder: (context, index) {
                final collection = paginatedCollections[index];

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
                                Navigator.pushNamed(context, '/collection');
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

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: currentPage > 0
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        }
                      : null,
                  child: const Text('Previous'),
                ),
                const SizedBox(width: 16),
                Text('Page ${currentPage + 1} of $totalPages'),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: currentPage < totalPages - 1
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
