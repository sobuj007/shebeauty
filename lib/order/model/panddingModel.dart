class PendingModel {
  List<PendingOrders>? pendingOrders;

  PendingModel({this.pendingOrders});

  PendingModel.fromJson(Map<String, dynamic> json) {
    if (json['pending_orders'] != null) {
      pendingOrders = <PendingOrders>[];
      json['pending_orders'].forEach((v) {
        pendingOrders!.add(new PendingOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pendingOrders != null) {
      data['pending_orders'] =
          this.pendingOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PendingOrders {
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

  PendingOrders(
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

  PendingOrders.fromJson(Map<String, dynamic> json) {
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
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    serviceProduct = json['service_product'] != null
        ? new ServiceProduct.fromJson(json['service_product'])
        : null;
    payment2 = json['payment2'] != null
        ? new Payment2.fromJson(json['payment2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['vendor_id'] = this.vendorId;
    data['user_id'] = this.userId;
    data['service_product_id'] = this.serviceProductId;
    data['product_quantity'] = this.productQuantity;
    data['service_quantity'] = this.serviceQuantity;
    data['product_price'] = this.productPrice;
    data['service_price'] = this.servicePrice;
    data['selected_slot'] = this.selectedSlot;
    data['userreqtime'] = this.userreqtime;
    data['req_order_date'] = this.reqOrderDate;
    data['status'] = this.status;
    data['payable'] = this.payable;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.serviceProduct != null) {
      data['service_product'] = this.serviceProduct!.toJson();
    }
    if (this.payment2 != null) {
      data['payment2'] = this.payment2!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['total_amount'] = this.totalAmount;
    data['order_date'] = this.orderDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class Payment2 {
  int? id;
  int? orderId;
  Null? productId;
  String? amount;
  String? status;
  String? address;
  Null? notes;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['address'] = this.address;
    data['notes'] = this.notes;
    data['mobile'] = this.mobile;
    data['trans_type'] = this.transType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
