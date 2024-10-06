import 'package:flutter/material.dart';
import 'package:Ghore_Parlor/cart/Screens/MyListedCart.dart';

import 'package:Ghore_Parlor/cart/Screens/wishlist.dart';

import 'package:Ghore_Parlor/main.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';

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
                        Text("WishList".toUpperCase(),style: AppFonts.fontH5semi(AppColors.themeBlack),),
                        selectpage == 0
                            ? Container(
                                width: 80,
                                height: 2,
                                color: AppColors.themeColer,

                              )
                            : SizedBox()
                      ],
                    ),
                    onTap: (() {
                      selectpage = 0;
                      controller.jumpToPage(selectpage);
                      // controller.animateToPage(selectpage,
                      //     duration: Duration(seconds: 1), curve: Curves.f);
                      setState(() {});
                    }),
                  ),
                  GestureDetector(
                    child: Column(
                      children: [
                        Text("cart".
                        toUpperCase(),style: AppFonts.fontH5semi(AppColors.themeBlack),),
                        selectpage == 1
                            ? Container(
                                width: 80,
                                height: 2,
                                color: AppColors.themeColer,
                              )
                            : SizedBox()
                      ],
                    ),
                    onTap: () {
                      selectpage = 1;
                      controller.jumpToPage(selectpage);
                      // controller.animateToPage(selectpage,
                      //     duration: Duration(seconds: 1), curve: Curves.easeIn);
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
                  setState(() {
                        controller.animateToPage(value,
                      duration: Duration(seconds: 1), curve: Curves.easeIn);
                      });
                },
                children: [
                Wishlist(),
                MyListedCart()
             
       
       
                  
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
