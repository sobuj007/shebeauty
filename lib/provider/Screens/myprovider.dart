// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shebeauty/provider/Model/allProductModel.dart';
// import 'package:sizer/sizer.dart';

// import '../../category/Controllers/getAllinfocontoller.dart';
// import '../../main.dart';
// import '../../routes/AppRouts.dart';
// import '../../utils/appApis.dart';
// import '../../utils/appColors.dart';
// import '../../utils/appFonts.dart';
// import '../../utils/custom widget/CustomAppbar2.dart';
// import '../../utils/custom widget/Customratings.dart';
// import '../Controllers/ProductContorller.dart';
// // Import your controller

// class MyProvider extends StatelessWidget {
// final ProductController controller = Get.put(ProductController());
//      final AllinfoController con=Get.find();
//      var _filteredItems = <Allproduct>[].obs;
//      var _selectedLocation = 'All'.obs();
 
//   var _selectedBodyPart = 'All'.obs ();
//   var _selectedTime = 'All'.obs();
  
//   var searchQuery = ''.obs; 
//    // RxList for selected genders and ratings
//   var _selectedGender = ['All', 'Male', 'Female'].obs;
//   var _selectedRating = [1.0, 2.0, 3.0, 4.0, 5.0].obs;

//   // RxString for single selected value (example)
//   var selectedGender = 'All'.obs;
//   var selectedRating = 1.0.obs;

//   // Function to update selected gender
//   void updateSelectedGender(String gender) {
//     selectedGender.value = gender;
//   }

//   // Function to update selected rating
//   void updateSelectedRating(double rating) {
//     selectedRating.value = rating;
//   }

 



//   @override
//   Widget build(BuildContext context) {
//     controller.fetchProducts();
//      var arg=Get.arguments;
//     return Scaffold(
//         body: Column(children: [
//       CustomAppbar2(
//         title: "All provider",
//       ),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               width: 78.w,
//               height: 5.8.h,
//               child: TextField(
//                 decoration: InputDecoration(
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
//                   hintText: 'Search...',
//                   border: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(width: 1, color: AppColors.themeColer),
//                       borderRadius: BorderRadius.circular(15)),
//                   enabledBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(width: 1, color: AppColors.themeColer),
//                       borderRadius: BorderRadius.circular(15)),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(width: 1, color: AppColors.themeColer),
//                       borderRadius: BorderRadius.circular(15)),
//                   hintStyle: AppFonts.fontH4regular(AppColors.themehint),
//                 ),
//                 style: AppFonts.fontH4regular(AppColors.themeBlack),
//                 onChanged: (query) {
       
//       // Otherwise, set the search query and apply filters
   
//       // Otherwise, set the search query and apply filters
//       controller.searchQuery(query);
  
 
                 
//                 },
//               ),
//             ),
//             // Card(
//             //   child: IconButton(
//             //     icon: Icon(Icons.filter_list),
//             //     onPressed: () => _showFilterDialog(context),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//       Expanded(child: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (controller.product.isEmpty) {
//           return Center(child: Text('No products available'));
//         }
//          else {
          
//           _filteredItems =controller.filterBySubcategory(arg['subid'].toString());

//           return _filteredItems.isEmpty? Center(child: Text('No products available')): Padding(
//             padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
//             child: ListView.builder(
//               // shrinkWrap: true,
//               padding: EdgeInsets.zero,

