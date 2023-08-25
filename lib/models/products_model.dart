class Product {
  final String title;
  final String? imageUrl;
  final int? price;

  Product({
    required this.title,
    this.imageUrl,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      imageUrl: json['imageUrl'],
      price: json['price'],
    );
  }
}
