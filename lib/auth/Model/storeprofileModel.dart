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
    int id;
    String storename;
    String coverImage;
    String tradelicence;
    String address;
    String mobile;
    String logo;
    String cityId;
    String locationIds;
    String nid;
    String companyType;
    String agentId;
    DateTime createdAt;
    DateTime updatedAt;

    Store({
        required this.id,
        required this.storename,
        required this.coverImage,
        required this.tradelicence,
        required this.address,
        required this.mobile,
        required this.logo,
        required this.cityId,
        required this.locationIds,
        required this.nid,
        required this.companyType,
        required this.agentId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        storename: json["storename"],
        coverImage: json["coverImage"],
        tradelicence: json["tradelicence"],
        address: json["address"],
        mobile: json["mobile"],
        logo: json["logo"],
        cityId: json["city_id"],
        locationIds: json["location_ids"],
        nid: json["nid"],
        companyType: json["company_type"],
        agentId: json["agent_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
