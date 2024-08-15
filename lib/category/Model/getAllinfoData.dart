class AllinfoModel {
  List<Categories>? categories;
  List<Subcategories>? subcategories;
  List<BodyParts>? bodyParts;
  List<Cities>? cities;
  List<Locations>? locations;

  AllinfoModel(
      {this.categories,
      this.subcategories,
      this.bodyParts,
      this.cities,
      this.locations});

  AllinfoModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
    if (json['bodyParts'] != null) {
      bodyParts = <BodyParts>[];
      json['bodyParts'].forEach((v) {
        bodyParts!.add(new BodyParts.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    if (this.bodyParts != null) {
      data['bodyParts'] = this.bodyParts!.map((v) => v.toJson()).toList();
    }
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? img;

  Categories(
      {this.id,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.img});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['img'] = this.img;
    return data;
  }
}

class Subcategories {
  int? id;
  String? categoryId;
  String? subcategoryName;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? img;

  Subcategories(
      {this.id,
      this.categoryId,
      this.subcategoryName,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.img});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryName = json['subcategory_name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['subcategory_name'] = this.subcategoryName;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['img'] = this.img;
    return data;
  }
}

class BodyParts {
  int? id;
  String? subcategoryId;
  String? bodypartName;
  String? createdAt;
  String? updatedAt;
  String? img;

  BodyParts(
      {this.id,
      this.subcategoryId,
      this.bodypartName,
      this.createdAt,
      this.updatedAt,
      this.img});

  BodyParts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subcategoryId = json['subcategory_id'];
    bodypartName = json['bodypart_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subcategory_id'] = this.subcategoryId;
    data['bodypart_name'] = this.bodypartName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['img'] = this.img;
    return data;
  }
}

class Cities {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Cities({this.id, this.name, this.createdAt, this.updatedAt});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Locations {
  int? id;
  String? cityId;
  String? name;
  String? createdAt;
  String? updatedAt;

  Locations({this.id, this.cityId, this.name, this.createdAt, this.updatedAt});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

}
