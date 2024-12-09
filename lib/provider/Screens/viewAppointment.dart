import 'package:Ghore_Parlor/category/Controllers/getAllinfocontoller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/auth/Controllers/userContoller.dart';
import 'package:Ghore_Parlor/provider/Model/allproviderDataModel.dart';
import 'package:Ghore_Parlor/utils/appLanguage.dart';
import 'package:Ghore_Parlor/utils/appStyle.dart';
import 'package:sizer/sizer.dart';

import '../../cart/Controllers/cartCOntroller.dart';
import '../../cart/Model/cartModel.dart';
import '../../main.dart';
import '../../routes/AppRouts.dart';
import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../../utils/custom widget/CustomAppbar.dart';
import '../../utils/custom widget/Customratings.dart';
import '../../utils/custom widget/custom_counter.dart';

class ViewAppointment extends StatefulWidget {
  final item;
  const ViewAppointment({this.item, super.key});

  @override
  State<ViewAppointment> createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  bool isfav = false;
  var ucon = Get.put(Usercontoller());
  var allcon = Get.put(AllinfoController());

  TimeOfDay _selectedTime = TimeOfDay.now();
  int productQun = 1;
  int servicesQun = 1;
  double total = 0;
  final CartController cartController = Get.put(CartController());
  var args = Get.arguments;
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();
    coutntotal();

    if (wishListItem.contains(args)) {
      isfav = true;
      setState(() {});
    } else {}
    print(args);

