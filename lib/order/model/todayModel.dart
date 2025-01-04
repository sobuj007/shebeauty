class TodayModel {
  List<TodaysOrders>? todaysOrders;

  TodayModel({this.todaysOrders});

  TodayModel.fromJson(Map<String, dynamic> json) {
    if (json['todays_orders'] != null) {
      todaysOrders = <TodaysOrders>[];
      json['todays_orders'].forEach((v) {
        todaysOrders!.add(TodaysOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (todaysOrders != null) {
      data['todays_orders'] = todaysOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TodaysOrders {
  int? id;
  int? orderId;
  int? vendorId;
  int? userId;
  int? serviceProductId;
  int? productQuantity;
  int? serviceQuantity;
  String? productPrice;
  String? servicePrice;
  String? selectedSlot;
  String? userreqtime;
  String? reqOrderDate;
  String? status;
  String? payable;
  String? createdAt;
  String? updatedAt;
  Order? order;
  ServiceProduct? serviceProduct;
  Payment2? payment2;

  TodaysOrders(
      {this.id,
      this.orderId,
      this.vendorId,
      this.userId,
      this.serviceProductId,
      this.productQuantity,
      this.serviceQuantity,
      this.productPrice,
      this.servicePrice,
      this.selectedSlot,
      this.userreqtime,
      this.reqOrderDate,
      this.status,
      this.payable,
      this.createdAt,
      this.updatedAt,
      this.order,
      this.serviceProduct,
      this.payment2});

  TodaysOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    vendorId = json['vendor_id'];
    userId = json['user_id'];
    serviceProductId = json['service_product_id'];
    productQuantity = json['product_quantity'];
    serviceQuantity = json['service_quantity'];
    productPrice = json['product_price'];
    servicePrice = json['service_price'];
    selectedSlot = json['selected_slot'];
    userreqtime = json['userreqtime'];
    reqOrderDate = json['req_order_date'];
    status = json['status'];
    payable = json['payable'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    serviceProduct = json['service_product'] != null
        ? ServiceProduct.fromJson(json['service_product'])
        : null;
    payment2 =
        json['payment2'] != null ? Payment2.fromJson(json['payment2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['vendor_id'] = vendorId;
    data['user_id'] = userId;
    data['service_product_id'] = serviceProductId;
    data['product_quantity'] = productQuantity;
    data['service_quantity'] = serviceQuantity;
    data['product_price'] = productPrice;
    data['service_price'] = servicePrice;
    data['selected_slot'] = selectedSlot;
    data['userreqtime'] = userreqtime;
    data['req_order_date'] = reqOrderDate;
    data['status'] = status;
    data['payable'] = payable;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    if (serviceProduct != null) {
      data['service_product'] = serviceProduct!.toJson();
    }
    if (payment2 != null) {
      data['payment2'] = payment2!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  int? userId;
  String? status;
  String? totalAmount;
  String? orderDate;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
      this.userId,
      this.status,
      this.totalAmount,
      this.orderDate,
      this.createdAt,
      this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
    totalAmount = json['total_amount'];
    orderDate = json['order_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['status'] = status;
    data['total_amount'] = totalAmount;
    data['order_date'] = orderDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ServiceProduct {
  int? id;
  int? agentId;
  int? categoryId;
  int? subcategoryId;
  String? bodypartId;
  int? cityId;
  var locationIds;
  int? slotId;
  String? appointmentSlotIds;
  String? name;
  String? description;
  String? image;
  String? productPrice;
  String? servicePrice;
  String? gender;
  String? createdAt;
  String? updatedAt;

  ServiceProduct(
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

  ServiceProduct.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['agent_id'] = agentId;
    data['category_id'] = categoryId;
    data['subcategory_id'] = subcategoryId;
    data['bodypart_id'] = bodypartId;
    data['city_id'] = cityId;
    data['location_ids'] = locationIds;
    data['slot_id'] = slotId;
    data['appointment_slot_ids'] = appointmentSlotIds;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['product_price'] = productPrice;
    data['service_price'] = servicePrice;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Payment2 {
  int? id;
  int? orderId;
  Null productId;
  String? amount;
  String? status;
  String? address;
  Null notes;
  String? mobile;
  String? transType;
  String? createdAt;
  String? updatedAt;

  Payment2(
      {this.id,
      this.orderId,
      this.productId,
      this.amount,
      this.status,
      this.address,
      this.notes,
      this.mobile,
      this.transType,
      this.createdAt,
      this.updatedAt});

  Payment2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    amount = json['amount'];
    status = json['status'];
    address = json['address'];
    notes = json['notes'];
    mobile = json['mobile'];
    transType = json['trans_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['product_id'] = productId;
    data['amount'] = amount;
    data['status'] = status;
    data['address'] = address;
    data['notes'] = notes;
    data['mobile'] = mobile;
    data['trans_type'] = transType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
