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
  String id;
  String name;
  String img;
  String sprice;
  String pprice;
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
  int averageRating;
  String createdAt;
  String updatedAt;

  WishlistProduct({
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

  factory WishlistProduct.fromJson(Map<String, dynamic> json) {
    return WishlistProduct(
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

class WishlistReviewRatings {
  String id;
  String serviceproductId;
  String agentId;
  String userId;
  String reviewername;
  String image;
  String rating;
  String comment;
  String createdAt;
  String updatedAt;

  WishlistReviewRatings({
    required this.id,
    required this.serviceproductId,
    required this.agentId,
    required this.userId,
    required this.reviewername,
    required this.image,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to convert JSON to ReviewRatings object
  factory WishlistReviewRatings.fromJson(Map<String, dynamic> json) {
    return WishlistReviewRatings(
      id: json['id'] ?? '',
      serviceproductId: json['serviceproduct_id'] ?? '',
      agentId: json['agent_id'] ?? '',
      userId: json['user_id'] ?? '',
      reviewername: json['reviewername'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating'] ?? '0',
      comment: json['comment'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  // Method to convert ReviewRatings to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serviceproduct_id': serviceproductId,
      'agent_id': agentId,
      'user_id': userId,
      'reviewername': reviewername,
      'image': image,
      'rating': rating,
      'comment': comment,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
