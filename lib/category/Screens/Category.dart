
import 'package:flutter/material.dart';
import 'package:shebeauty/category/Screens/SubCategory.dart';

import '../../utils/custom widget/CustomAppbar.dart';

class AppCategory extends StatefulWidget {
  const AppCategory({super.key});

  @override
  State<AppCategory> createState() => _AppCategoryState();
}

class _AppCategoryState extends State<AppCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "Category",
            ),
            Container(
              height: MediaQuery.of(context).size.height * .88,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [category(context)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  category(context) {
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
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AppSubCategory()));
                }),
                child: Container(
                  height: 30,
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
}
