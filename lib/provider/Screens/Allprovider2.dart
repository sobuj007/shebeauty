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
  final TextEditingController _searchController = TextEditingController();
  final List<Item> _allItems = List<Item>.generate(
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
          child: const Icon(
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
            SizedBox(
              height: 6.8.h,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 6.8.h,
                      width: 75.w,
                      child: TextField(
                        controller: _searchController,
                        style: AppFonts.fontH5semi(AppColors.themeBlack),
                        decoration: InputDecoration(
                          hintText: "Search here",
                          hintStyle: AppFonts.fontH4semi(AppColors.themehint),
                          prefixIcon: const Icon(Icons.search),

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
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
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
                  SizedBox(
                    width: 30.w,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Select Location'),
                      style: AppFonts.fontH4regular(AppColors.themeBlack),
                      value: _selectedLocation,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                          _filterList();
                        });
                      },
                      items: [
                        const DropdownMenuItem(
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
                  SizedBox(
                    width: 30.w,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Select Location'),
                      style: AppFonts.fontH4regular(AppColors.themeBlack),
                      value: _selectedLocation,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                          _filterList();
                        });
                      },
                      items: [
                        const DropdownMenuItem(
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
                  SizedBox(
                    width: 30.w,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Text('Select Location'),
                      style: AppFonts.fontH4regular(AppColors.themeBlack),
                      value: _selectedLocation,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                          _filterList();
                        });
                      },
                      items: [
                        const DropdownMenuItem(
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
