// class DataModel {
//   final int id;
//   final String name;
//   final String description;
//   final double price;
//   final List<String> time;
//   final String gender;
//   final List<String> location;
//   final double rating;
//   final List<String> bodypart;

//   DataModel({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.time,
//     required this.gender,
//     required this.location,
//     required this.rating,
//     required this.bodypart,
//   });

//   factory DataModel.fromJson(Map<String, dynamic> json) {
//     return DataModel(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'],
//       price: double.parse(json['price']),
//       time: List<String>.from(json['time']),
//       gender: json['gender'],
//       location: List<String>.from(json['location']),
//       rating: json['rating'],
//       bodypart: List<String>.from(json['bodypart']),
//     );
//   }
 
// }

class Item {
  final int id;
  final String name;
  final String description;
  final String price;
  final String category;
  final String img_url;
  final String servicePrice;
  final String subcategory;
  final List<String> time;
  final String gender;
  final List<String> location;
  final double rating;
  final List<String> bodypart;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.time,
    required this.img_url,
    required this.servicePrice,

    required this.gender,
    required this.category,
    required this.subcategory,
    required this.location,
    required this.rating,
    required this.bodypart,
  });
}

List<Item> items = [
  Item(
    id: 1,
    name: 'Womans Doll',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
    price: '100',
    servicePrice: "500",
    category:"Wax",
    img_url:"https://i.pinimg.com/736x/90/e6/04/90e60491fd8cef22e665531a5c754498.jpg",
    subcategory:"Honey WaX",
    time: ['10.5', '5.30', '8.00'],
    gender: 'female',
    location: ['Mirpur-1', 'bijoy Soroni', 'banani', 'shamoly'],
    rating: 4.5,
    bodypart: ['hand', 'face', 'leg', ''],
  ),
  Item(
    id: 2,
    name: 'Parsona Beasuty',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text",
    price: '100',
      servicePrice: "500",
     category:"Wax",
     img_url:"https://i.pinimg.com/564x/3b/14/64/3b14649ffc7d9893e575141054d68b1e.jpg",
    subcategory:"Honey WaX",
    time: ['10.5', '5.30', '8.00'],
    gender: 'male',
    location: ['Mirpur-2', 'kafrul', 'Gulsahan', 'Badda'],
    rating: 3.5,
    bodypart: ['hand', 'face', 'leg', ''],
  ),
  Item(
    id: 3,
    name: 'Makover by sadia',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    price: '180',
      servicePrice: "500",
     category:"Wax",
     img_url:"https://i.pinimg.com/736x/90/e6/04/90e60491fd8cef22e665531a5c754498.jpg",
    subcategory:"Cold WaX",
    time: ['10.5', '5.30', '8.00'],
    gender: 'Both',
    location: ['Mirpur-1', 'Uttora', 'banani', 'shamoly'],
    rating: 4.5,
    bodypart: ['hand', 'face', 'leg', ''],
  ),
    Item(
    id: 4,
    name: 'Makover by sadia',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    price: '180',
      servicePrice: "500",
     category:"Wax",
     img_url:"https://i.pinimg.com/564x/8a/9a/75/8a9a75d746afabb855a9e698d2e34e3d.jpg",
    subcategory:"Cold WaX",
    time: ['10.5', '5.30', '8.00'],
    gender: 'Both',
    location: ['Mirpur-1', 'Nikunjo', 'banani', 'shamoly'],
    rating: 1.5,
    bodypart: ['hand'],
  ),
    Item(
    id: 5,
    name: 'Makover by sadia',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    price: '180',
      servicePrice: "500",
     category:"Wax",
     img_url:"https://i.pinimg.com/564x/3b/14/64/3b14649ffc7d9893e575141054d68b1e.jpg",
    subcategory:"Cold WaX",
    time: ['4.5', '5.30', '8.00'],
    gender: 'Both',
    location: ['bashundhora', 'kuril', 'banani', 'shamoly'],
    rating: 4.5,
    bodypart: [ 'face', 'leg', ''],
  ),
];