    setState(() {
      productQun = int.parse(args.selectedProductQun);
      servicesQun = int.parse(args.selectedServicsQun);
      date = AppStyle.stringToDate(args.selectedDate);
      _selectedTime = AppStyle.stringToTime(args.selectedTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: args.name.toUpperCase(),
          ),
          Flexible(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.h),
                child: Column(
                  children: [
                    ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: [
                          Container(
                            height: 21.5.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.themeborder),
                                borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: .8.h),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 20.h,
                                    width: 28.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              args.img,
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            60, 100, 99, 99),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.0, vertical: .5.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 58.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 50.w,
                                                          child: Text(
                                                            args.name
                                                                .toUpperCase(),
                                                            style: AppFonts
                                                                .fontH6bold(
                                                                    AppColors
                                                                        .themeBlack),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            RatingBarIndicator(
                                                              rating: double.parse(args
                                                                  .item
                                                                  .averageRating
                                                                  .toString()),
                                                              itemCount: 1,
                                                              itemSize: 18.0,
                                                              direction: Axis
                                                                  .horizontal,
                                                              unratedColor:
                                                                  Colors.grey,
                                                              itemBuilder:
                                                                  (context,
                                                                          _) =>
                                                                      Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                            ),
                                                            Text(
                                                              args.item
                                                                  .averageRating
                                                                  .toString(),
                                                              style: AppFonts
                                                                  .fontH7semi(
                                                                      AppColors
                                                                          .themeColer),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: .5.h,
                                                    ),
                                                    Text(
                                                      applng.getLang(16) +
                                                          allcon
                                                              .getCategoryNameById(
                                                                  int.parse(args
                                                                      .item
                                                                      .categoryId))
                                                              .toString(),
                                                      style: AppFonts
                                                          .fontH7regular(
                                                              AppColors
                                                                  .themeBlack),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(
                                                      height: .5.h,
                                                    ),
                                                    Text(
                                                      applng.getLang(17) +
                                                          allcon.getSubcategoryNameById(
                                                              int.parse(args
                                                                  .item
                                                                  .subcategoryId
                                                                  .toString())),
                                                      style: AppFonts
                                                          .fontH7regular(
                                                              AppColors
                                                                  .themeBlack),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(
                                                      height: .5.h,
                                                    ),
                                                    Text(
                                                      applng.getLang(19) +
                                                          args.item.gender
                                                              .toString()
                                                              .toUpperCase(),
                                                      style: AppFonts
                                                          .fontH7regular(
                                                              AppColors
                                                                  .themeBlack),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 58.w,
                                          //   height: 3.5.h,
                                          //   child: Row(
                                          //     children: [
                                          //       Expanded(
                                          //         child: Text(
                                          //           args.description,
                                          //           style: AppFonts.fontH6semi(
                                          //               AppColors.themeBlack),
                                          //           maxLines: 2,
                                          //           overflow: TextOverflow.ellipsis,
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          /************************** gender */
                                          Container(
                                            width: 58.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                      text: applng.getLang(18),
                                                      style:
                                                          AppFonts.fontH7semi(
                                                              AppColors
                                                                  .themeBlack),
                                                      children: [
                                                        TextSpan(
                                                            text: args.sprice +
                                                                "Tk",
                                                            style: AppFonts
                                                                .fontH6semi(
                                                                    AppColors
                                                                        .themeColer))
                                                      ]),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: applng.getLang(20),
                                                      style:
                                                          AppFonts.fontH7semi(
                                                              AppColors
                                                                  .themeBlack),
                                                      children: [
                                                        TextSpan(
                                                            text: " " +
                                                                args.pprice +
                                                                "Tk",
                                                            style: AppFonts
                                                                .fontH6semi(
                                                                    AppColors
                                                                        .themeColer))
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    applng.getLang(21),
                                    style: AppFonts.fontH6regular(
                                        AppColors.themeColer),
                                  ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(5),
                                  //       border: Border.all(
                                  //           width: 1, color: AppColors.themehint)),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: Text(args.item.available),
                                  //   ),
                                  // )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    applng.getLang(32),
                                    style: AppFonts.fontH6regular(
                                        AppColors.themeColer),
                                  ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(5),
                                  //       border: Border.all(
                                  //           width: 1, color: AppColors.themehint)),
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: Text(args.item.slot.toString()),
                                  //   ),
                                  // )
                                ],
                              ),
                            ],
                          ),
                          timeslot()
                        ]),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 6.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (cartController.itemExists(args.id)) {
                          cartController.removeItem(args.id);
                          var date2 = (date.day.toString() +
                                  "/" +
                                  date.month.toString() +
                                  "/" +
                                  date.year.toString())
                              .toString();
                          var customTime = _formatTimeOfDay(_selectedTime);

                          // cartmodelproduct.Product=widget.item;
                          final CartItem sampleItem = CartItem(
                            id: args.id.toString(),
                            name: args.name.toString(),
                            img: args.img.toString(),
                            selectedTime: customTime.toString(),
                            selectedDate: date2,
                            selectedServicsQun: servicesQun.toString(),
                            selectedProductQun: productQun.toString(),
                            sprice: args.sprice.toString(),
                            pprice: args.pprice.toString(),
                            agentid: args.agentid,
                            userid: ucon.user.value['id'].toString(),
                            item: args.item,
                          );

                          cartController.addItem(sampleItem);

                          setState(() {
                            AppStyle.snackbar('Cart updated', ' Cart updated');
                            //  cartController.addItem(sampleItem);
                          });
                        }
                      },
                      child: Container(
                        height: 6.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            color: AppColors.themeColer,
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text(
                          "Update",
                          style: AppFonts.fontH4semi(AppColors.themeWhite),
                        ),
                      )),
                  IconButton(
                      onPressed: () {
                        _showDeleteWarning(context);
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// Function to format TimeOfDay to a string
  String _formatTimeOfDay(TimeOfDay timeOfDay) {
    final hours = timeOfDay.hour.toString().padLeft(2, '0');
    final minutes = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  timeslot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EasyDateTimeLine(
          initialDate: date,
          onDateChange: (selectedDate) {
            date = selectedDate;
          },
          activeColor: AppColors.themeColer,
          dayProps: EasyDayProps(
            height: 8.h,
            width: 12.w,
            inactiveDayDecoration: BoxDecoration(
                border: Border.all(
                  width: .5,
                  color: AppColors.themehint,
                ),
                borderRadius: BorderRadius.circular(10)),
            todayHighlightStyle: TodayHighlightStyle.withBackground,
            todayHighlightColor: AppColors.themehint,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          applng.getLang(23),
          style: AppFonts.fontH4semi(AppColors.themeColer),
        ),
        SizedBox(
          height: 2.h,
        ),
        /*************************************** choose time  */
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              applng.getLang(24),
              style: AppFonts.fontH6semi(AppColors.themeColer),
            ),
            GestureDetector(
              onTap: () {
                _selectTime(context);
              },
              child: Text(
                _selectedTime.format(context).toString(),
                style: AppFonts.fontH4semi(AppColors.themeColer),
              ),
            ),
          ],
        ),

        /*************************************** choose services  ************************/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              applng.getLang(27),
              style: AppFonts.fontH6semi(AppColors.themeBlack),
            ),
            CustomCounterService(context)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              applng.getLang(25),
              style: AppFonts.fontH6semi(AppColors.themeBlack),
            ),
            CustomCounterproduct(
              context,
            )
          ],
        ),
        /************************************ */
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              applng.getLang(26),
              style: AppFonts.fontH5semi(AppColors.themeBlack),
            ),
            Text(
              total.toString(),
              style: AppFonts.fontH3semi(AppColors.themeBlack),
            ),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Divider(
          height: 1,
        ),
        SizedBox(
          height: 1.5.h,
        ),
        // recomandation(context)
      ],
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  CustomCounterproduct(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.remove, size: 15),
            onPressed: () {
              setState(() {
                if (productQun > 0) {
                  productQun--;

                  coutntotal();
                }
              });
            }),
        Text(
          productQun.toString(),
          style: AppFonts.fontH3semi(AppColors.themeColer),
        ),
        IconButton(
          icon: Icon(Icons.add, size: 15),
          onPressed: () {
            setState(() {
              productQun++;

              coutntotal();
            });
          },
        ),
      ],
    );
  }

  CustomCounterService(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.remove, size: 15),
            onPressed: () {
              setState(() {
                if (servicesQun > 1) {
                  servicesQun--;
                }

                coutntotal();
              });
            }),
        Text(
          servicesQun.toString(),
          style: AppFonts.fontH3semi(AppColors.themeColer),
        ),
        IconButton(
          icon: Icon(Icons.add, size: 15),
          onPressed: () {
            setState(() {
              servicesQun++;

              coutntotal();
            });
          },
        ),
      ],
    );
  }

  _incrementCounteraService() {
    servicesQun++;
    setState(() {});
    coutntotal();
  }

  _decrementCounterService() {
    if (servicesQun > 0) {
      servicesQun--;
      setState(() {});
    }
    coutntotal();
  }

  coutntotal() {
    var p = double.parse(args.pprice) * double.parse(productQun.toString());
    var s = double.parse(args.sprice) * double.parse(servicesQun.toString());

    setState(() {
      total = double.parse((p + s).toString());
    });
  }

  void _showDeleteWarning(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Delete Item',
          style: AppFonts.fontH5semi(AppColors.themeBlack),
        ),
        content: Text('Are you sure you want to Delete?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Dismiss the dialog if the user cancels
            },
            child: Text('Cancle'),
          ),
          TextButton(
            onPressed: () {
              // Perform logout and close dialog
              if (cartController.itemExists(args.id)) {
                cartController.removeItem(args.id);
                cartController.saveCartItems();
                Navigator.pop(context);
                AppStyle.snackbar('Item Delete', ' Cart Item Delete');
                Navigator.pop(context);
              }
              Get.back(); // Dismiss the dialog after logging out
            },
            child:
                Text('Yes', style: AppFonts.fontH5semi(AppColors.themeColer)),
          ),
        ],
      ),
    );
  }

  recomandation(context) => Container(
        height: MediaQuery.of(context).size.height * .18,
        //color: Colors.green,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue,
              child: Container(
                width: 38.w,
                height: 13.h,
              ),
            );
          },
        ),
      );
}
