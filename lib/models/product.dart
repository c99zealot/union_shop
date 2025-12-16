class Product {
  final String title;
  final double price;
  final bool isOnSale;

  Product({
    required this.title,
    required this.price,
    this.isOnSale = false,
  });
}
