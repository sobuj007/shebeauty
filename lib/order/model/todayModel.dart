

 

class Todaylist {
  int? id;
  String? userId;
  String? status;
  String? totalAmount;
  String? orderDate;
  String? createdAt;
  String? updatedAt;
  List<Items2>? items2;

  Todaylist(
      {this.id,
      this.userId,
      this.status,
      this.totalAmount,
      this.orderDate,
      this.createdAt,
      this.updatedAt,
      this.items2});

  Todaylist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    totalAmount = json['total_amount'];
    orderDate = json['order_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['items2'] != null) {
      items2 = <Items2>[];
      json['items2'].forEach((v) {
        items2!.add(new Items2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['total_amount'] = this.totalAmount;
    data['order_date'] = this.orderDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.items2 != null) {
      data['items2'] = this.items2!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items2 {
  int? id;
  String? orderId;
  String? vendorId;
  String? serviceProductId;
  String? productQuantity;
  String? serviceQuantity;
  String? productPrice;
  String? servicePrice;
  String? selectedSlot;
  String? userreqtime;
  String? createdAt;
  String? updatedAt;
  ServiceProduct2? serviceProduct2;

  Items2(
      {this.id,
      this.orderId,
      this.vendorId,
      this.serviceProductId,
      this.productQuantity,
      this.serviceQuantity,
      this.productPrice,
      this.servicePrice,
      this.selectedSlot,
      this.userreqtime,
      this.createdAt,
      this.updatedAt,
      this.serviceProduct2});

  Items2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    vendorId = json['vendor_id'];
    serviceProductId = json['service_product_id'];
    productQuantity = json['product_quantity'];
    serviceQuantity = json['service_quantity'];
    productPrice = json['product_price'];
    servicePrice = json['service_price'];
    selectedSlot = json['selected_slot'];
    userreqtime = json['userreqtime'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serviceProduct2 = json['service_product2'] != null
        ? new ServiceProduct2.fromJson(json['service_product2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['vendor_id'] = this.vendorId;
    data['service_product_id'] = this.serviceProductId;
    data['product_quantity'] = this.productQuantity;
    data['service_quantity'] = this.serviceQuantity;
    data['product_price'] = this.productPrice;
    data['service_price'] = this.servicePrice;
    data['selected_slot'] = this.selectedSlot;
    data['userreqtime'] = this.userreqtime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.serviceProduct2 != null) {
      data['service_product2'] = this.serviceProduct2!.toJson();
    }
    return data;
  }
}

class ServiceProduct2 {
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

  ServiceProduct2(
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
      this.updatedAt});

  ServiceProduct2.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
