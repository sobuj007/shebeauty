// To parse this JSON data, do
//
//     final storeprofileModel = storeprofileModelFromJson(jsonString);

import 'dart:convert';

StoreprofileModel storeprofileModelFromJson(String str) => StoreprofileModel.fromJson(json.decode(str));

String storeprofileModelToJson(StoreprofileModel data) => json.encode(data.toJson());

class StoreprofileModel {
    String message;
    List<Store> data;

    StoreprofileModel({
        required this.message,
        required this.data,
    });

    factory StoreprofileModel.fromJson(Map<String, dynamic> json) => StoreprofileModel(
        message: json["message"],
        data: List<Store>.from(json["data"].map((x) => Store.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Store {
  int? id;
  String? storename;
  String? coverImage;
  String? tradelicence;
  String? address;
  String? mobile;
  String? logo;
  String? cityId;
  String? locationIds;
  String? nid;
  String? companyType;
  String? agentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Store({
    this.id,
    this.storename,
    this.coverImage,
    this.tradelicence,
    this.address,
    this.mobile,
    this.logo,
    this.cityId,
    this.locationIds,
    this.nid,
    this.companyType,
    this.agentId,
    this.createdAt,
    this.updatedAt,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"] != null ? json["id"] as int : null,
    storename: json["storename"] as String?,
    coverImage: json["coverImage"] as String?,
    tradelicence: json["tradelicence"] as String?,
    address: json["address"] as String?,
    mobile: json["mobile"] as String?,
    logo: json["logo"] as String?,
    cityId: json["city_id"] as String?,
    locationIds: json["location_ids"] as String?,
    nid: json["nid"] as String?,
    companyType: json["company_type"] as String?,
    agentId: json["agent_id"] as String?,
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"] as String) : null,
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"] as String) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "storename": storename,
    "coverImage": coverImage,
    "tradelicence": tradelicence,
    "address": address,
    "mobile": mobile,
    "logo": logo,
    "city_id": cityId,
    "location_ids": locationIds,
    "nid": nid,
    "company_type": companyType,
    "agent_id": agentId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
