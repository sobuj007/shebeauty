import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shebeauty/main.dart';
import 'package:sizer/sizer.dart';

import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/Customratings.dart';
import '../Model/allproviderDataModel.dart';

class SingelProfile extends StatefulWidget {
  final item;
  const SingelProfile({this.item, super.key});

  @override
  State<SingelProfile> createState() => _SingelProfileState();
}

class _SingelProfileState extends State<SingelProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.h),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: AppColors.themeColer,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.item.name.toUpperCase(),
                      style: AppFonts.fontH5bold(AppColors.themeColer),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Rattings(
                  rate: widget.item.rating.toString(),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      applng.getLang(21),
                      style: AppFonts.fontH6regular(AppColors.themeColer),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: AppColors.themehint)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.item.available),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      applng.getLang(28),
                      style: AppFonts.fontH6regular(AppColors.themeColer),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: AppColors.themehint)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.item.available),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              applng.getLang(31),
              style: AppFonts.fontH5normal(AppColors.themeColer),
            ),
            SizedBox(
              height: 2.h,
            ),
            customerReview(),
            /**********************************certificates **************************** */
            certificates(context),
            Servics(context)
          ],
        ),
      )),
    );
  }

  customerReview() {
    return SizedBox(
      height: 20.h,
      width: 100.w,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 150,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: CachedNetworkImageProvider(
                      "https://foru.co.id/wp-content/uploads/2015/05/Memilih-advertising-agency.jpg",
                    ),
                  ),
                  Text(
                    "Jhone Deo",
                    style: AppFonts.fontH6semi(AppColors.themeColer),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                    style: AppFonts.fontH7normal(AppColors.themeBlack),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width);

          // return Image.network(
          //   // "https://via.placeholder.com/288x188",
          //   "https://foru.co.id/wp-content/uploads/2015/05/Memilih-advertising-agency.jpg",
          //   fit: BoxFit.fill,
          // );
        },
        autoplay: true,
        duration: 1000,
        autoplayDelay: 8000,
        itemCount: 10,
        viewportFraction: 1,
        scale: 0.9,
      ),
    );
  }

  certificates(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Text(
          applng.getLang(29),
          style: AppFonts.fontH5normal(AppColors.themeColer),
        ),
        Row(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 5),
                ),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.themeimgbg),
                      child: Center(child: Text("data")),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Servics(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Text(
          applng.getLang(30),
          style: AppFonts.fontH5normal(AppColors.themeColer),
        ),
        Row(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 5),
                ),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.themeimgbg),
                      child: Center(child: Text("data")),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
