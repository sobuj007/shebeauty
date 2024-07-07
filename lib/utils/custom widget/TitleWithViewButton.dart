import 'package:flutter/material.dart';

import '../../category/Screens/Category.dart';


class TitleWithViewButton extends StatefulWidget {
  String? title;
  String? route;
  TitleWithViewButton({this.title, this.route, super.key});

  @override
  State<TitleWithViewButton> createState() => _TitleWithViewButtonState();
}

class _TitleWithViewButtonState extends State<TitleWithViewButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .035,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(),
          TextButton(
              onPressed: () {
                print(widget.route);
                if (widget.route == 'c') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AppCategory()));
                }
              },
              child: Text(
                "View All",
                style: TextStyle(fontSize: 12),
              ))
        ],
      ),
    );
  }
}
