
import 'package:flutter/material.dart';
import 'package:shebeauty/provider/Screens/SingelAppointment.dart';

import '../../utils/custom widget/CustomAppbar.dart';
import 'SingelDescription.dart';
import 'Singelprofile.dart';

class SingelProvider extends StatefulWidget {

  const SingelProvider({super.key});

  @override
  State<SingelProvider> createState() => _SingelProviderState();
}

class _SingelProviderState extends State<SingelProvider> {
  PageController controller = PageController(initialPage: 0);
  int selectpage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CustomAppbar(
              title: "Singel Provider",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //************************Appointment */
                  GestureDetector(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Appointment"),
                        ),
                        selectpage == 0
                            ? Container(
                                width: 80,
                                height: 2,
                                color: Colors.blue,
                              )
                            : SizedBox()
                      ],
                    ),
                    onTap: (() {
                      controller.jumpToPage(0);
                    }),
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Description"),
                        ),
                        selectpage == 1
                            ? Container(
                                width: 80,
                                height: 2,
                                color: Colors.blue,
                              )
                            : SizedBox()
                      ],
                    ),
                    onTap: () {
                      controller.jumpToPage(1);
                    },
                  ),
                  GestureDetector(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Profile"),
                          ),
                          selectpage == 2
                              ? Container(
                                  width: 80,
                                  height: 2,
                                  color: Colors.blue,
                                )
                              : SizedBox()
                        ],
                      ),
                      onTap: () {
                        controller.jumpToPage(2);
                      }),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    selectpage = value;
                    controller.animateToPage(value,
                        duration: Duration(seconds: 1), curve: Curves.easeIn);
                  });
                },
                children: [
                  SingelAppointment(),
                  SingelDescription(),
                  SingelProfile(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}