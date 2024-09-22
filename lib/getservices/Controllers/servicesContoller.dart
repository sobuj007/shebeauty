// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart'as http;
// import 'package:Ghore_Parlor/getservices/Model/ServicesModel.dart';

// class GetServicesContoller extends GetxController{
// var servicesModel = ServicsModel().obs;
//  var isLoading = true.obs;
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     fecthingData();
//   }
//   fecthingData() async {
//     isLoading.value=true;
//     var headersList = {
//  'Accept': 'application/json' 
// };
// var url = Uri.parse('http://softisan.xyz/api/getallProducts');

// var req = http.Request('GET', url);
// req.headers.addAll(headersList);

// var res = await req.send();
// final resBody = await res.stream.bytesToString();

// if (res.statusCode >= 200 && res.statusCode < 300) {
//   print(resBody);

//     try {
//       var res = await req.send();
//       final resBody = await res.stream.bytesToString();

//       if (res.statusCode >= 200 && res.statusCode < 300) {
//          var jsonResponse = json.decode(resBody);
//         servicesModel.value = ServicsModel.fromJson(jsonResponse)  ;

//       } else {
//         print("Error: ${res.reasonPhrase}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       isLoading.value = false;
//       print(servicesModel);
//     }
// }
// else {
//   print(res.reasonPhrase);
// }
//   }
//     List<Allproduct>? get allproduct => servicesModel.value.allproduct;

// }