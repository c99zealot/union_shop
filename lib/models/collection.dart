class Collection {
  final String title;
  final String description;
  final bool isSale;

  Collection({
    required this.title,
    required this.description,
    this.isSale = false,
  });
}