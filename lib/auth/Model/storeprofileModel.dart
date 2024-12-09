// // To parse this JSON data, do
// //
// //     final storeprofileModel = storeprofileModelFromJson(jsonString);

// import 'dart:convert';

// StoreprofileModel storeprofileModelFromJson(String str) => StoreprofileModel.fromJson(json.decode(str));

// String storeprofileModelToJson(StoreprofileModel data) => json.encode(data.toJson());

// class StoreprofileModel {
//     String message;
//     List<Store> data;

//     StoreprofileModel({
//         required this.message,
//         required this.data,
//     });

//     factory StoreprofileModel.fromJson(Map<String, dynamic> json) => StoreprofileModel(
//         message: json["message"],
//         data: List<Store>.from(json["data"].map((x) => Store.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Store {
//   int? id;
//   String? storename;
//   String? coverImage;
//   String? tradelicence;
//   String? address;
//   String? mobile;
//   String? logo;
//   String? cityId;
//   String? locationIds;
//   String? nid;
//   String? companyType;
//   String? agentId;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   Store({
//     this.id,
//     this.storename,
//     this.coverImage,
//     this.tradelicence,
//     this.address,
//     this.mobile,
//     this.logo,
//     this.cityId,
//     this.locationIds,
//     this.nid,
//     this.companyType,
//     this.agentId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory Store.fromJson(Map<String, dynamic> json) => Store(
//     id: json["id"] != null ? json["id"] as int : null,
//     storename: json["storename"] as String?,
//     coverImage: json["coverImage"] as String?,
//     tradelicence: json["tradelicence"] as String?,
//     address: json["address"] as String?,
//     mobile: json["mobile"] as String?,
//     logo: json["logo"] as String?,
//     cityId: json["city_id"] as String?,
//     locationIds: json["location_ids"] as String?,
//     nid: json["nid"] as String?,
//     companyType: json["company_type"] as String?,
//     agentId: json["agent_id"] as String?,
//     createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"] as String) : null,
//     updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"] as String) : null,
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "storename": storename,
//     "coverImage": coverImage,
//     "tradelicence": tradelicence,
//     "address": address,
//     "mobile": mobile,
//     "logo": logo,
//     "city_id": cityId,
//     "location_ids": locationIds,
//     "nid": nid,
//     "company_type": companyType,
//     "agent_id": agentId,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
// }
class StoreprofileModel {
  String? message;
  List<Data>? data;

  StoreprofileModel({this.message, this.data});

  StoreprofileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? storename;
  String? servicestime;
  String? coverImage;
  String? tradelicence;
  String? address;
  String? mobile;
  String? logo;
  int? cityId;
  String? locationIds;
  String? nid;
  String? companyType;
  int? agentId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.storename,
      this.servicestime,
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
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storename = json['storename'];
    servicestime = json['servicestime'];
    coverImage = json['coverImage'];
    tradelicence = json['tradelicence'];
    address = json['address'];
    mobile = json['mobile'];
    logo = json['logo'];
    cityId = json['city_id'];
    locationIds = json['location_ids'];
    nid = json['nid'];
    companyType = json['company_type'];
    agentId = json['agent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['storename'] = this.storename;
    data['servicestime'] = this.servicestime;
    data['coverImage'] = this.coverImage;
    data['tradelicence'] = this.tradelicence;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['logo'] = this.logo;
    data['city_id'] = this.cityId;
    data['location_ids'] = this.locationIds;
    data['nid'] = this.nid;
    data['company_type'] = this.companyType;
    data['agent_id'] = this.agentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
