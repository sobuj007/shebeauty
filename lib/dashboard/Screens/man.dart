import 'dart:io';

import 'package:flutter/material.dart';

class Man extends StatefulWidget {
  const Man({super.key});

  @override
  State<Man> createState() => _ManState();
}

class _ManState extends State<Man> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Man"),
      ),
    );
  }
}
