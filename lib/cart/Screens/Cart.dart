import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Text("WishList"),
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
                      selectpage = 0;
                      controller.animateToPage(selectpage,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                      setState(() {});
                    }),
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Text("cart"),
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
                      selectpage = 1;
                      controller.animateToPage(selectpage,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  selectpage = value;
                  controller.animateToPage(value,
                      duration: Duration(seconds: 1), curve: Curves.easeIn);
                },
                children: [
                  Container(
                    height: 200,
                    color: Colors.amber,
                    child: Text("data333"),
                  ),
                  Container(
                    height: 200,
                    color: Colors.blue,
                    child: Text("data"),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
