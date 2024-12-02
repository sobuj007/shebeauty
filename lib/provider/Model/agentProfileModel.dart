class AgentprofileModel {
  String? message;
  List<Profiles>? profiles;
  List<Exparts>? exparts;
  List<Certificate>? certificate;
  List<Products>? products;

  AgentprofileModel(
      {this.message,
      this.profiles,
      this.exparts,
      this.certificate,
      this.products});

  AgentprofileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['profiles'] != null) {
      profiles = <Profiles>[];
      json['profiles'].forEach((v) {
        profiles!.add(new Profiles.fromJson(v));
      });
    }
    if (json['exparts'] != null) {
      exparts = <Exparts>[];
      json['exparts'].forEach((v) {
        exparts!.add(new Exparts.fromJson(v));
      });
    }
    if (json['certificate'] != null) {
      certificate = <Certificate>[];
      json['certificate'].forEach((v) {
        certificate!.add(new Certificate.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.profiles != null) {
      data['profiles'] = this.profiles!.map((v) => v.toJson()).toList();
    }
    if (this.exparts != null) {
      data['exparts'] = this.exparts!.map((v) => v.toJson()).toList();
    }
    if (this.certificate != null) {
      data['certificate'] = this.certificate!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profiles {
  int? id;
  String? storename;
  String? coverImage;
  String? tradelicence;
  String? servicestime;
  String? address;
  String? mobile;
  String? logo;
  String? cityId;
  String? locationIds;
  String? nid;
  String? companyType;
  String? agentId;
  String? createdAt;
  String? updatedAt;

  Profiles(
      {this.id,
      this.storename,
      this.coverImage,
      this.tradelicence,
      this.servicestime,
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

  Profiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storename = json['storename'];
    coverImage = json['coverImage'];
    tradelicence = json['tradelicence'];
    servicestime = json['servicestime'];
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
    data['coverImage'] = this.coverImage;
    data['tradelicence'] = this.tradelicence;
    data['servicestime'] = this.servicestime;
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

class Exparts {
  int? id;
  String? name;
  String? profileImage;
  String? expartyear;
  String? gender;
  String? mobile;
  String? certificateImages;
  String? agentId;
  String? createdAt;
  String? updatedAt;

  Exparts(
      {this.id,
      this.name,
      this.profileImage,
      this.expartyear,
      this.gender,
      this.mobile,
      this.certificateImages,
      this.agentId,
      this.createdAt,
      this.updatedAt});

  Exparts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profileImage = json['profile_image'];
    expartyear = json['expartyear'];
    gender = json['gender'];
    mobile = json['mobile'];
    certificateImages = json['certificate_images'];
    agentId = json['agent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_image'] = this.profileImage;
    data['expartyear'] = this.expartyear;
    data['gender'] = this.gender;
    data['mobile'] = this.mobile;
    data['certificate_images'] = this.certificateImages;
    data['agent_id'] = this.agentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Certificate {
  int? id;
  String? agentId;
  String? title;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Certificate(
      {this.id,
      this.agentId,
      this.title,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt});

  Certificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agentId = json['agent_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['agent_id'] = this.agentId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Products {
  int? id;
  String? agentId;
  String? categoryId;
  String? subcategoryId;
  var bodypartId;
  String? cityId;
  var locationIds;
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

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
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
