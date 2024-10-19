import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/custom widget/CustomAppbar.dart';
import 'singelProvider.dart';

class AllProvider extends StatefulWidget {
  List<String> selectedBody;
  AllProvider({required this.selectedBody, super.key});

  @override
  State<AllProvider> createState() => _AllProviderState();
}

class _AllProviderState extends State<AllProvider> {
  TextEditingController _searchController = TextEditingController();
  List<Item> _allItems = List<Item>.generate(
    100,
    (i) => Item(
      name: 'Item $i',
      location: 'Location ${i % 10}',
      time: DateTime.now().subtract(Duration(days: i)),
    ),
  );
  List<Item> _filteredItems = [];
  String? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _filteredItems.addAll(_allItems);
    _searchController.addListener(_filterList);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterList() {
    List<Item> results = [];
    if (_searchController.text.isEmpty && _selectedLocation == null) {
      results = _allItems;
    } else {
      results = _allItems.where((item) {
        final matchesName = item.name
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
        final matchesLocation =
            _selectedLocation == null || item.location == _selectedLocation;
        return matchesName && matchesLocation;
      }).toList();
    }
    setState(() {
      _filteredItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.themeWhite,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.themeColer,
        title: Text(
          'All Provider',
          style: AppFonts.fontH3regular(AppColors.themeWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 6.8.h,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 6.8.h,
                      width: 75.w,
                      child: TextField(
                        controller: _searchController,
                        style: AppFonts.fontH5semi(AppColors.themeBlack),
                        decoration: InputDecoration(
                          hintText: "Search here",
                          hintStyle: AppFonts.fontH4semi(AppColors.themehint),
                          prefixIcon: Icon(Icons.search),

                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 0.w),
                          // labelText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: .5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.sort,
                            color: AppColors.themeBlack,
                          ),
                        )),
                    //  Card(child: Container(height: 8.h,width: 6.h, child: ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /**************************************** */
                  Container(
                    width: 30.w,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text('Select Location'),
                      style: AppFonts.fontH4regular(AppColors.themeBlack),
                      value: _selectedLocation,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                          _filterList();
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: null,
                          child: Text('All Locations'),
                        ),
                        ...List.generate(
                          10,
                          (i) => DropdownMenuItem(
                            value: 'Location $i',
                            child: Text('Location $i'),
                          ),
                        )
                      ],
                    ),
                  ),
                  /********************************************************  */
                  Container(
                    width: 30.w,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text('Select Location'),
                      style: AppFonts.fontH4regular(AppColors.themeBlack),
                      value: _selectedLocation,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                          _filterList();
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: null,
                          child: Text('All Locations'),
                        ),
                        ...List.generate(
                          10,
                          (i) => DropdownMenuItem(
                            value: 'Location $i',
                            child: Text('Location $i'),
                          ),
                        )
                      ],
                    ),
                  ),
                  /****************************************  */
                  Container(
                    width: 30.w,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text('Select Location'),
                      style: AppFonts.fontH4regular(AppColors.themeBlack),
                      value: _selectedLocation,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                          _filterList();
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          value: null,
                          child: Text('All Locations'),
                        ),
                        ...List.generate(
                          10,
                          (i) => DropdownMenuItem(
                            value: 'Location $i',
                            child: Text('Location $i'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Get.toNamed(
                      //   "/singelprovider",
                      //   arguments: {
                      //     'id': 1,
                      //     'name': 'John Doe',
                      //     'isVerified': true,
                      //   },
                      // );
                    },
                    child: ListTile(
                      title: Text(_filteredItems[index].name),
                      subtitle: Text(
                          '${_filteredItems[index].location} - ${_filteredItems[index].time}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String location;
  final DateTime time;

  Item({required this.name, required this.location, required this.time});
}
