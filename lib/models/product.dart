class Product {
  final String title;
  final double basePrice;
  final bool isOnSale;
  final String imagePath;

  Product({
    required this.title,
    required this.basePrice,
    required this.imagePath,
    this.isOnSale = false,
  });
}
