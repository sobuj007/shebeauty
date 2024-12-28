import 'dart:convert';

AllProductModel allProductModelFromJson(String str) =>
    AllProductModel.fromJson(json.decode(str));

String allProductModelToJson(AllProductModel data) =>
    json.encode(data.toJson());

class AllProductModel {
  String message;
  List<Product> products;

  AllProductModel({
    required this.message,
    required this.products,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      AllProductModel(
        message: json["message"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  int id;
  int agentid;
  int categoryId;
  int subcategoryId;
  String bodypartId;
  int cityId;

  int? slotId;
  String? appointmentSlotIds;
  String name;
  String description;
  String productsbrand;
  String img;
  double pprice; // Updated to `double`
  double sprice; // Updated to `double`
  String gender;
  DateTime createdAt;
  DateTime updatedAt;
  double averageRating; // Updated to `double`
  List<ReviewRatings>? reviewRatings;

  Product({
    required this.id,
    required this.agentid,
    required this.categoryId,
    required this.subcategoryId,
    required this.bodypartId,
    required this.cityId,
    required this.slotId,
    required this.appointmentSlotIds,
    required this.name,
    required this.description,
    required this.productsbrand,
    required this.img,
    required this.pprice,
    required this.sprice,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.averageRating,
    required this.reviewRatings,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // var locationList = [];
    // if (json['location_ids'] != null) {
    //   // Check if location_ids is a string and parse it if so
    //   String locationIds = json['location_ids'];
    //   if (locationIds.startsWith('"') && locationIds.endsWith('"')) {
    //     locationIds =
    //         locationIds.substring(1, locationIds.length - 1); // Remove quotes
    //   }
    //   locationList = List<int>.from(jsonDecode(locationIds));
    // }
    return Product(
      id: json["id"],
      agentid: json["agent_id"],
      categoryId: json["category_id"],
      subcategoryId: json["subcategory_id"],
      bodypartId: json["bodypart_id"],
      cityId: json["city_id"],
      // locationIds: locationList,
      slotId: json["slot_id"],
      appointmentSlotIds: json["appointment_slot_ids"],
      name: json["name"],
      description: json["description"],
      productsbrand: json["productsbrand"].toString() ?? '',
      img: json["image"],
      pprice: double.tryParse(json["product_price"].toString()) ??
          0.0, // Safe conversion
      sprice: double.tryParse(json["service_price"].toString()) ??
          0.0, // Safe conversion
      gender: json["gender"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      averageRating: double.tryParse(json["average_rating"].toString()) ??
          0.0, // Safe conversion
      reviewRatings: json['review_ratings'] != null
          ? (json['review_ratings'] as List)
              .map((i) => ReviewRatings.fromJson(i))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "agent_id": agentid,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "bodypart_id": bodypartId,
        "city_id": cityId,
        // "location_ids": locationIds,
        "slot_id": slotId,
        "appointment_slot_ids": appointmentSlotIds,
        "name": name,
        "description": description,
        "productsbrand": productsbrand,
        "image": img,
        "product_price": pprice,
        "service_price": sprice,
        "gender": gender,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "average_rating": averageRating,
        'review_ratings': reviewRatings?.map((i) => i.toJson()).toList(),
      };
}

class ReviewRatings {
  int? id;
  int? serviceproductId;
  int? agentid;
  int? userId;
  String? reviewername;
  String? image;
  int? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;

  ReviewRatings({
    this.id,
    this.serviceproductId,
    this.agentid,
    this.userId,
    this.reviewername,
    this.image,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory ReviewRatings.fromJson(Map<String, dynamic> json) {
    return ReviewRatings(
      id: json['id'],
      serviceproductId: json['serviceproduct_id'],
      agentid: json['agent_id'],
      userId: json['user_id'],
      reviewername: json['reviewername'],
      image: json['image'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serviceproduct_id': serviceproductId,
      'agent_id': agentid,
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
