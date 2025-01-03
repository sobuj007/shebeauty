import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/auth/Controllers/storecontoller.dart';
import 'package:Ghore_Parlor/provider/Screens/Each%20Provider/EachProvider.dart';
import 'package:sizer/sizer.dart';

import '../../utils/appApis.dart';
import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/CustomAppbar.dart';

class ProviderAll extends StatelessWidget {
  ProviderAll({super.key});

  final StorProfileController storeController =
      Get.put(StorProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: "All provider",
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                if (storeController.stores.value == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  // Display the data

                  return Container(
                    height: MediaQuery.of(context).size.height * .20,

                    //color: Colors.green,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      itemCount: storeController.stores.length,
                      itemBuilder: (context, index) {
                        var total;
                        //  var total= double.parse(_filteredItems[index].servicePrice!)+double.parse(_filteredItems[index].price!);
                        //                     if (index < storeController.stores.length) {
                        //    total = double.parse(profile[index].servicePrice!) + double.parse(storeController.stores[index].price!);
                        // } else {
                        //   print('Index out of bounds');
                        // }
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EachProvider(
                                          item: storeController
                                              .stores[index].agentId,
                                        )));
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
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                        errorListener: (e) {},
                                        storeController
                                                    .stores[index].coverImage ==
                                                null
                                            ? "https://softisan.xyz/uploads/category/1725218338--beautytreatment.png"
                                            : AppAppis.storecover +
                                                storeController
                                                    .stores[index].coverImage)),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black38,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        storeController.stores[index].storename!
                                            .toUpperCase(),
                                        style: AppFonts.fontH6semi(
                                            AppColors.themeWhite),
                                      ),
                                      // Expanded(child: SizedBox()),
                                      Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Image(
                                                height: 4.h,
                                                width: 4.h,
                                                image: CachedNetworkImageProvider(
                                                    storeController
                                                                .stores[index]
                                                                .logo ==
                                                            null
                                                        ? "https://softisan.xyz/uploads/category/1725218338--beautytreatment.png"
                                                        : storeController
                                                            .stores[index]
                                                            .logo),
                                              )))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
