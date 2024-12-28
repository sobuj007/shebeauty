import 'dart:convert';

class CartItem {
  String id;
  String name;
  String img;
  String selectedTime;
  String selectedDate;
  String selectedServicsQun;
  String selectedProductQun;
  String sprice;
  String pprice;
  String agentid;
  String userid;
  CartProducts item; // Product model included here

  CartItem({
    required this.id,
    required this.name,
    required this.img,
    required this.selectedTime,
    required this.selectedDate,
    required this.selectedServicsQun,
    required this.selectedProductQun,
    required this.sprice,
    required this.pprice,
    required this.agentid,
    required this.userid,
    required this.item,
  });

  // Method to convert from JSON to CartItem
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      selectedTime: json['selectedTime'],
      selectedDate: json['selectedDate'],
      selectedServicsQun: json['selectedServicsQun'],
      selectedProductQun: json['selectedProductQun'],
      sprice: json['sprice'],
      pprice: json['pprice'],
      agentid: json['agentid'],
      userid: json['userid'],
      item: CartProducts.fromJson(
          json['item']), // Converting the item field to Products model
    );
  }

  // Method to convert from CartItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'img': img,
      'selectedTime': selectedTime,
      'selectedDate': selectedDate,
      'selectedServicsQun': selectedServicsQun,
      'selectedProductQun': selectedProductQun,
      'sprice': sprice,
      'pprice': pprice,
      'agentid': agentid,
      'userid': userid,
      'item': item.toJson(), // Converting the item (Products) back to JSON
    };
  }
}

class CartProducts {
  String id;
  String name;
  String img;
  var sprice;
  var pprice;
  String agentid;
  String categoryId;
  String subcategoryId;
  String bodypartId;
  String cityId;
  var locationIds;
  String slotId;
  var appointmentSlotIds;
  String description;
  String gender;
  double averageRating;
  String createdAt;
  String updatedAt;

  CartProducts({
    required this.id,
    required this.name,
    required this.img,
    required this.sprice,
    required this.pprice,
    required this.agentid,
    required this.categoryId,
    required this.subcategoryId,
    required this.bodypartId,
    required this.cityId,
    required this.locationIds,
    required this.slotId,
    required this.appointmentSlotIds,
    required this.description,
    required this.gender,
    required this.averageRating,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CartProducts.fromJson(Map<String, dynamic> json) {
    return CartProducts(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      img: json['img'] ?? '',
      sprice: json['sprice'] ?? '0.00',
      pprice: json['pprice'] ?? '0.00',
      agentid: json['agentid'] ?? '',
      categoryId: json['category_id'] ?? '',
      subcategoryId: json['subcategory_id'] ?? '',
      bodypartId: json['bodypart_id'] ?? '',
      cityId: json['city_id'] ?? '',
      locationIds: json['location_ids'] ?? '',
      slotId: json['slot_id'] ?? '',
      appointmentSlotIds: json['appointment_slot_ids'] ?? '',
      description: json['description'] ?? '',
      gender: json['gender'] ?? '',
      averageRating: json['averageRating'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'img': img,
      'sprice': sprice,
      'pprice': pprice,
      'agentid': agentid,
      'category_id': categoryId,
      'subcategory_id': subcategoryId,
      'bodypart_id': bodypartId,
      'city_id': cityId,
      'location_ids': locationIds,
      'slot_id': slotId,
      'appointment_slot_ids': appointmentSlotIds,
      'description': description,
      'gender': gender,
      'averageRating': averageRating,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
