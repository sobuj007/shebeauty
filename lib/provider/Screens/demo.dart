// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../getservices/Controllers/servicesContoller.dart';


// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final GetServicesContoller controller = Get.find<GetServicesContoller>();

//     return Scaffold(
//       appBar: AppBar(title: Text('Home Page')),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (controller.servicesModel.value == null) {
//           return Center(child: Text('Error fetching data'));
//         } else {
//           return ListView.builder(
//             // ignore: invalid_use_of_protected_member
//             itemCount: controller.allproduct!.length,
//             itemBuilder: (context, index) {
//               final product = controller.allproduct![index];
            
//               return ListTile(
//                 title: Text(product.name.toString()),
//                 subtitle: Text(product.description.toString()),
//                 onTap: () {
//                   //Get.to(SecondPage()); // Navigate to another page
//                 },
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }
