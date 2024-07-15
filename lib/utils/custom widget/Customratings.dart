import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shebeauty/utils/appColors.dart';
import 'package:shebeauty/utils/appFonts.dart';
class Rattings extends StatefulWidget {
  final rate;
  const Rattings({this.rate,super.key});

  @override
  State<Rattings> createState() => _RattingsState();
}

class _RattingsState extends State<Rattings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.rate,style: AppFonts.fontH3semi(AppColors.themehint),),
        RatingBarIndicator(
        rating:double.parse( widget.rate),
        itemBuilder: (context, index) => Icon(
             Icons.star,
             color: Colors.amber,
        ),
        itemCount: 1,
        itemSize: 20.0,
        direction: Axis.horizontal,
        ),
      ],
    );
  }
}