import 'package:Ghore_Parlor/utils/custom%20widget/CustomAppbar2.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/main.dart';
import 'package:Ghore_Parlor/utils/appApis.dart';
import 'package:sizer/sizer.dart';

import '../../../order/review/ratingcontoller.dart';
import '../../../utils/appColors.dart';
import '../../../utils/appFonts.dart';
import '../../../utils/custom widget/CustomAppbar.dart';
import '../../Controllers/agentProfileContoller.dart';

class EachProvider extends StatefulWidget {
  final item;
  const EachProvider({this.item, super.key});

  @override
  State<EachProvider> createState() => _EachProviderState();
}

class _EachProviderState extends State<EachProvider> {
  var agentcontroller = Get.put(AgentProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var args = widget.item;
    print(widget.item.toString()); // Get the passed data from the previous page
    agentcontroller.fetchAgentProfileData(args);
  }

  final ReviewController reviewController = Get.put(ReviewController());
  @override
  Widget build(BuildContext context) {
    reviewController.fetchReviews(int.parse(widget.item.toString()));
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CustomAppbar(
            title: "Provider Info",
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                child: Obx(() {
                  if (agentcontroller.profilesdata == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (agentcontroller.profilesdata!.isEmpty) {
                    return Center(
                      child: Text("No Data Found"),
                    );
                  }
                  var prof = agentcontroller.profilesdata;
                  return ListView(
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
                                prof![0].storename.toString().toUpperCase(),
                                style:
                                    AppFonts.fontH5bold(AppColors.themeColer),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          // Rattings(
                          //   rate: widget.item.rating.toString(),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                applng.getLang(21),
                                style: AppFonts.fontH6regular(
                                    AppColors.themeColer),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: AppColors.themehint)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(prof![0].servicestime.toString()),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                applng.getLang(28),
                                style: AppFonts.fontH6regular(
                                    AppColors.themeColer),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: AppColors.themehint)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(agentcontroller
                                              .agentProfile.value.totalorder ==
                                          0
                                      ? "No Order"
                                      : agentcontroller
                                          .agentProfile.value.totalorder
                                          .toString()),
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
                  );
                })),
          ),
        ],
      ),
    ));
  }

  Widget customerReview() {
    return SizedBox(
      height: 20.h,
      width: 100.w,
      child: Obx(() {
        // Show a loading indicator when data is being fetched
        if (reviewController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Show the swiper with reviews if available
        if (reviewController.reviewsList.isEmpty) {
          return Center(child: Text('No reviews available'));
        }

        return Swiper(
          itemBuilder: (BuildContext context, int index) {
            var review = reviewController.reviewsList[index];
            return Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  // Display reviewer's image if available
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: CachedNetworkImageProvider(
                      review.image == null
                          ? "https://via.placeholder.com/150"
                          : AppAppis.profileimg +
                              review.image
                                  .toString(), // Use a placeholder if image is null
                    ),
                  ),
                  SizedBox(height: 1.h),
                  // Display reviewer's name
                  Text(
                    review.reviewername ?? "Unknown",
                    style: AppFonts.fontH6semi(AppColors.themeColer),
                  ),
                  SizedBox(height: 1.h),
                  // Display reviewer's comment
                  Text(
                    review.comment ?? "No comment provided",
                    style: AppFonts.fontH7normal(AppColors.themeBlack),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
          autoplay: true,
          duration: 1000,
          autoplayDelay: 8000,
          itemCount: reviewController
              .reviewsList.length, // Use the length of reviewsList
          viewportFraction: 1,
          scale: 0.9,
        );
      }),
    );
  }

  certificates(context) {
    return Obx(() {
      if (agentcontroller.certificate == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (agentcontroller.certificate!.isEmpty) {
        return Center(
          child: Text('No Data Found'),
        );
      }
      var cerdata = agentcontroller.certificate;
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
                  itemCount: cerdata!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.themeimgbg,
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    cerdata[index].image ?? ""),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),

                        // child: Center(child: Text("data")),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  Servics(context) {
    return Obx(() {
      if (agentcontroller.exparts == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (agentcontroller.exparts!.isEmpty) {
        return Center(
          child: Text('No Data Found'),
        );
      }
      var expdata = agentcontroller.exparts;
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
                  itemCount: expdata!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                      child: Container(
                        decoration: BoxDecoration(color: AppColors.themeimgbg),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.themeimgbg,
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(AppAppis
                                          .myexpartimag +
                                      expdata[index].profileImage.toString()),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),

                          // child: Center(child: Text(expdata[index].profileImage.toString())),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
