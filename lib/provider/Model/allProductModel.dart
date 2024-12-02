// import 'dart:convert';

// class AllProductModel {
//   String? message;
//   List<Products>? products;

//   AllProductModel({this.message, this.products});

//   AllProductModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(Products.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Products {
//   int? id;
//   String? agentId;
//   String? categoryId;
//   String? subcategoryId;
//   String? bodypartId;
//   String? cityId;
//   List<String>? locationIds; // Decoded as List<String>
//   List<String>? appointmentSlotIds; // Decoded as List<String>
//   String? slotId;
//   String? name;
//   String? description;
//   String? image;
//   String? productPrice;
//   String? servicePrice;
//   String? gender;
//   String? createdAt;
//   String? updatedAt;

//   Products(
//       {this.id,
//       this.agentId,
//       this.categoryId,
//       this.subcategoryId,
//       this.bodypartId,
//       this.cityId,
//       this.locationIds,
//       this.slotId,
//       this.appointmentSlotIds,
//       this.name,
//       this.description,
//       this.image,
//       this.productPrice,
//       this.servicePrice,
//       this.gender,
//       this.createdAt,
//       this.updatedAt});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     agentId = json['agent_id'];
//     categoryId = json['category_id'];
//     subcategoryId = json['subcategory_id'];
//     bodypartId = json['bodypart_id'];
//     cityId = json['city_id'];

//     // Decode JSON-encoded strings
//     locationIds = (json['location_ids'] != null)
//         ? List<String>.from(jsonDecode(json['location_ids']))
//         : null;

//     appointmentSlotIds = (json['appointment_slot_ids'] != null)
//         ? List<String>.from(jsonDecode(json['appointment_slot_ids']))
//         : null;

//     slotId = json['slot_id'];
//     name = json['name'];
//     description = json['description'];
//     image = json['image'];
//     productPrice = json['product_price'];
//     servicePrice = json['service_price'];
//     gender = json['gender'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['agent_id'] = this.agentId;
//     data['category_id'] = this.categoryId;
//     data['subcategory_id'] = this.subcategoryId;
//     data['bodypart_id'] = this.bodypartId;
//     data['city_id'] = this.cityId;

//     // Encode lists to JSON strings
//     data['location_ids'] = jsonEncode(this.locationIds);
//     data['appointment_slot_ids'] = jsonEncode(this.appointmentSlotIds);

//     data['slot_id'] = this.slotId;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     data['product_price'] = this.productPrice;
//     data['service_price'] = this.servicePrice;
//     data['gender'] = this.gender;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
import 'dart:convert';

class AllProductModel {
  String? message;
  List<Products>? products;

  AllProductModel({this.message, this.products});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
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

class Products {
  String? id;
  String? name;
  String? img;
  String? sprice;
  String? pprice;
  String? agentid;
  String? categoryId;
  String? subcategoryId;
  var bodypartId;
  String? cityId;
  var locationIds;
  String? slotId;
  var appointmentSlotIds;
  String? description;
  String? gender;
  String? createdAt;
  String? updatedAt;
  int? averageRating;
  List<ReviewRatings>? reviewRatings; // List of Review Ratings

  Products({
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
    required this.createdAt,
    required this.updatedAt,
    required this.averageRating,
    required this.reviewRatings, // Initialize reviewRatings
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      img: json['image'] ?? '',
      sprice: json['service_price'] ?? '0.00',
      pprice: json['product_price'] ?? '0.00',
      agentid: json['agent_id'] ?? '',
      categoryId: json['category_id'] ?? '',
      subcategoryId: json['subcategory_id'] ?? '',
      bodypartId: json['bodypart_id'] ?? '',
      cityId: json['city_id'] ?? '',
      locationIds: json['location_ids'] ?? '',
      slotId: json['slot_id'] ?? '',
      appointmentSlotIds: json['appointment_slot_ids'] ?? '',
      description: json['description'] ?? '',
      gender: json['gender'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      averageRating: json['average_rating'],
      reviewRatings: json['review_ratings'] != null
          ? (json['review_ratings'] as List)
              .map((i) => ReviewRatings.fromJson(i))
              .toList()
          : [], // Parsing reviewRatings
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
      'created_at': createdAt,
      'updated_at': updatedAt,
      'average_rating': averageRating,
      'review_ratings': reviewRatings!
          .map((i) => i.toJson())
          .toList(), // Converting the review ratings back to JSON
    };
  }
}

class ReviewRatings {
  int? id;
  String? serviceproductId;
  String? agentId;
  String? userId;
  String? reviewername;
  String? image;
  String? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;

  ReviewRatings(
      {this.id,
      this.serviceproductId,
      this.agentId,
      this.userId,
      this.reviewername,
      this.image,
      this.rating,
      this.comment,
      this.createdAt,
      this.updatedAt});

  ReviewRatings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceproductId = json['serviceproduct_id'];
    agentId = json['agent_id'];
    userId = json['user_id'];
    reviewername = json['reviewername'];
    image = json['image'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceproduct_id'] = this.serviceproductId;
    data['agent_id'] = this.agentId;
    data['user_id'] = this.userId;
    data['reviewername'] = this.reviewername;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
