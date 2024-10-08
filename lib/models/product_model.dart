class ProductModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final String category;
  final double rating;
  final int ratingCount;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.rating,
    required this.ratingCount
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'].toDouble(),
      category: json['category'],
      rating: json['rating']['rate'].toDouble(),
      ratingCount: json['rating']['count'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'description': description,
      'price': price,
      'category': category,
      'rating': rating,
      'ratingCount': ratingCount,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      description: map['description'],
      price: map['price'],
      category: map['category'],
      rating: map['rating'],
      ratingCount: map['ratingCount'],
    );
  }
}