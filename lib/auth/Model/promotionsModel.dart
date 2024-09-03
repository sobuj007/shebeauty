// To parse this JSON data, do
//
//     final promotionadsModel = promotionadsModelFromJson(jsonString);

import 'dart:convert';

PromotionadsModel promotionadsModelFromJson(String str) => PromotionadsModel.fromJson(json.decode(str));

String promotionadsModelToJson(PromotionadsModel data) => json.encode(data.toJson());

class PromotionadsModel {
    String message;
    List<Ads> data;

    PromotionadsModel({
        required this.message,
        required this.data,
    });

    factory PromotionadsModel.fromJson(Map<String, dynamic> json) => PromotionadsModel(
        message: json["message"],
        data: List<Ads>.from(json["data"].map((x) => Ads.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Ads {
    int id;
    String title;
    String description;
    String image;
    String link;
    DateTime createdAt;
    DateTime updatedAt;

    Ads({
        required this.id,
        required this.title,
        required this.description,
        required this.image,
        required this.link,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        link: json["link"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "link": link,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
