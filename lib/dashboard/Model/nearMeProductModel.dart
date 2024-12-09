class NearServiceProductModel {
  String? status;
  List<NearProduct>? nearProduct;

  NearServiceProductModel({this.status, this.nearProduct});

  NearServiceProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['nearProduct'] != null) {
      nearProduct = <NearProduct>[];
      json['nearProduct'].forEach((v) {
        nearProduct!.add(new NearProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.nearProduct != null) {
      data['nearProduct'] = this.nearProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearProduct {
  String? id;
  String? name;
  String? img;
  String? sprice;
  String? pprice;
  int? agentid;
  int? categoryId;
  int? subcategoryId;
  String? bodypartId;
  int? cityId;
  var locationIds;
  int? slotId;
  var appointmentSlotIds;
  String? description;
  String? gender;
  String? createdAt;
  String? updatedAt;
  int? averageRating;
  List<ReviewRatings>? reviewRatings; // List of Review Ratings

  NearProduct({
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

  // Factory method to parse JSON and create a Products object
  factory NearProduct.fromJson(Map<String, dynamic> json) {
    return NearProduct(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      img: json['image'] ?? '',
      sprice: json['service_price'] ?? '0.00',
      pprice: json['product_price'] ?? '0.00',
      agentid: json['agent_id'] ?? 0,
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
          : [], // Parsing reviewRatings from JSON
    );
  }

  // Convert the Products object back to JSON format
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

class Locations2 {
  int? id;
  String? cityId;
  String? name;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Locations2(
      {this.id,
      this.cityId,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Locations2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? serviceProductId;
  String? locationId;

  Pivot({this.serviceProductId, this.locationId});

  Pivot.fromJson(Map<String, dynamic> json) {
    serviceProductId = json['service_product_id'];
    locationId = json['location_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_product_id'] = this.serviceProductId;
    data['location_id'] = this.locationId;
    return data;
  }
}

class ReviewRatings {
  int? id;
  String? serviceproductId;
  String? agentid;
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
      this.agentid,
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
    agentid = json['agent_id'];
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
    data['agent_id'] = this.agentid;
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
