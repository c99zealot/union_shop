import 'package:flutter/material.dart';
import 'package:union_shop/models/product.dart';

class FeaturedProductsSection extends StatelessWidget {
  const FeaturedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    final List<Product> featuredProducts = [
      Product(
        title: 'Purple Hoodie',
        basePrice: 35.00,
        isOnSale: true,
        imagePath: 'images/portsmouth_hoodie.png',
      ),
      Product(
        title: 'University T-Shirt',
        basePrice: 20.00,
        imagePath: 'images/portsmouth_tshirt.png',
      ),
      Product(
        title: 'Campus Tote Bag',
        basePrice: 12.00,
        imagePath: 'images/portsmouth_tote_bag.png',
      ),
      Product(
        title: 'University Mug',
        basePrice: 8.00,
        imagePath: 'images/portsmouth_mug.png',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text(
            'Featured Products',
            style: TextStyle(fontSize: 20, letterSpacing: 1),
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isWide ? 2 : 1,
              crossAxisSpacing: 24,
              mainAxisSpacing: 48,
              childAspectRatio: 0.75,
            ),
            itemCount: featuredProducts.length,
            itemBuilder: (context, index) {
              final product = featuredProducts[index];

              return Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/product',
                      arguments: product,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            product.imagePath,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) {
                              return Container(
                                color: Colors.grey[300],
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        product.title,
                        style: const TextStyle(fontSize: 14),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        '£${product.basePrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 13),
                      ),

                      if (product.isOnSale)
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            'On Sale',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
