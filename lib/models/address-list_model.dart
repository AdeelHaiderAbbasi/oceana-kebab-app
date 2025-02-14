class AddressList {
  AddressList({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory AddressList.fromJson(Map<String, dynamic> json){
    return AddressList(
      id: json["_id"],
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
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}
