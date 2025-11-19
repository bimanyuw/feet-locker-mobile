class Product {
  final String id;
  final String name;
  final int price;
  final String description;
  final String thumbnail;
  final String category;
  final bool isFeatured;
  final int stock;
  final String brand;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    required this.stock,
    required this.brand,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      description: json['description'] as String? ?? "",
      thumbnail: json['thumbnail'] as String? ?? "",
      category: json['category'] as String? ?? "",
      isFeatured: json['is_featured'] as bool? ?? false,
      stock: json['stock'] as int? ?? 0,
      brand: json['brand'] as String? ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
