import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String sortOrder = 'A-Z';

  bool showSaleOnly = false;

  static const int pageSize = 3;
  int currentPage = 0;

  final List<Product> allProducts = [
    Product(title: 'Purple Hoodie', basePrice: 35.0, imagePath: 'images/portsmouth_hoodie.png', isOnSale: true),
    Product(title: 'University T-Shirt', imagePath: 'images/portsmouth_tshirt.png', basePrice: 20.0),
    Product(title: 'Campus Tote Bag', imagePath: 'images/portsmouth_tote_bag.png', basePrice: 12.0),
    Product(title: 'Logo Mug', imagePath: 'images/portsmouth_mug.png', basePrice: 8.0, isOnSale: true),
    Product(title: 'Sticker Pack', imagePath: 'images/portsmouth_sticker_pack.png', basePrice: 3.0),
  ];

  void resetPagination() {
    currentPage = 0;
  }

  List<Product> get processedProducts {
    List<Product> products = List.from(allProducts);

    if (showSaleOnly) {
      products = products.where((p) => p.isOnSale).toList();
    }

    switch (sortOrder) {
      case 'Price: Low to High':
        products.sort((a, b) => a.basePrice.compareTo(b.basePrice));
        break;
      case 'Price: High to Low':
        products.sort((a, b) => b.basePrice.compareTo(a.basePrice));
        break;
      case 'A-Z':
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }

    return products;
  }

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
                          value: 'Price: Low to High',
                          child: Text('Price: Low to High'),
                        ),
                        DropdownMenuItem(
                          value: 'Price: High to Low',
                          child: Text('Price: High to Low'),
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              product.imagePath,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) {
                                return Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.grey[300],
                                  alignment: Alignment.center,
                                  child: const Icon(Icons.image_not_supported),
                                );
                              },
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
                                  '£${product.basePrice.toStringAsFixed(2)}',
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
                                    Navigator.pushNamed(
                                      context,
                                      '/product',
                                      arguments: product,
                                    );
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
