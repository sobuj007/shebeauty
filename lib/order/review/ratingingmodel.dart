// class RatingModel {
//   String? message;
//   List<Reviews>? reviews;

//   RatingModel({this.message, this.reviews});

//   RatingModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['reviews'] != null) {
//       reviews = <Reviews>[];
//       json['reviews'].forEach((v) {
//         reviews!.add(new Reviews.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.reviews != null) {
//       data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Reviews {
//   int? id;
//   String? serviceproductId;
//   String? agentId;
//   String? userId;
//   String? reviewername;
//   String? image;
//   String? rating;
//   String? comment;
//   String? createdAt;
//   String? updatedAt;

//   Reviews(
//       {this.id,
//       this.serviceproductId,
//       this.agentId,
//       this.userId,
//       this.reviewername,
//       this.image,
//       this.rating,
//       this.comment,
//       this.createdAt,
//       this.updatedAt});

//   Reviews.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     serviceproductId = json['serviceproduct_id'];
//     agentId = json['agent_id'];
//     userId = json['user_id'];
//     reviewername = json['reviewername'];
//     image = json['image'];
//     rating = json['rating'];
//     comment = json['comment'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['serviceproduct_id'] = this.serviceproductId;
//     data['agent_id'] = this.agentId;
//     data['user_id'] = this.userId;
//     data['reviewername'] = this.reviewername;
//     data['image'] = this.image;
//     data['rating'] = this.rating;
//     data['comment'] = this.comment;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
class RatingModel {
  String? message;
  List<Reviews>? reviews;

  RatingModel({this.message, this.reviews});

  RatingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  int? id;
  int? serviceproductId;
  int? agentId;
  int? userId;
  String? reviewername;
  String? image;
  int? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;

  Reviews(
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

  Reviews.fromJson(Map<String, dynamic> json) {
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
