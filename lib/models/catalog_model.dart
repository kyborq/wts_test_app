class Catalog {
  final int categoryId;
  final String title;
  final String imageUrl;

  Catalog({
    required this.categoryId,
    required this.title,
    required this.imageUrl,
  });

  factory Catalog.fromJson(Map<String, dynamic> json) {
    return Catalog(
      categoryId: json['categoryId'],
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }
}
