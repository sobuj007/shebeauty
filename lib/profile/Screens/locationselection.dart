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
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // City Dropdown
                    DropdownButton<int>(
                      hint: Text("Select City"),
                      value: allinfoController.selectedCityId.value != null
                          ? allinfoController.selectedCityId.value
                          : null,
                      onChanged: (int? newCityId) {
                        allinfoController.selectCity(newCityId);
                        selectcityid.value = newCityId!;
                        print(newCityId);
                      },
                      items: allinfoController.cities!.map((city) {
                        return DropdownMenuItem(
                          value: city.id,
                          child: Text(city.name ?? ''),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),

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
                            return CheckboxListTile(
                              title: Text(location.name ?? ''),
                              value: allinfoController.selectedLocations
                                  .contains(location.id),
                              onChanged: (bool? checked) {
                                if (checked == true) {
                                  allinfoController
                                      .toggleLocation(location.id!);
                                } else {
                                  allinfoController
                                      .toggleLocation(location.id!);
                                }
                              },
                            );
                          }).toList(),
                        );
                      }),
                    ),
                    // Save Button
                    ElevatedButton(
                      onPressed: () {
                        // allinfoController.saveSelectedCity(cityId)
                        allinfoController.saveSelectedCity(selectcityid.value);
                        allinfoController.saveSelectedLocations();
                        AppStyle.snackbar(
                            "Locations Save", "Locations Save succesful");
                        nearMeController.fetchServiceProductsByLocations();
                        Get.offAndToNamed('/layout');
                      },
                      child: Text('Save Selected Locations'),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
