class Product {
  final String title;
  final double basePrice;
  final bool isOnSale;

  Product({
    required this.title,
    required this.basePrice,
    this.isOnSale = false,
  });
}