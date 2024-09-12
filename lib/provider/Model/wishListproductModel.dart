import 'dart:convert';

class AllWishlistProductModel {
  String? message;
  List<WishlistProduct>? products;

  AllWishlistProductModel({this.message, this.products});

  AllWishlistProductModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['products'] != null) {
      products = <WishlistProduct>[];
      json['products'].forEach((v) {
        products!.add(WishlistProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishlistProduct {
  int? id;
  String? agentId;
  String? categoryId;
  String? subcategoryId;
  String? bodypartId;
  String? cityId;
  List<String>? locationIds; // Decoded as List<String>
  List<String>? appointmentSlotIds; // Decoded as List<String>
  String? slotId;
  String? name;
  String? description;
  String? image;
  String? productPrice;
  String? servicePrice;
  String? gender;
  String? createdAt;
  String? updatedAt;

  WishlistProduct(
      {this.id,
      this.agentId,
      this.categoryId,
      this.subcategoryId,
      this.bodypartId,
      this.cityId,
      this.locationIds,
      this.slotId,
      this.appointmentSlotIds,
      this.name,
      this.description,
      this.image,
      this.productPrice,
      this.servicePrice,
      this.gender,
      this.createdAt,
      this.updatedAt});

  WishlistProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    bodypartId = json['bodypart_id'];
    cityId = json['city_id'];

    // Decode JSON-encoded strings
    locationIds = (json['location_ids'] != null)
        ? List<String>.from(jsonDecode(json['location_ids']))
        : null;

    appointmentSlotIds = (json['appointment_slot_ids'] != null)
        ? List<String>.from(jsonDecode(json['appointment_slot_ids']))
        : null;

    slotId = json['slot_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    productPrice = json['product_price'];
    servicePrice = json['service_price'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agent_id'] = this.agentId;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['bodypart_id'] = this.bodypartId;
    data['city_id'] = this.cityId;

    // Encode lists to JSON strings
    data['location_ids'] = jsonEncode(this.locationIds);
    data['appointment_slot_ids'] = jsonEncode(this.appointmentSlotIds);

    data['slot_id'] = this.slotId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['product_price'] = this.productPrice;
    data['service_price'] = this.servicePrice;
    data['gender'] = this.gender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
