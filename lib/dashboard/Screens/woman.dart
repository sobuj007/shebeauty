import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shebeauty/auth/Controllers/storecontoller.dart';
import 'package:shebeauty/auth/Model/storeprofileModel.dart';
import 'package:shebeauty/main.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

import '../../auth/Controllers/userContoller.dart';
import '../../category/Controllers/getAllinfocontoller.dart';
import '../../utils/appColors.dart';
import '../../utils/custom widget/TitleWithViewButton.dart';
import '../../utils/custom widget/sharedpref.dart';

//   TextEditingController controller = TextEditingController();
//   TextEditingController serachController = TextEditingController();
//   final AllinfoController allinfoController = Get.find();
// //    var _filteredItems = <Allproduct>[].obs;
//   final AllinfoController _controller = Get.put(AllinfoController());
// Default gender

class Woman extends StatelessWidget {
  final AllinfoController controller = Get.put(AllinfoController());
  final StorProfileController storeController =
      Get.put(StorProfileController());
    final Usercontoller ucon =
      Get.put(Usercontoller());    


 

  

  @override
  Widget build(BuildContext context) {
 var token=ucon.getToken();
 print(token);
    String selectedGender = 'female';
   controller.fetchData();
      storeController.fetchData(token);
    // Fetch data when the screen is initialized
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller.fetchData();
    //   storeController.fetchData(token);
    // });

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                TitleWithViewButton(
                  title: applng.getLang(6),
                  route: "c",
                  routeData: selectedGender,
                ),
                /********************** category bloc *************************** */
                Container(
                    height: 14.h,
                    //color: Colors.green,
                    child: Obx(() {
                      if (controller.allinfoModel.value == null) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        // if (categories == null) {
                        //       return Center(child: CircularProgressIndicator());
                        //     }

                        //     if (categories.isEmpty) {
                        //       return Center(child: Text('No categories available for this gender'));
                        //     }
                        //     print('object');
                        //     print(categories);

                        final data =
                            controller.getCategoriesByGender(selectedGender);
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length ?? 0,
                          itemBuilder: (context, index) {
                            final category = data[index];
                            return GestureDetector(
                              onTap: () {
                                //  Navigator.push(context,
                                //   MaterialPageRoute(builder: (_) => AppSubCategory(cat_id: category.id,)));
                              },
                              child: Container(
                                height: 16.h,
                                width: 25.w,
                                child: Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          // width: 200,
                                          height: 8.h,
                                          width: 10.w,
                                          child: Image(
                                            image: CachedNetworkImageProvider(
                                              category.image,
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Text(
                                          category.name
                                              .toString()
                                              .toUpperCase(),
                                          style:
                                              AppFonts.fontH7semi(Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    })),
                /********************************* provider bloc ************* */
                TitleWithViewButton(
                  title: applng.getLang(7),
                  route: 'p',
                ),
                Obx((){
               if (storeController.stores.value == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          // Display the data
       
         

                  return Container(
                  height: MediaQuery.of(context).size.height * .18,
                  //color: Colors.green,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: storeController.stores.length,
                    itemBuilder: (context, index) {
                        var total ;
 
                      return GestureDetector(
                        onTap: (){

                        },
                        child: Card(
                          color: Colors.blue,
                                          //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: 38.w,
                            height: 13.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                  "https://softisan.xyz/uploads/storeImages/"+storeController.stores[index].coverImage
                                     ),
                                  fit: BoxFit.fill,),
                            ),
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,color: Colors.black38,),
                              child: Padding(
                                padding:  EdgeInsets.all(2.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                                           Text(storeController.stores[index].storename!.toUpperCase(),style: AppFonts.fontH6semi(AppColors.themeWhite),),
                              Expanded(child: SizedBox())
                               ,Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,child: Padding(
                                 padding: const EdgeInsets.all(4.0),
                                 child:Image(image: CachedNetworkImageProvider(storeController.stores[index].logo),width: 7.w,height: 7.w,),
                               ))
                                ],),
                              ),

                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
                }}),
                /********************************* near me Bloc ******************* */
                TitleWithViewButton(
                  title: applng.getLang(8),
                ),
                Container(height: 20.h, child: neaarMe(context))
              ],
            ),
          ],
        ),
      ),
    );
  }

  var place = true;
  neaarMe(context) {
    if (place) {
      return Center(
        child: Text("Please update your Profile"),
      );
    } else {
      return Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Flexible(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 100,
                  color: Colors.amber,
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
