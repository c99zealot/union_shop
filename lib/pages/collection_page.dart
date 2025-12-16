import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  // Sorting
  String sortOrder = 'A–Z';

  // Filtering
  bool showSaleOnly = false;

  // Pagination
  static const int pageSize = 3;
  int currentPage = 0;

  final List<Product> allProducts = [
    Product(title: 'Purple Hoodie', price: 35.0, isOnSale: true),
    Product(title: 'University T-Shirt', price: 20.0),
    Product(title: 'Campus Tote Bag', price: 12.0),
    Product(title: 'Logo Mug', price: 8.0, isOnSale: true),
    Product(title: 'Sticker Pack', price: 3.0),
  ];

  void resetPagination() {
    currentPage = 0;
  }

  /// FILTER + SORT
  List<Product> get processedProducts {
    List<Product> products = List.from(allProducts);

    // Filter: sale only when checked
    if (showSaleOnly) {
      products = products.where((p) => p.isOnSale).toList();
    }

    // Sort
    switch (sortOrder) {
      case 'Price: Low → High':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High → Low':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'A–Z':
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }

    return products;
  }

  /// PAGINATION
  List<Product> get paginatedProducts {
    final start = currentPage * pageSize;
    final end = start + pageSize;

    if (start >= processedProducts.length) return [];

    return processedProducts.sublist(
      start,
      end > processedProducts.length
          ? processedProducts.length
          : end,
    );
  }

  int get totalPages =>
      (processedProducts.length / pageSize).ceil().clamp(1, 999);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Products'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Column(
        children: [
          // Controls
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sort
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
                          value: 'A–Z',
                          child: Text('A–Z'),
                        ),
                        DropdownMenuItem(
                          value: 'Price: Low → High',
                          child: Text('Price: Low → High'),
                        ),
                        DropdownMenuItem(
                          value: 'Price: High → Low',
                          child: Text('Price: High → Low'),
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

                // Filter
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Show sale products only'),
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

          // Product list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: paginatedProducts.length,
              itemBuilder: (context, index) {
                final product = paginatedProducts[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image placeholder
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.image,
                              color: Colors.grey,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '£${product.price.toStringAsFixed(2)}',
                                ),
                                if (product.isOnSale)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      'On Sale',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 8),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/product');
                                  },
                                  child: const Text('View Product'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Pagination controls
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