//               itemCount:_filteredItems.length,
//               itemBuilder: (context, index) {
//                 final product =_filteredItems;
//                 return Container(
//                   height: 20.h,
//                   width: 100.w,
//                   decoration: BoxDecoration(
//                       border:
//                           Border.all(width: 1, color: AppColors.themeborder),
//                       borderRadius: BorderRadius.circular(10)),
//                   margin: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 20.h,
//                         width: 30.w,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: CachedNetworkImageProvider(
//                                   AppAppis.makeimgUrl(
//                                      _filteredItems[index].imgUrl),
//                                 ),
//                                 fit: BoxFit.cover),
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Container(
//                           color: const Color.fromARGB(60, 100, 99, 99),
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 8.0, vertical: 2),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   width: 58.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                        _filteredItems[index].name ?? "",
//                                         style: AppFonts.fontH5semi(
//                                             AppColors.themeBlack),
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       Rattings(
//                                         rate:_filteredItems[index].rating
//                                             .toString(),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 58.w,
//                                   height: 3.5.h,
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           controller
//                                                   .product[index].description ??
//                                               "",
//                                           style: AppFonts.fontH7normal(
//                                               AppColors.themeBlack),
//                                           maxLines: 2,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 /************************** gender */
//                                 Container(
//                                   height: 4.h,
//                                   width: 58.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Gender : " +
//                                            _filteredItems[index].gender
//                                                 .toString(),
//                                         style: AppFonts.fontH6semi(
//                                             AppColors.themeBlack),
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.start,
//                                       ),
//                                       RichText(
//                                         text: TextSpan(
//                                             text: "price ",
//                                             style: AppFonts.fontH6semi(
//                                                 AppColors.themeBlack),
//                                             children: [
//                                               TextSpan(
//                                                   text: controller
//                                                       .product[index].price,
//                                                   style: AppFonts.fontH3semi(
//                                                       AppColors.themeColer))
//                                             ]),
//                                       )
//                                       // Text(
//                                       //   "price" +_filteredItems[index].price,
//                                       //   style: AppFonts.fontH4semi(
//                                       //       AppColors.themeBlack),
//                                       //   maxLines: 2,
//                                       //   overflow: TextOverflow.ellipsis,
//                                       // ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           /************************** Book noe button */
//                           Container(
//                             width: 63.2.w,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 8.0),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                        _filteredItems[index].category ??
//                                             "",
//                                         style: AppFonts.fontH7semi(
//                                             AppColors.themeBlack),
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       Text(
//                                        _filteredItems[index].subcategory ??
//                                             "",
//                                         style: AppFonts.fontH7semi(
//                                             AppColors.themeBlack),
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     //  Get.toNamed(AppRoutes.appsingelprovider,arguments:_filteredItems[index]);
//                                   },
//                                   child: Container(
//                                     height: 5.h,
//                                     width: 35.w,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.only(
//                                           bottomRight: Radius.circular(10)),
//                                       color: AppColors.themeColer,
//                                     ),
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       applng.getLang(14),
//                                       style: AppFonts.fontH6semi(
//                                           AppColors.themeWhite),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//         ;
//       }))
//     ]));
//   }
//    void _showFilterDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Filter Options',style: AppFonts.fontH5semi(AppColors.themeBlack),),
//             IconButton(onPressed: (){
//               Get.close(1);
//             }, icon: Icon(Icons.close))
//           ],
//         ),
//         content: StatefulBuilder(
//           builder: (BuildContext context, setState) {
//             return Container(
//               color: AppColors.themeWhite,
//               height: 30.h,
//               child: Column(
//                 children: [
//                   /*************************************************Location******************************** */
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Container(
//                   //       width: 18.w,
//                   //       child: Text(
//                   //         "Location :",
//                   //         style: AppFonts.fontH6semi(AppColors.themeBlack),
//                   //       ),
//                   //     ),
//                   //     SizedBox(width: 2.w),
//                   //     Expanded(
                        
//                   //       child: Container(
//                   //         // width: 35.w,
//                   //       height: 6.h,
//                   //       alignment: Alignment.bottomRight,
//                   //       decoration: BoxDecoration(
//                   //         border: Border.all(width: 1, color: AppColors.themeborder),
//                   //         borderRadius: BorderRadius.circular(10),
//                   //       ),
//                   //         child: DropdownButton<String>(
//                   //           alignment: Alignment.centerRight, isExpanded: true, 
//                   //           padding: EdgeInsets.symmetric(horizontal: 5.w),
//                   //           underline: SizedBox(),
//                   //           value: _selectedLocation,
//                   //           items: ['All', 'Mirpur-1', 'bijoy Soroni', 'banani', 'shamoly', 'badda', 'Bashundhara R/A']
//                   //               .map((String value) {
//                   //             return DropdownMenuItem<String>(
//                   //               value: value,
//                   //               child: Text(
//                   //                 value,
//                   //                 style: AppFonts.fontH6semi(AppColors.themeColer),
//                   //               ),
//                   //             );
//                   //           }).toList(),
//                   //           onChanged: (String? newValue) {
//                   //             setState(() {
//                   //               _selectedLocation = newValue!;
//                   //             });
//                   //           },
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   SizedBox(height: 2.w),
//                   /**************************************rating*************************** */
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: 18.w,
//                         child: Text(
//                           "Rating :",
//                           style: AppFonts.fontH6semi(AppColors.themeBlack),
//                         ),
//                       ),
//                       SizedBox(width: 2.w),
//                       Expanded(
//                         child: Container(
                       
//                           height: 5.h,
//                           alignment: Alignment.bottomRight,
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 1, color: AppColors.themeborder),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                            padding: EdgeInsets.symmetric(horizontal: 5.w),
//                           child: DropdownButton<double>(
//                             value: selectedRating.value,
//                              underline: Container(),

//                                 padding: EdgeInsets.symmetric(horizontal: 5),
//                                  isExpanded: true, 
//                             items: _selectedRating.map((double value) {
//                               return DropdownMenuItem<double>(
//                                 value: value,
//                                 child: Text(
//                                   value.toString(),
//                                   style: AppFonts.fontH6semi(AppColors.themeColer),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (double? newValue) {
                              
//                                 _selectedRating.value = newValue! as List<double>;
                           
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 2.w),
//                   // /****************************************************body part**************** */
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Container(
//                   //       width: 18.w,
//                   //       child: Text(
//                   //         "BodyPart :",
//                   //         style: AppFonts.fontH6semi(AppColors.themeBlack),
//                   //       ),
//                   //     ),
//                   //     SizedBox(width: 2.w),
//                   //     Expanded(
//                   //       child: Container(
                   
//                   //         height: 5.h,
//                   //         alignment: Alignment.bottomRight,
//                   //         decoration: BoxDecoration(
//                   //           border: Border.all(width: 1, color: AppColors.themeborder),
//                   //           borderRadius: BorderRadius.circular(10),
//                   //         ), padding: EdgeInsets.symmetric(horizontal: 5.w),
//                   //         child: DropdownButton<String>(
//                   //           value: _selectedBodyPart,isExpanded: true,  underline: Container(),
//                   //           items: ['All', 'hand', 'face', 'leg'].map((String value) {
//                   //             return DropdownMenuItem<String>(
//                   //               value: value,
                                 
//                   //               child: Text(
//                   //                 value.toString(),
//                   //                 style: AppFonts.fontH6semi(AppColors.themeColer),
//                   //               ),
//                   //             );
//                   //           }).toList(),
//                   //           onChanged: (String? newValue) {
//                   //             setState(() {
//                   //               _selectedBodyPart = newValue!;
//                   //             });
//                   //           },
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   SizedBox(height: 2.w),
//                   // /*********************************************time*************  */
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Container(
//                   //       width: 18.w,
//                   //       child: Text(
//                   //         "Time :",
//                   //         style: AppFonts.fontH6semi(AppColors.themeBlack),
//                   //       ),
//                   //     ),
//                   //     SizedBox(width: 2.w),
//                   //     Expanded(
//                   //       child: Container(
                        
//                   //         height: 5.h,
//                   //         alignment: Alignment.bottomRight,
//                   //         decoration: BoxDecoration(
//                   //           border: Border.all(width: 1, color: AppColors.themeborder),
//                   //           borderRadius: BorderRadius.circular(10),
//                   //         ), padding: EdgeInsets.symmetric(horizontal: 5.w),
//                   //         child: DropdownButton<String>(
//                   //           value: _selectedTime, isExpanded: true, 
//                   //           underline: Container(),
//                   //           items: ['All', '10.5', '5.30', '8.00'].map((String value) {
//                   //             return DropdownMenuItem<String>(
//                   //               value: value,
//                   //               child: Text(
//                   //                 value,
//                   //                 style: AppFonts.fontH6semi(AppColors.themeColer),
//                   //               ),
//                   //             );
//                   //           }).toList(),
//                   //           onChanged: (String? newValue) {
//                   //             setState(() {
//                   //               _selectedTime = newValue!;
//                   //             });
//                   //           },
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   SizedBox(height: 2.w),
//                   /*********************************************Gender*************  */
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: 18.w,
//                         child: Text(
//                           "Gender :",
//                           style: AppFonts.fontH6semi(AppColors.themeBlack),
//                         ),
//                       ),
//                       SizedBox(width: 2.w),
//                       Expanded(
//                         child: Container(
                        
//                           height: 5.h,
//                           alignment: Alignment.bottomRight,
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 1, color: AppColors.themeborder),
//                             borderRadius: BorderRadius.circular(10),
//                           ), padding: EdgeInsets.symmetric(horizontal: 5.w),
//                           child: DropdownButton<String>(
//                             value: selectedGender.value, isExpanded: true, 
//                             underline: Container(),
//                             items: _selectedGender.map((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(
//                                   value,
//                                   style: AppFonts.fontH6semi(AppColors.themeColer),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (String? newValue) {
                             
//                                 selectedGender.value = newValue!;
                             
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         actions: [
//           TextButton(
//             child: Text('Apply',style: AppFonts.fontH5black(AppColors.themeColer
//             ),
//             ),
//             onPressed: () {
             
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
//  void search(String query) {
//     if (query.isEmpty) {
//       _filteredItems = controller.product;
//     } else {
//       _filteredItems.value = controller.product.where((product) {
//         return product.name!.toLowerCase().contains(query.toLowerCase());
//       }).toList();
      
//     }
//   }

// }

