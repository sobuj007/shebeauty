import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appFonts.dart';
import 'package:shebeauty/utils/appThemes.dart';
import 'package:shebeauty/utils/custom%20widget/Customratings.dart';
import 'package:sizer/sizer.dart';

import '../../utils/custom widget/CustomAppbar.dart';
import '../Model/allproviderDataModel.dart';
import 'singelProvider.dart';

class AllProvider extends StatefulWidget {
  List<String> selectedBody;
  AllProvider({required this.selectedBody, super.key});

  @override
  State<AllProvider> createState() => _AllProviderState();
}

class _AllProviderState extends State<AllProvider> {
  List<Item> _items = items;
  List<Item> _filteredItems = items;
  String _selectedLocation = 'All';
  int _selectedRating = 0;
  String _selectedBodyPart = 'All';
  String _selectedTime = 'All';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppbar(
            title: "Sub Category",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 78.w,
                  height: 5.8.h,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 3.w, vertical: .5.h),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.themeColer),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.themeColer),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.themeColer),
                          borderRadius: BorderRadius.circular(15)),
                      hintStyle: AppFonts.fontH4regular(AppColors.themehint),
                    ),
                    style: AppFonts.fontH4regular(AppColors.themeBlack),
                    onChanged: (query) {
                      setState(() {
                        _searchQuery = query;
                        _applyFilters();
                      });
                    },
                  ),
                ),
                Card(
                  child: IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () => _showFilterDialog(context),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  // return ListTile(
                  //   title: Text(_filteredItems[index].name),
                  //   subtitle: Text(_filteredItems[index].description),
                  //   trailing: Text(_filteredItems[index].rating.toString()),
                  // );
                  return Container(
                    height: 20.h,
                    width: 100.w,
                    margin: EdgeInsets.symmetric(horizontal: 0,vertical: 1.h),
                    child: Row(
                      children: [
                        Container(
                          height: 20.h,
                          width: 30.w,
                          color: AppColors.themeColer,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Container(width: 58.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(_filteredItems[index].name,style: AppFonts.fontH4semi(AppColors.themeBlack),maxLines: 2,overflow: TextOverflow.ellipsis,),
                               Rattings(rate: _filteredItems[index].rating.toString(),)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 58.w,
                              height: 3.5.h,
                              child: Expanded(
                                child: Text(_filteredItems[index].description,style: AppFonts.fontH6semi(AppColors.themeBlack),maxLines: 2,overflow: TextOverflow.ellipsis,),
                              ),
                            ),
                               Container(width: 58.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Gender : "+_filteredItems[index].gender.toString(),style: AppFonts.fontH5semi(AppColors.themeBlack),maxLines: 1,overflow: TextOverflow.ellipsis, textAlign: TextAlign.start,),
                                  Text(""+_filteredItems[index].name,style: AppFonts.fontH5semi(AppColors.themeBlack),maxLines: 2,overflow: TextOverflow.ellipsis,),
                               
                                ],
                              ),

                            ),Container(width: 58.w,child:Row(mainAxisAlignment: MainAxisAlignment.end,children: [Container(height: 5.h,width: 45.w,decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),color: AppColors.themeColer,),)],),)
                          ],),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
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
          title: Text('Filter Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: _selectedLocation,
                items: ['All', 'Mirpur-1', 'bijoy Soroni', 'banani', 'shamoly']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLocation = newValue!;
                  });
                },
              ),
              DropdownButton<int>(
                value: _selectedRating,
                items: [0, 1, 2, 3, 4, 5].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedRating = newValue!;
                  });
                },
              ),
              DropdownButton<String>(
                value: _selectedBodyPart,
                items: ['All', 'hand', 'face', 'leg'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedBodyPart = newValue!;
                  });
                },
              ),
              DropdownButton<String>(
                value: _selectedTime,
                items: ['All', '10.5', '5.30', '8.00'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTime = newValue!;
                  });
                },
              ),
            ],
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
      _filteredItems = items.where((item) {
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
