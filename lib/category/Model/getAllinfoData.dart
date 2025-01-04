class AllinfoModel {
  List<Category>? category;
  List<Subcategory>? subcategory;
  List<Bodypart>? bodypart;
  List<Cities>? cities;
  List<Location>? location;

  AllinfoModel(
      {this.category,
      this.subcategory,
      this.bodypart,
      this.cities,
      this.location});

  AllinfoModel.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(Subcategory.fromJson(v));
      });
    }
    if (json['bodypart'] != null) {
      bodypart = <Bodypart>[];
      json['bodypart'].forEach((v) {
        bodypart!.add(Bodypart.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
    if (json['location'] != null) {
      location = <Location>[];
      json['location'].forEach((v) {
        location!.add(Location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (subcategory != null) {
      data['subcategory'] = subcategory!.map((v) => v.toJson()).toList();
    }
    if (bodypart != null) {
      data['bodypart'] = bodypart!.map((v) => v.toJson()).toList();
    }
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    if (location != null) {
      data['location'] = location!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? gender;
  String? catDescription;

  Category({this.id, this.name, this.image, this.gender, this.catDescription});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    gender = json['gender'];
    catDescription = json['cat_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['gender'] = gender;
    data['cat_description'] = catDescription;
    return data;
  }
}

class Subcategory {
  int? id;
  int? categoryId;
  String? name;
  String? image;
  String? steps;
  String? necessaryproduct;
  String? afterservicesinstruction;
  String? providerguideline;
  String? customerguideline;

  Subcategory({
    this.id,
    this.categoryId,
    this.name,
    this.image,
    this.steps,
    this.necessaryproduct,
    this.afterservicesinstruction,
    this.providerguideline,
    this.customerguideline,
  });

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    steps = json['steps'];
    necessaryproduct = json['necessaryproduct'];
    afterservicesinstruction = json['afterservicesinstruction'];
    providerguideline = json['providerguideline'];
    customerguideline = json['customerguideline'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['steps'] = steps;
    data['necessaryproduct'] = necessaryproduct;
    data['afterservicesinstruction'] = afterservicesinstruction;
    data['providerguideline'] = providerguideline;
    data['customerguideline'] = customerguideline;
    data['image'] = image;
    return data;
  }
}

class Bodypart {
  int? id;
  int? subcategoryId;
  String? name;

  Bodypart({
    this.id,
    this.subcategoryId,
    this.name,
  });

  Bodypart.fromJson(Map<String, dynamic> json) {
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

  Cities({this.id, this.name});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Location {
  int? id;
  int? citiesId;
  String? name;

  Location({this.id, this.citiesId, this.name});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    citiesId = json['cities_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cities_id'] = citiesId;
    data['name'] = name;
    return data;
  }
}
