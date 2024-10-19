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
  List<CartProducts> itemsdata; // Changed to a list of CartProducts

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
    required this.itemsdata, // Updated to accept a list of CartProducts
  });

  // Method to convert from JSON to CartItem
  factory CartItem.fromJson(Map<String, dynamic> json) {
    var itemsJson = json['itemsdata'] as List; // Get the items list from JSON
    List<CartProducts> itemList = itemsJson
        .map((item) => CartProducts.fromJson(item))
        .toList(); // Convert to List<CartProducts>

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
      itemsdata: itemList, // Assign the list of items
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
      'itemsdata': itemsdata
          .map((item) => item.toJson())
          .toList(), // Converting the list of CartProducts back to JSON
    };
  }
}

class CartProducts {
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
  String createdAt;
  String updatedAt;
  List<ReviewRatings> reviewRatings; // List of Review Ratings

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
    required this.createdAt,
    required this.updatedAt,
    required this.reviewRatings, // Initialize reviewRatings
  });

  factory CartProducts.fromJson(Map<String, dynamic> json) {
    return CartProducts(
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
      reviewRatings: (json['review_ratings'] as List)
          .map((i) => ReviewRatings.fromJson(i))
          .toList(), // Parsing reviewRatings
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
      'review_ratings': reviewRatings
          .map((i) => i.toJson())
          .toList(), // Converting the review ratings back to JSON
    };
  }
}

class ReviewRatings {
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

  ReviewRatings({
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
  factory ReviewRatings.fromJson(Map<String, dynamic> json) {
    return ReviewRatings(
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
