class AllProductModel {
  String? message;
  List<Allproduct>? allproduct;

  AllProductModel({this.message, this.allproduct});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['allproduct'] != null) {
      allproduct = <Allproduct>[];
      json['allproduct'].forEach((v) {
        allproduct!.add(new Allproduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.allproduct != null) {
      data['allproduct'] = this.allproduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Allproduct {
  int? id;
  String? agentId;
  String? name;
  String? description;
  String? price;
  String? servicePrice;
  String? category;
  String? imgUrl;
  String? subcategory;
 dynamic time;
  String? gender;
  dynamic location;
  String? rating;
  String? available;
  String? slot;
  dynamic? bodypart;
  String? createdAt;
  String? updatedAt;

  Allproduct(
      {this.id,
      this.agentId,
      this.name,
      this.description,
      this.price,
      this.servicePrice,
      this.category,
      this.imgUrl,
      this.subcategory,
      this.time,
      this.gender,
      this.location,
      this.rating,
      this.available,
      this.slot,
      this.bodypart,
      this.createdAt,
      this.updatedAt});

  Allproduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    servicePrice = json['servicePrice'];
    category = json['category'];
    imgUrl = json['img_url'];
    subcategory = json['subcategory'];
    time = json['time'].cast<String>();
    gender = json['gender'];
    location = json['location'].cast<String>();
    rating = json['rating'];
    available = json['available'];
    slot = json['slot'];
    bodypart = json['bodypart'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agent_id'] = this.agentId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['servicePrice'] = this.servicePrice;
    data['category'] = this.category;
    data['img_url'] = this.imgUrl;
    data['subcategory'] = this.subcategory;
    data['time'] = this.time;
    data['gender'] = this.gender;
    data['location'] = this.location;
    data['rating'] = this.rating;
    data['available'] = this.available;
    data['slot'] = this.slot;
    data['bodypart'] = this.bodypart;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
