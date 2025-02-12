class Products {
  Products({
    required this.productid,
    required this.title,
    required this.category,
    required this.imagepath,
    required this.price,
  });

  final String? productid;
  final String? title;
  final String? category;
  final String? imagepath;
  final double? price;

  factory Products.fromJson(Map<String, dynamic> json){
    return Products(
      productid: json["productid"],
      title: json["title"],
      category: json["category"],
      imagepath: json["imagepath"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
    "productid": productid,
    "title": title,
    "category": category,
    "imagepath": imagepath,
    "price": price,
  };

}
