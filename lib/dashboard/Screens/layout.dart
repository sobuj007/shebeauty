
import 'package:flutter/material.dart';
import 'package:shebeauty/cart/Screens/Cart.dart';
import 'package:shebeauty/dashboard/Screens/man.dart';
import 'package:shebeauty/dashboard/Screens/woman.dart';
import 'package:shebeauty/profile/Screens/Profile.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  List pagelist = [Woman(), Man(), MyCart(), Profile()];
  int selectPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: pagelist[selectPageIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectPageIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black54,
          onTap: (value) {
            selectPageIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.woman), label: "Woman"),
            BottomNavigationBarItem(icon: Icon(Icons.man), label: "Man"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Wishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        )
        // Container(width: MediaQuery.of(context).size.width,
        // child: ,
        // ),
        );
  }
}
