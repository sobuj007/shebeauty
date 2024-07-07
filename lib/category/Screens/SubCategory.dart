
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../provider/Screens/Allprovider.dart';
import '../../utils/custom widget/CustomAppbar.dart';


class AppSubCategory extends StatefulWidget {
  const AppSubCategory({super.key});

  @override
  State<AppSubCategory> createState() => _AppSubCategoryState();
}

class _AppSubCategoryState extends State<AppSubCategory> {
  List<String> bodypart = [
    "Face",
    "Hand",
    "Body",
    "Leg",
  ];

  List<String> selectedBodyValue = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppbar(
            title: "Sub Category",
          ),
          Container(
            height: MediaQuery.of(context).size.height * .88,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [subcategory(context)],
              ),
            ),
          ),
        ],
      )),
    );
  }

  subcategory(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Flexible(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showpopup(context);
                },
                child: Container(
                  height: 200,
                  width: 100,
                  color: Colors.amber,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  showpopup(context) {
    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Body Part:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  GroupButton(
                    options: GroupButtonOptions(
                        borderRadius: BorderRadius.circular(5),
                        selectedColor: Colors.amberAccent,
                        unselectedTextStyle:
                            TextStyle(fontSize: 16, color: Colors.black),
                        selectedTextStyle:
                            TextStyle(fontSize: 16, color: Colors.black)),
                    isRadio: false,
                    onSelected: ((value, index, isSelected) {
                      print(value);
                      print(index.toString());
                      print(isSelected);
                      if (isSelected == false) {
                        selectedBodyValue.remove(value);
                      } else {
                        selectedBodyValue.add(value);
                      }
                    }),
                    buttons: bodypart,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                print(selectedBodyValue);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AllProvider(
                                              selectedBody: selectedBodyValue,
                                            )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Search"),
                              ))),
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
