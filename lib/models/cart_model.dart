class CartModel {
  final String productid;
  final String title;
  final String category;
  final double price;
  final String imagepath;
  int item; // The quantity of the item

  CartModel({
    required this.productid,
    required this.title,
    required this.category,
    required this.price,
    required this.imagepath,
    required this.item,
  });

  // Convert CartModel to a Map for JSON encoding
  Map<String, dynamic> toJson() {
    return {
      'productid': productid,
      'title': title,
      'category': category,
      'price': price,
      'imagepath': imagepath,
      'item': item,
    };
  }

  // Convert Map to CartModel
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productid: json['productid'],
      title: json['title'],
      category: json['category'],
      price: json['price'],
      imagepath: json['imagepath'],
      item: json['item'],
    );
  }
}
