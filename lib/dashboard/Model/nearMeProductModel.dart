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
  int? id;
  String? agentId;
  String? categoryId;
  String? subcategoryId;
  String? bodypartId;
  String? cityId;
  String? locationIds;
  String? slotId;
  String? appointmentSlotIds;
  String? name;
  String? description;
  String? image;
  String? productPrice;
  String? servicePrice;
  String? gender;
  String? createdAt;
  String? updatedAt;
  int? averageRating;
  List<Locations2>? locations2;
  List<ReviewRatings>? reviewRatings;

  NearProduct(
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
      this.updatedAt,
      this.averageRating,
      this.locations2,
      this.reviewRatings});

  NearProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    bodypartId = json['bodypart_id'];
    cityId = json['city_id'];
    locationIds = json['location_ids'];
    slotId = json['slot_id'];
    appointmentSlotIds = json['appointment_slot_ids'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    productPrice = json['product_price'];
    servicePrice = json['service_price'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    averageRating = json['average_rating'];
    if (json['locations2'] != null) {
      locations2 = <Locations2>[];
      json['locations2'].forEach((v) {
        locations2!.add(new Locations2.fromJson(v));
      });
    }
    if (json['review_ratings'] != null) {
      reviewRatings = <ReviewRatings>[];
      json['review_ratings'].forEach((v) {
        reviewRatings!.add(new ReviewRatings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agent_id'] = this.agentId;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['bodypart_id'] = this.bodypartId;
    data['city_id'] = this.cityId;
    data['location_ids'] = this.locationIds;
    data['slot_id'] = this.slotId;
    data['appointment_slot_ids'] = this.appointmentSlotIds;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['product_price'] = this.productPrice;
    data['service_price'] = this.servicePrice;
    data['gender'] = this.gender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['average_rating'] = this.averageRating;
    if (this.locations2 != null) {
      data['locations2'] = this.locations2!.map((v) => v.toJson()).toList();
    }
    if (this.reviewRatings != null) {
      data['review_ratings'] =
          this.reviewRatings!.map((v) => v.toJson()).toList();
    }
    return data;
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
