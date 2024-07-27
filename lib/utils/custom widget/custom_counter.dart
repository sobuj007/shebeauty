// import 'package:flutter/material.dart';
// class CustomCounter extends StatefulWidget {
//   final controlers;
//   const CustomCounter({this.controlers, super.key});

//   @override
//   State<CustomCounter> createState() => _CustomCounterState();
// }

// class _CustomCounterState extends State<CustomCounter> {
//   @override
//   Widget build(BuildContext context) {
//   return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         IconButton(
//           icon: Icon(Icons.remove),
//           onPressed: _decrementCounter,
//         ),
//         Text(
//           '$_counter',
//           style: TextStyle(fontSize: 20.0),
//         ),
//         IconButton(
//           icon: Icon(Icons.add),
//           onPressed: _incrementCounter,
//         ),
//       ],
//     );
//   }
//    int _counter = 1;

//   void _incrementCounter() {
//     setState(() {
//       widget.controlers =(_counter++).toString;
//     });
//   }

//   void _decrementCounter() {
//     setState(() {
//       if (_counter > 1) {
//        widget.controlers.text.value = (_counter--).toString();
//       }
//     });
//   }
//   }
