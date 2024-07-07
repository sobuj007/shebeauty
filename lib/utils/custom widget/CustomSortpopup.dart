import 'dart:async';

import 'package:flutter/material.dart';

class CustomSortPopup extends StatefulWidget {
  var title;
  var item;
  var controller;
  CustomSortPopup({this.controller, this.item, this.title, super.key});

  @override
  State<CustomSortPopup> createState() => _CustomSortPopupState();
}

class _CustomSortPopupState extends State<CustomSortPopup> {
  var item;
  var selected;
  @override
  void initState() {
    // TODO: implement initState
    selected = item[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
            value: selected,
            items: item.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(child: Text(value));
            }).toList(),
            onChanged: (v) {
              widget.controller.value = v;
            }),
      ],
    );
  }
}
