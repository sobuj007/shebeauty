import 'package:flutter/material.dart';

class SingelDescription extends StatefulWidget {
  const SingelDescription({super.key});

  @override
  State<SingelDescription> createState() => _SingelDescriptionState();
}

class _SingelDescriptionState extends State<SingelDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("Description"),
      )),
    );
  }
}
