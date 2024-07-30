import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shebeauty/main.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:shebeauty/utils/custom%20widget/Customratings.dart';
import 'package:sizer/sizer.dart';

import '../../provider/Model/allproviderDataModel.dart';
import '../../routes/AppRouts.dart';
import '../../utils/appColors.dart';
import '../Controllers/cartCOntroller.dart';
class MyListedCart extends StatefulWidget {
  const MyListedCart({super.key});

  @override
  State<MyListedCart> createState() => _MyListedCartState();
}

class _MyListedCartState extends State<MyListedCart> {
 var _items2 =[];
  var _filteredItems2 = [];
  String _selectedLocation = 'All';
  double _selectedRating = 0.0;
  String _selectedBodyPart = 'All';
  String _selectedTime = 'All';
  String _searchQuery = '';

@override
  void initState() {
    // TODO: implement initState
    _items2=cartListItem;
  _filteredItems2=cartListItem;
    
  }
   final CartController cartController = Get.put(CartController());
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CustomAppbar(
          //   title: "All provider",
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         width: 78.w,
          //         height: 5.8.h,
          //         child: TextField(
          //           decoration: InputDecoration(
          //             contentPadding:
          //                 EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
          //             hintText: 'Search...',
          //             border: OutlineInputBorder(
          //                 borderSide:
          //                     BorderSide(width: 1, color: AppColors.themeColer),
          //                 borderRadius: BorderRadius.circular(15)),
          //             enabledBorder: OutlineInputBorder(
          //                 borderSide:
          //                     BorderSide(width: 1, color: AppColors.themeColer),
          //                 borderRadius: BorderRadius.circular(15)),
          //             focusedBorder: OutlineInputBorder(
          //                 borderSide:
          //                     BorderSide(width: 1, color: AppColors.themeColer),
          //                 borderRadius: BorderRadius.circular(15)),
          //             hintStyle: AppFonts.fontH4regular(AppColors.themehint),
          //           ),
          //           style: AppFonts.fontH4regular(AppColors.themeBlack),
          //           onChanged: (query) {
          //             setState(() {
          //               _searchQuery = query;
          //              // _applyFilters();
          //             });
          //           },
          //         ),
          //       ),
          //       Card(
          //         child: IconButton(
          //           icon: Icon(Icons.filter_list),
          //           onPressed: () => _showFilterDialog(context),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Flexible(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
          //     child: _filteredItems2.isEmpty?Center(child: Text("MyListedCart is Empty",style: AppFonts.fontH5semi(AppColors.themeColer),),):
          //      ListView.builder(
          //       // shrinkWrap: true,
          //       padding: EdgeInsets.zero,
            
          //       itemCount: _filteredItems2.length,
          //       itemBuilder: (context, index) {
          //         // return ListTile(
          //         //   title: Text(_filteredItems2[index].name),
          //         //   subtitle: Text(_filteredItems2[index].description),
          //         //   trailing: Text(_filteredItems2[index].rating.toString()),
          //         // );
          //         return Container(
          //           height: 20.h,
          //           width: 100.w,
          //           decoration: BoxDecoration(
          //               border:
          //                   Border.all(width: 1, color: AppColors.themeborder),
          //               borderRadius: BorderRadius.circular(10)),
          //           margin: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
          //           child: Row(
          //             children: [
          //               Container(
          //                 height: 20.h,
          //                 width: 30.w,
          //                 decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         image: CachedNetworkImageProvider(
          //                           _filteredItems2[index].img_url,
          //                         ),
          //                         fit: BoxFit.cover),
          //                     borderRadius: BorderRadius.circular(10)),
          //                   child: Container(color: const Color.fromARGB(60, 100, 99, 99),),
          //               ),
          //               Column(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Padding(
          //                     padding: const EdgeInsets.symmetric(
          //                         horizontal: 8.0, vertical: 2),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Container(
          //                           width: 58.w,
          //                           child: Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               Text(
          //                                 _filteredItems2[index].name,
          //                                 style: AppFonts.fontH5semi(
          //                                     AppColors.themeBlack),
          //                                 maxLines: 2,
          //                                 overflow: TextOverflow.ellipsis,
          //                               ),
          //                               Rattings(
          //                                 rate: _filteredItems2[index]
          //                                     .rating
          //                                     .toString(),
          //                               )
          //                             ],
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           width: 58.w,
          //                           height: 3.5.h,
          //                           child: Row(
          //                             children: [
          //                               Expanded(
          //                                 child: Text(
          //                                   _filteredItems2[index].description,
          //                                   style: AppFonts.fontH7normal(
          //                                       AppColors.themeBlack),
          //                                   maxLines: 2,
          //                                   overflow: TextOverflow.ellipsis,
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                              /************************** gender */
          //                         Container(
          //                           height: 4.h,
          //                           width: 58.w,
          //                           child: Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               Text(
          //                                 "Gender : " +
          //                                     _filteredItems2[index]
          //                                         .gender
          //                                         .toString(),
          //                                 style: AppFonts.fontH6semi(
          //                                     AppColors.themeBlack),
          //                                 maxLines: 1,
          //                                 overflow: TextOverflow.ellipsis,
          //                                 textAlign: TextAlign.start,
          //                               ),
          //                               RichText(text: TextSpan(
          //                                 text: "price ",
          //                                 style: AppFonts.fontH6semi(AppColors.themeBlack),
            
          //                                 children: [
          //                                   TextSpan(text: _filteredItems2[index].price,
          //                                 style: AppFonts.fontH3semi(
          //                                     AppColors.themeColer))
            
          //                               ]),)
          //                               // Text(
          //                               //   "price" + _filteredItems2[index].price,
          //                               //   style: AppFonts.fontH4semi(
          //                               //       AppColors.themeBlack),
          //                               //   maxLines: 2,
          //                               //   overflow: TextOverflow.ellipsis,
          //                               // ),
          //                             ],
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   /************************** Book noe button */
          //                   Container(
          //                     width: 63.2.w,
          //                     child: Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //                           child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               Text(
          //                                   _filteredItems2[index].category,
          //                                   style: AppFonts.fontH7semi(
          //                                       AppColors.themeBlack),
          //                                   maxLines: 2,
          //                                   overflow: TextOverflow.ellipsis,
          //                                 ),
          //                               Text(
          //                                   _filteredItems2[index].subcategory,
          //                                   style: AppFonts.fontH7semi(
          //                                       AppColors.themeBlack),
          //                                   maxLines: 2,
          //                                   overflow: TextOverflow.ellipsis,
          //                                 ),
                                    
          //                           ],),
          //                         ),
          //                         GestureDetector(
          //                           onTap: (){
          //                             Get.toNamed(AppRoutes.appsingelprovider,arguments: _filteredItems2[index]);
          //                           },
          //                           child: Container(
          //                             height: 5.h,
          //                             width: 35.w,
          //                             decoration: BoxDecoration(
          //                               borderRadius: BorderRadius.only(
          //                                   bottomRight: Radius.circular(10)),
          //                               color: AppColors.themeColer,
          //                             ),
          //                             alignment: Alignment.center,
          //                             child: Text(
          //                               applng.getLang(14),
          //                               style: AppFonts.fontH6semi(
          //                                   AppColors.themeWhite),
          //                             ),
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                   )
          //                 ],
          //               )
          //             ],
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          Expanded(
            child:cartController.items.isEmpty?Center(child: Text("MyListedCart is Empty",style: AppFonts.fontH5semi(AppColors.themeColer),),):
              Obx(() {
              return ListView.builder(
                itemCount: cartController.items.length,
                itemBuilder: (context, index) {
                  final item = cartController.items[index];
                  return ListTile(
                    leading: Image.network(item.img),
                    title: Text(item.name),
                    subtitle: Text('Time: ${item.selectedTime}\nDate: ${item.selectedDate}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        cartController.removeItem(item.id);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

 
   void _showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Filter Options'),
            IconButton(onPressed: (){
              Get.close(1);
            }, icon: Icon(Icons.close))
          ],
        ),
        content: StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              color: AppColors.themeWhite,
              height: 30.h,
              child: Column(
                children: [
                  /*************************************************Location******************************** */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 18.w,
                        child: Text(
                          "Location :",
                          style: AppFonts.fontH4semi(AppColors.themeBlack),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        width: 35.w,
                        height: 6.h,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.themeborder),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<String>(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          underline: SizedBox(),
                          value: _selectedLocation,
                          items: ['All', 'Mirpur-1', 'bijoy Soroni', 'banani', 'shamoly', 'badda', 'Bashundhara R/A']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: AppFonts.fontH5semi(AppColors.themeColer),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLocation = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.w),
                  /**************************************rating*************************** */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 18.w,
                        child: Text(
                          "Rating :",
                          style: AppFonts.fontH4semi(AppColors.themeBlack),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        width: 35.w,
                        height: 5.h,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.themeborder),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<double>(
                          value: _selectedRating,
                          items: [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0].map((double value) {
                            return DropdownMenuItem<double>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: AppFonts.fontH5semi(AppColors.themeColer),
                              ),
                            );
                          }).toList(),
                          onChanged: (double? newValue) {
                            setState(() {
                              _selectedRating = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.w),
                  /****************************************************body part**************** */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 18.w,
                        child: Text(
                          "Body Part :",
                          style: AppFonts.fontH4semi(AppColors.themeBlack),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        width: 35.w,
                        height: 5.h,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.themeborder),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<String>(
                          value: _selectedBodyPart,
                          items: ['All', 'hand', 'face', 'leg'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value.toString(),
                                style: AppFonts.fontH5semi(AppColors.themeColer),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedBodyPart = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.w),
                  /*********************************************time*************  */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 18.w,
                        child: Text(
                          "Time :",
                          style: AppFonts.fontH4semi(AppColors.themeBlack),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        width: 35.w,
                        height: 5.h,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.themeborder),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton<String>(
                          value: _selectedTime,
                          items: ['All', '10.5', '5.30', '8.00'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: AppFonts.fontH5semi(AppColors.themeColer),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedTime = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          TextButton(
            child: Text('Apply'),
            onPressed: () {
              setState(() {
                _applyFilters();
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  void _applyFilters() {
    setState(() {
      _filteredItems2 = items.where((item) {
        bool matchesLocation = _selectedLocation == 'All' ||
            item.location.contains(_selectedLocation);
        bool matchesRating = item.rating >= _selectedRating;
        bool matchesBodyPart = _selectedBodyPart == 'All' ||
            item.bodypart.contains(_selectedBodyPart);
        bool matchesTime =
            _selectedTime == 'All' || item.time.contains(_selectedTime);
        bool matchesSearchQuery =
            item.name.toLowerCase().contains(_searchQuery.toLowerCase());
        return matchesLocation &&
            matchesRating &&
            matchesBodyPart &&
            matchesTime &&
            matchesSearchQuery;
      }).toList();
    });
  }
}
