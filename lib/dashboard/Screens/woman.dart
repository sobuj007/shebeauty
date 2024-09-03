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
class Woman extends StatefulWidget {
  @override
  State<Woman> createState() => _WomanState();
}

class _WomanState extends State<Woman> {
  final AllinfoController controller = Get.put(AllinfoController());

  final StorProfileController storeController = Get.put(StorProfileController());

  final Usercontoller ucon = Get.put(Usercontoller());
 @override
  void initState() {
    // TODO: implement initState
    super.initState();    storeController.fetchData();
  controller.fetchData();
  }
  @override
  Widget build(BuildContext context) {
   
    String selectedGender = 'female';

    // Fetch data when the screen is initialized
   

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _buildCategorySection(selectedGender),
            _buildStoreSection(context),
            TitleWithViewButton(
              title: applng.getLang(8),
            ),
            Container(height: 20.h, child: _buildNearMeSection(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(String selectedGender) {
    return Column(
      children: [
        TitleWithViewButton(
          title: applng.getLang(6),
          route: "c",
          routeData: selectedGender,
        ),
        Container(
          height: 14.h,
          child: Obx(() {
            if (controller.allinfoModel.value == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              final data = controller.getCategoriesByGender(selectedGender);
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final category = data[index];
                  return _buildCategoryCard(category);
                },
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _buildCategoryCard( category) {
    return GestureDetector(
      onTap: () {
        // Navigate to category details
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
                  height: 8.h,
                  width: 10.w,
                  child: Image(
                    image: CachedNetworkImageProvider(category.image),
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  category.name.toUpperCase(),
                  style: AppFonts.fontH7semi(Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStoreSection(context) {
    return Column(
      children: [
        TitleWithViewButton(
          title: applng.getLang(7),
          route: 'p',
        ),
        Obx(() {
          if (storeController.stores.value == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              height: MediaQuery.of(context).size.height * .18,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storeController.stores.length,
                itemBuilder: (context, index) {
                  return _buildStoreCard(index);
                },
              ),
            );
          }
        }),
      ],
    );
  }

  Widget _buildStoreCard(int index) {
    return GestureDetector(
      onTap: () {
        // Navigate to store details
      },
      child: Card(
        color: Colors.blue,
        child: Container(
          width: 38.w,
          height: 13.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                "https://softisan.xyz/uploads/storeImages/" +
                    storeController.stores[index].coverImage,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black38,
            ),
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeController.stores[index].storename!.toUpperCase(),
                    style: AppFonts.fontH6semi(AppColors.themeWhite),
                  ),
                  Expanded(child: SizedBox()),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image(
                        image: CachedNetworkImageProvider(
                          storeController.stores[index].logo,
                        ),
                        width: 7.w,
                        height: 7.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

var place=true;

  Widget _buildNearMeSection(BuildContext context) {
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