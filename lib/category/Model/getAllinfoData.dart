import 'dart:convert';

class Categories {
  int? id;
  String? name;
  String? image;
  String? gender;

  Categories({this.id, this.name, this.image, this.gender});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['gender'] = gender;
    return data;
  }
}

class Subcategories {
  int? id;
  String? categoryId;
  String? name;
  String? image;

  Subcategories({this.id, this.categoryId, this.name, this.image});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class BodyParts {
  int? id;
  String? subcategoryId;
  String? name;

  BodyParts({this.id, this.subcategoryId, this.name});

  BodyParts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subcategoryId = json['subcategory_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subcategory_id'] = subcategoryId;
    data['name'] = name;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city_id'] = cityId;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

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
    if (json['category'] != null) {
      categories = <Categories>[];
      json['category'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['subcategory'] != null) {
      subcategories = <Subcategories>[];
      json['subcategory'].forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
    if (json['bodypart'] != null) {
      bodyParts = <BodyParts>[];
      json['bodypart'].forEach((v) {
        bodyParts!.add(BodyParts.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['category'] = categories!.map((v) => v.toJson()).toList();
    }
    if (subcategories != null) {
      data['subcategory'] = subcategories!.map((v) => v.toJson()).toList();
    }
    if (bodyParts != null) {
      data['bodypart'] = bodyParts!.map((v) => v.toJson()).toList();
    }
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
