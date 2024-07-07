import 'dart:io';



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/custom widget/TitleWithViewButton.dart';

class Woman extends StatefulWidget {
  const Woman({super.key});

  @override
  State<Woman> createState() => _WomanState();
}

class _WomanState extends State<Woman> {
  TextEditingController controller = TextEditingController();
  TextEditingController serachController = TextEditingController();
  List areaitem = [
    "Mirpur",
    "Shamoly",
    "Bonani",
    "Kafrul",
    "Gulshan",
    "Bashundhara",
    "Khilkhet"
  ];
  List cityitem = ["Dhaka", "Chattogram", "Rajshahi", "Syhlet", "Rongpur"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .22,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(15)),
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: Text("data")),
                    ),
                  ),
                  Positioned(
                      bottom: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .77,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextField(
                                  controller: serachController,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 2.0, vertical: 1.0),
                                      prefixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                              ),
                              Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                      onPressed: () {
                                        showpopup(context);
                                      },
                                      icon: Icon(Icons.sort)))
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Column(
              children: [
                TitleWithViewButton(
                  title: "Category",
                  route: "c",
                ),
                /********************** category bloc *************************** */
                Container(
                  height: MediaQuery.of(context).size.height * .12,
                  //color: Colors.green,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.black38,
                        child: Container(
                          // width: 200,
                          //height: 20,
                          width: MediaQuery.of(context).size.width * .20,
                          //height: MediaQuery.of(context).size.height * .01,
                        ),
                      );
                    },
                  ),
                ),
                /********************************* provider bloc ************* */
                TitleWithViewButton(
                  title: "Provider",
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .14,
                  //color: Colors.green,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.black38,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .28,
                          height: MediaQuery.of(context).size.height * .13,
                        ),
                      );
                    },
                  ),
                ),
                /********************************* near me Bloc ******************* */
                TitleWithViewButton(
                  title: "Near Me",
                ),
                neaarMe(context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  // showpopup(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: ((context) {
  //         return Container(
  //           height: 300,
  //           color: Colors.amber,
  //           child: Text("data"),
  //         );
  //       }));
  // }

  showpopup(context) {
    showDialog(
        context: context,
        builder: ((context) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              height: 300,
              color: Colors.amber,
              child: Text("data"),
            ),
          );
        }));
  }

  neaarMe(context) {
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
