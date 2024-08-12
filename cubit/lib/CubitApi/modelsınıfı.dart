class Product {
  int? id;
  String? title;
  String? description;
  double? price; 
  double? discountPercentage; 
  double? rating; 
  int? stock;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'] as double,
      discountPercentage: (json['discountPercentage'] is int) ? (json['discountPercentage'] as int).toDouble() : json['discountPercentage'] as double,
      rating: (json['rating'] is int) ? (json['rating'] as int).toDouble() : json['rating'] as double,
      stock: json['stock'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'thumbnail': thumbnail,
    };
  }
}
