import 'panddingModel.dart';
import 'todayModel.dart';

class HistoryModel {
  String? message;
  List<Completedorders>? completedorders;
  List<Pendingorders>? pendingorders;
  List<Todaylist>? todaylist;

  HistoryModel(
      {this.message, this.completedorders, this.pendingorders, this.todaylist});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['completedorders'] != null) {
      completedorders = <Completedorders>[];
      json['completedorders'].forEach((v) {
        completedorders!.add(new Completedorders.fromJson(v));
      });
    }
    if (json['pendingorders'] != null) {
      pendingorders = <Pendingorders>[];
      json['pendingorders'].forEach((v) {
        pendingorders!.add(new Pendingorders.fromJson(v));
      });
    }
    if (json['todaylist'] != null) {
      todaylist = <Todaylist>[];
      json['todaylist'].forEach((v) {
        todaylist!.add(new Todaylist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.completedorders != null) {
      data['completedorders'] =
          this.completedorders!.map((v) => v.toJson()).toList();
    }
    if (this.pendingorders != null) {
      data['pendingorders'] =
          this.pendingorders!.map((v) => v.toJson()).toList();
    }
    if (this.todaylist != null) {
      data['todaylist'] = this.todaylist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Completedorders {
  int? id;
  String? userId;
  String? status;
  String? orderDate;
  String? createdAt;
  String? updatedAt;
  List<Items2>? items2;

  Completedorders(
      {this.id,
      this.userId,
      this.status,
      this.orderDate,
      this.createdAt,
      this.updatedAt,
      this.items2});

  Completedorders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    status = json['status'];
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
  String? selected_slot;
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
      this.selected_slot,
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
    selected_slot = json['selected_slot'];
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
    data['selected_slot'] = this.selected_slot;
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


// class Pendingorders {
//   int? id;
//   String? userId;
//   String? status;
//   String? orderDate;
//   String? createdAt;
//   String? updatedAt;

//   Pendingorders(
//       {this.id,
//       this.userId,
//       this.status,
//       this.orderDate,
//       this.createdAt,
//       this.updatedAt});

//   Pendingorders.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     status = json['status'];
//     orderDate = json['order_date'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['status'] = this.status;
//     data['order_date'] = this.orderDate;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
// class Todaylist {
//   int? id;
//   String? userId;
//   String? status;
//   String? orderDate;
//   String? createdAt;
//   String? updatedAt;

//   Todaylist(
//       {this.id,
//       this.userId,
//       this.status,
//       this.orderDate,
//       this.createdAt,
//       this.updatedAt});

//   Todaylist.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     status = json['status'];
//     orderDate = json['order_date'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['status'] = this.status;
//     data['order_date'] = this.orderDate;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
