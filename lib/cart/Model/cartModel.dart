import 'package:shebeauty/provider/Model/allproviderDataModel.dart';

class CartItem {
  String id;
  String name;
  String img;
  String selectedTime;
  String selectedDate;
  String selectedServicsQun;
  String selectedProductQun;
  Item item;

  CartItem({
    required this.id,
    required this.name,
    required this.img,
    required this.selectedTime,
    required this.selectedDate,
    required this.selectedServicsQun,
    required this.selectedProductQun, 
    required this. item, 
  });

  // Method to convert from JSON to CartItem
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      selectedTime: json['selectedTime'],
      selectedDate: json['selectedDate'],
      item: json['product'],
      selectedServicsQun: json['selectedServicsQun'],
      selectedProductQun: json['selectedProductQun'],
    );
  }

  // Method to convert from CartItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'img': img,
      'selectedTime': selectedTime,
      'selectedDate': selectedDate,
      'selectedServicsQun': selectedServicsQun,
      'selectedProductQun': selectedProductQun,
      'product':  item,
    };
  }
}