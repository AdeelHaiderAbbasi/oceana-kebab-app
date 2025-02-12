class Products {
  Products({
    required this.gifts,
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.subCategory,
    required this.shortDescription,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.extra,
    required this.smallPrice,
    required this.mediumPrice,
    required this.largePrice,
  });

  final List<String> gifts;
  final String? id;
  final String? name;
  final int? price;
  final String? category;
  final String? subCategory;
  final String? shortDescription;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final List<Extra> extra;
  final int? smallPrice;
  final int? mediumPrice;
  final int? largePrice;

  factory Products.fromJson(Map<String, dynamic> json){
    return Products(
      gifts: json["gifts"] == null ? [] : List<String>.from(json["gifts"]!.map((x) => x)),
      id: json["_id"],
      name: json["name"],
      price: json["price"],
      category: json["category"],
      subCategory: json["subCategory"],
      shortDescription: json["shortDescription"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      extra: json["extra"] == null ? [] : List<Extra>.from(json["extra"]!.map((x) => Extra.fromJson(x))),
      smallPrice: json["small_price"],
      mediumPrice: json["medium_price"],
      largePrice: json["large_price"],
    );
  }

}

class Extra {
  Extra({
    required this.name,
    required this.price,
    required this.id,
  });

  final String? name;
  final String? price;
  final String? id;

  factory Extra.fromJson(Map<String, dynamic> json){
    return Extra(
      name: json["name"],
      price: json["price"],
      id: json["_id"],
    );
  }

}
