class Address {
  Address({
    required this.guestId,
    required this.houseNo,
    required this.street,
    required this.city,
    required this.postcode,
    required this.instructions,
    required this.appartmentName,
    required this.floor,
    required this.buildingName,
    required this.entryCode,
    required this.businessName,
    required this.hotelName,
    required this.business,
  });

  final String? guestId;
  final String? houseNo;
  final String? street;
  final String? city;
  final String? postcode;
  final String? instructions;
  final String? appartmentName;
  final String? floor;
  final String? buildingName;
  final String? entryCode;
  final String? businessName;
  final String? hotelName;
  final String? business;

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      guestId: json["guest_id"],
      houseNo: json["house_no"],
      street: json["street"],
      city: json["city"],
      postcode: json["postcode"],
      instructions: json["instructions"],
      appartmentName: json["appartment_name"],
      floor: json["floor"],
      buildingName: json["building_name"],
      entryCode: json["entry_code"],
      businessName: json["business_name"],
      hotelName: json["hotel_name"],
      business: json["business"],
    );
  }

  Map<String, dynamic> toJson() => {
    "guest_id": guestId,
    "house_no": houseNo,
    "street": street,
    "city": city,
    "postcode": postcode,
    "instructions": instructions,
    "appartment_name": appartmentName,
    "floor": floor,
    "building_name": buildingName,
    "entry_code": entryCode,
    "business_name": businessName,
    "hotel_name": hotelName,
    "business": business,
  };

}
