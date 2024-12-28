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
  int? agentid;
  int? categoryId;
  int? subcategoryId;
  String? bodypartId;
  int? cityId;
  String? locationIds;
  Null? slotId;
  Null? appointmentSlotIds;
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
        reviewRatings!.add(new ReviewRatings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agent_id'] = this.agentid;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['bodypart_id'] = this.bodypartId;
    data['city_id'] = this.cityId;
    data['location_ids'] = this.locationIds;
    data['slot_id'] = this.slotId;
    data['appointment_slot_ids'] = this.appointmentSlotIds;
    data['name'] = this.name;
    data['description'] = this.description;
    data['productsbrand'] = this.productsbrand;
    data['image'] = this.img;
    data['product_price'] = this.pprice;
    data['service_price'] = this.sprice;
    data['gender'] = this.gender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['average_rating'] = this.averageRating;
    if (this.reviewRatings != null) {
      data['review_ratings'] =
          this.reviewRatings!.map((v) => v.toJson()).toList();
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
  Null? image;
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
