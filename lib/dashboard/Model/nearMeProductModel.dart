class NearServiceProductModel {
  String? status;
  List<NearProduct>? nearProduct;

  NearServiceProductModel({this.status, this.nearProduct});

  NearServiceProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['nearProduct'] != null) {
      nearProduct = <NearProduct>[];
      json['nearProduct'].forEach((v) {
        nearProduct!.add(NearProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (nearProduct != null) {
      data['nearProduct'] = nearProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearProduct {
  int? id;
  int? agentid;
  int? categoryId;
  int? subcategoryId;
  String? bodypartId;
  int? cityId;
  String? locationIds;
  Null slotId;
  Null appointmentSlotIds;
  String? name;
  String? description;
  String? productsbrand;
  String? img;
  String? pprice;
  String? sprice;
  String? gender;
  String? createdAt;
  String? updatedAt;
  int? averageRating;
  List<ReviewRatings>? reviewRatings;

  NearProduct(
      {this.id,
      this.agentid,
      this.categoryId,
      this.subcategoryId,
      this.bodypartId,
      this.cityId,
      this.locationIds,
      this.slotId,
      this.appointmentSlotIds,
      this.name,
      this.description,
      this.productsbrand,
      this.img,
      this.pprice,
      this.sprice,
      this.gender,
      this.createdAt,
      this.updatedAt,
      this.averageRating,
      this.reviewRatings});

  NearProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentid = json['agent_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    bodypartId = json['bodypart_id'];
    cityId = json['city_id'];
    locationIds = json['location_ids'];
    slotId = json['slot_id'];
    appointmentSlotIds = json['appointment_slot_ids'];
    name = json['name'];
    description = json['description'];
    productsbrand = json['productsbrand'].toString() ?? '';
    img = json['image'];
    pprice = json['product_price'];
    sprice = json['service_price'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    averageRating = json['average_rating'];
    if (json['review_ratings'] != null) {
      reviewRatings = <ReviewRatings>[];
      json['review_ratings'].forEach((v) {
        reviewRatings!.add(ReviewRatings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['agent_id'] = agentid;
    data['category_id'] = categoryId;
    data['subcategory_id'] = subcategoryId;
    data['bodypart_id'] = bodypartId;
    data['city_id'] = cityId;
    data['location_ids'] = locationIds;
    data['slot_id'] = slotId;
    data['appointment_slot_ids'] = appointmentSlotIds;
    data['name'] = name;
    data['description'] = description;
    data['productsbrand'] = productsbrand;
    data['image'] = img;
    data['product_price'] = pprice;
    data['service_price'] = sprice;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['average_rating'] = averageRating;
    if (reviewRatings != null) {
      data['review_ratings'] = reviewRatings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReviewRatings {
  int? id;
  int? serviceproductId;
  int? agentId;
  int? userId;
  String? reviewername;
  Null image;
  int? rating;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['serviceproduct_id'] = serviceproductId;
    data['agent_id'] = agentId;
    data['user_id'] = userId;
    data['reviewername'] = reviewername;
    data['image'] = image;
    data['rating'] = rating;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
