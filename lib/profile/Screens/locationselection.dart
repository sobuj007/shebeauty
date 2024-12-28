import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/category/Screens/SubCategory.dart';
import 'package:Ghore_Parlor/utils/appStyle.dart';
import 'package:Ghore_Parlor/utils/custom%20widget/CustomAppbar.dart';
import 'package:sizer/sizer.dart';

import '../../category/Controllers/getAllinfocontoller.dart';
import '../../dashboard/Controllers/nearMeController.dart';
// Update with actual path

class CityLocationFilter extends StatelessWidget {
  final AllinfoController allinfoController = Get.put(AllinfoController());
  final ServiceProductNearMeController nearMeController =
      Get.put(ServiceProductNearMeController());
  var loc = [].obs;
  var selectcityid = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("City & Location Filter"),
      // ),
      body: Column(
        children: [
          CustomAppbar(
            title: "City & Location Filter",
          ),
          Container(
            height: 80.h,
            width: 100.w,
            child: Obx(() {
              if (allinfoController.cities!.isEmpty ||
                  allinfoController.locations!.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              print("object");
              print(allinfoController.selectedCityId.value);
              final cityIds =
                  allinfoController.cities?.map((city) => city.id).toList();
              return Padding(
                padding: EdgeInsets.all(3.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButton<int>(
                      isExpanded: true,
                      hint: Text("Select City"),
                      value: allinfoController.cities?.any((city) =>
                                  city.id ==
                                  allinfoController.selectedCityId.value) ==
                              true
                          ? allinfoController.selectedCityId.value
                          : null,
                      onChanged: (int? newCityId) {
                        if (newCityId != null) {
                          allinfoController.selectCity(newCityId);
                          selectcityid.value = newCityId;
                          print(newCityId);
                        }
                      },
                      items: allinfoController.cities?.map((city) {
                        return DropdownMenuItem(
                          value: city.id,
                          child: Text(city.name ?? ''),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 1.h),

                    // Location Checkboxes
                    Expanded(
                      child: Obx(() {
                        if (allinfoController.filteredLocations.isEmpty) {
                          return Text(
                              "No locations available for the selected city.");
                        }
                        return ListView(
                          children: allinfoController.filteredLocations
                              .map((location) {
                            return RadioListTile<int>(
                              title: Text(
                                location.name ?? '',
                                style:
                                    AppFonts.fontH6semi(AppColors.themeBlack),
                              ),
                              value: location.id!,
                              groupValue:
                                  allinfoController.selectedLocationId.value,
                              onChanged: (int? value) {
                                if (value != null) {
                                  allinfoController.setSelectedLocation(value);
                                }
                              },
                            );
                          }).toList(),
                        );

                        // return ListView(
                        //   children: allinfoController.filteredLocations
                        //       .map((location) {
                        //     return CheckboxListTile(
                        //       title: Text(
                        //         location.name ?? '',
                        //         style:
                        //             AppFonts.fontH6semi(AppColors.themeBlack),
                        //       ),
                        //       value: allinfoController.selectedLocations
                        //           .contains(location.id),
                        //       onChanged: (bool? checked) {
                        //         if (checked == true) {
                        //           allinfoController
                        //               .toggleLocation(location.id!);
                        //         } else {
                        //           allinfoController
                        //               .toggleLocation(location.id!);
                        //         }
                        //       },
                        //     );
                        //   }).toList(),
                        // );
                      }),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: // Save Button
          ElevatedButton(
        onPressed: () {
          // allinfoController.saveSelectedCity(cityId)
          allinfoController.saveSelectedCity(selectcityid.value);
          allinfoController.saveSelectedLocations();
          AppStyle.snackbar("Locations Save", "Locations Save succesful");
          nearMeController.fetchServiceProductsByLocations();
          Get.offAndToNamed('/layout');
        },
        child: Text('Save Selected Locations'),
      ),
    );
  }
}
