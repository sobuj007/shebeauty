import 'dart:convert';

import 'package:Ghore_Parlor/category/Controllers/getAllinfocontoller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/auth/Controllers/userContoller.dart';
import 'package:Ghore_Parlor/cart/Model/cartModel.dart';

import 'package:Ghore_Parlor/utils/appStyle.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import 'package:Ghore_Parlor/cart/Model/cartModel.dart' as CartProduct;
import '../../cart/Controllers/cartCOntroller.dart';

import '../../main.dart';
import '../../utils/appColors.dart';
import '../../utils/appFonts.dart';
import '../Controllers/WishlistController.dart';
import '../Controllers/agentProfileContoller.dart';
import '../Model/allProductModel.dart';

class SingelAppointment extends StatefulWidget {
  final item;
  const SingelAppointment({this.item, super.key});

  @override
  State<SingelAppointment> createState() => _SingelAppointmentState();
}

class _SingelAppointmentState extends State<SingelAppointment> {
  var agentcontroller = Get.put(AgentProfileController());
  var ucon = Get.put(Usercontoller());
  var allcon = Get.put(AllinfoController());

  var isfav = false.obs;
  String date = "";
  TimeOfDay _selectedTime = TimeOfDay.now();
  int productQun = 1;
  int servicesQun = 1;
  double total = 0;
  final CartController cartController = Get.put(CartController());
  final WishlistController wishcontroller = Get.put(WishlistController());
  @override
  void initState() {
    super.initState();
    print("widget.item");
    print(widget.item);
    print(widget.item.agentid.toString());
    if (wishcontroller.isProductInWishlist(widget.item.id.toString())) {
      isfav.value = true;
      setState(() {});
    }
    coutntotal();
    date = (DateTime.now().day.toString() +
            "/" +
            DateTime.now().month.toString() +
            "/" +
            DateTime.now().year.toString())
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Column(
            children: [
              Obx(() {
                return Expanded(
                  child: ListView(padding: EdgeInsets.zero, children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.themeborder),
                            borderRadius: BorderRadius.circular(15)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                        child: Row(
                          children: [
                            Container(
                              height: 21.h,
                              width: 28.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        widget.item.img,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromARGB(60, 100, 99, 99),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.h, vertical: .5.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 11.h,
                                            width: 60.w,
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
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        widget.item.name
                                                            .toUpperCase(),
                                                        style:
                                                            AppFonts.fontH6bold(
                                                                AppColors
                                                                    .themeBlack),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Text(
                                                      applng.getLang(16) +
                                                          allcon.getCategoryNameById(
                                                              int.parse(widget
                                                                  .item
                                                                  .categoryId
                                                                  .toString())),
                                                      style:
                                                          AppFonts.fontH7semi(
                                                              AppColors
                                                                  .themeBlack),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(
                                                      height: .5.h,
                                                    ),
                                                    Text(
                                                      applng.getLang(17) +
                                                          allcon.getSubcategoryNameById(
                                                              int.parse(widget
                                                                  .item
                                                                  .subcategoryId
                                                                  .toString())),
                                                      style:
                                                          AppFonts.fontH7semi(
                                                              AppColors
                                                                  .themeBlack),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(
                                                      height: .5.h,
                                                    ),
                                                    Text(
                                                      applng.getLang(19) +
                                                          widget.item.gender
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
                                          Positioned(
                                            top: 0,
                                            right: 1,
                                            child: Column(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      if ((wishcontroller
                                                              .isProductInWishlist(
                                                                  widget.item.id
                                                                      .toString())) &&
                                                          isfav.value == true) {
                                                        wishcontroller
                                                            .removeProductFromWishlist(
                                                                widget.item.id
                                                                    .toString());
                                                        AppStyle.snackbar(
                                                            'Wishlist',
                                                            'Product delete from wishlist');
                                                        isfav.value = false;
                                                      } else {
                                                        wishcontroller
                                                            .addProductToWishlist(
                                                                widget
                                                                    .item); // Adding Products to wishlist
                                                        isfav.value = true;

                                                        AppStyle.snackbar(
                                                            'Wishlist',
                                                            'Product add to wishlist');
                                                      }
                                                      setState(() {});
                                                      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content))
                                                    }

                                                    //wishList.add(items);

                                                    ,
                                                    icon: isfav == true
                                                        ? Icon(
                                                            Icons.favorite,
                                                            color: AppColors
                                                                .themeColer,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .favorite_border_outlined,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                56, 45, 49),
                                                          )),
                                                RatingBarIndicator(
                                                  rating: double.parse(widget
                                                      .item.averageRating
                                                      .toString()),
                                                  itemCount: 1,
                                                  itemSize: 18.0,
                                                  direction: Axis.horizontal,
                                                  unratedColor: Colors.grey,
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  widget.item.averageRating
                                                          .toString() +
                                                      "/ 5.0",
                                                  style: AppFonts.fontH7semi(
                                                      AppColors.themeColer),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      // SizedBox(
                                      //   width: 58.w,
                                      //   height: 3.5.h,
                                      //   child: Row(
                                      //     children: [
                                      //       Expanded(
                                      //         child: Text(
                                      //           widget.item.description,
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
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                  text: applng.getLang(18),
                                                  style: AppFonts.fontH7normal(
                                                      AppColors.themeBlack),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            widget.item.sprice +
                                                                "Tk",
                                                        style:
                                                            AppFonts.fontH6semi(
                                                                AppColors
                                                                    .themeColer))
                                                  ]),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: applng.getLang(20),
                                                  style: AppFonts.fontH7normal(
                                                      AppColors.themeBlack),
                                                  children: [
                                                    TextSpan(
                                                        text: " " +
                                                            widget.item.pprice,
                                                        children: [
                                                          TextSpan(
                                                            text: "Tk",
                                                            style: AppFonts
                                                                .fontH6semi(
                                                                    AppColors
                                                                        .themeColer),
                                                          )
                                                        ],
                                                        style:
                                                            AppFonts.fontH6semi(
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              applng.getLang(21),
                              style:
                                  AppFonts.fontH6regular(AppColors.themeColer),
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(5),
                            //       border: Border.all(
                            //           width: 1, color: AppColors.themehint)),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Text(widget.item.available),
                            //   ),
                            // )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              applng.getLang(32),
                              style:
                                  AppFonts.fontH6regular(AppColors.themeColer),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: AppColors.themehint)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(() {
                                  if (agentcontroller.profilesdata == null) {
                                    return CircularProgressIndicator();
                                  }
                                  var prof = agentcontroller.profilesdata;

                                  print(prof);
                                  return prof!.isEmpty
                                      ? Container()
                                      : Text(prof![0].servicestime.toString());
                                }),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    timeslot()
                  ]),
                );
              })
            ],
          ),
        ),
        bottomNavigationBar: Obx(() {
          if (cartController.itemExists(widget.item.id.toString())) {
            return SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  print("widget.item.sprice");
                  print(widget.item.sprice);
                  print(widget.item.pprice);
                  var customTime = _formatTimeOfDay(_selectedTime);

                  final CartProducts cartProduct =
                      convertToCartProducts(widget.item);
                  final CartProduct.CartItem sampleItem = CartProduct.CartItem(
                      id: widget.item.id?.toString() ?? '0', // Handle null case
                      name: widget.item.name ??
                          'Unknown', // Default value if null
                      img: widget.item.img ?? '', // Default image
                      selectedTime: customTime.toString() ?? '', // Custom time
                      selectedDate: date.toString(), // Selected date
                      selectedServicsQun:
                          servicesQun?.toString() ?? '1', // Default quantity
                      selectedProductQun: productQun?.toString() ??
                          '1', // Default product quantity
                      sprice: widget.item.sprice.toString() ??
                          '0.00', // Handle null price
                      pprice: widget.item.pprice.toString() ??
                          '0.00', // Handle null price
                      agentid: widget.item.agentid.toString() ??
                          'Unknown Agent', // Handle null agentId
                      userid: ucon.user['id']
                          .toString(), // Assuming user id is always present
                      item:
                          cartProduct // Pass the entire product object directly
                      );

                  AppStyle.snackbar('Cart', 'Product added to Cart');
                  cartController.addItem(sampleItem);
                },
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: AppColors.themeColer,
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: Text(
                    applng.getLang(47),
                    style: AppFonts.fontH4semi(AppColors.themeWhite),
                  ),
                )),
          );
        }));
  }

  // Function to calculate the average rating
  double calculateAverageRating(reviewRatings) {
    if (reviewRatings == null || reviewRatings.isEmpty) return 0.0;

    double sum = reviewRatings.fold(
        0.0, (sum, review) => sum + double.parse(review.rating));
    return sum / reviewRatings.length;
  }

// Function to format TimeOfDay to a string
  String _formatTimeOfDay(TimeOfDay timeOfDay) {
    final hours = timeOfDay.hour.toString().padLeft(2, '0');
    final minutes = timeOfDay.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  CartProducts convertToCartProducts(product) {
    final jsonMap = product.toJson();
    print("product");
    print(jsonMap);
    return CartProducts(
      id: jsonMap['id']?.toString() ?? '',
      name: jsonMap['name'] ?? '',
      img: jsonMap['image'] ?? '',
      sprice: jsonMap['sprice']?.toString() ?? '0.00',
      pprice: jsonMap['pprice']?.toString() ?? '0.00',
      agentid: jsonMap['agent_id']?.toString() ?? '',
      categoryId: jsonMap['category_id']?.toString() ?? '',
      subcategoryId: jsonMap['subcategory_id']?.toString() ?? '',
      bodypartId: jsonMap['bodypart_id']?.toString() ?? '',
      cityId: jsonMap['city_id']?.toString() ?? '',
      locationIds: jsonMap['location_ids']?.toString() ?? '',
      slotId: jsonMap['slot_id']?.toString() ?? '',
      appointmentSlotIds: jsonMap['appointment_slot_ids']?.toString() ?? '',
      description: jsonMap['description'] ?? '',
      gender: jsonMap['gender'] ?? '',
      averageRating: jsonMap['average_rating'] ?? 0,
      createdAt: jsonMap['created_at'] ?? '',
      updatedAt: jsonMap['updated_at'] ?? '',
    );
  }

  List<CartProducts> convertProductsList(List<Products> productsList) {
    return productsList
        .map((product) => convertToCartProducts(product))
        .toList();
  }

  timeslot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            date = (selectedDate.day.toString() +
                    "/" +
                    selectedDate.month.toString() +
                    "/" +
                    selectedDate.year.toString())
                .toString();
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
            CustomCounterService(
              context,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              applng.getLang(25),
              style: AppFonts.fontH6semi(AppColors.themeBlack),
            ),
            CustomCounterproduct(context)
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
        recomandation(context)
      ],
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      final adjustedTime = _adjustToNearestInterval(picked, 15);

      setState(() {
        _selectedTime = adjustedTime;
      });
    }
  }

  TimeOfDay _adjustToNearestInterval(TimeOfDay time, int intervalMinutes) {
    int totalMinutes = time.hour * 60 + time.minute;

    int remainder = totalMinutes % intervalMinutes;
    if (remainder != 0) {
      totalMinutes += (remainder > intervalMinutes / 2)
          ? (intervalMinutes - remainder)
          : -remainder;
    }

    final int adjustedHour = totalMinutes ~/ 60;
    final int adjustedMinutes = totalMinutes % 60;

    return TimeOfDay(hour: adjustedHour, minute: adjustedMinutes);
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
    var p =
        double.parse(widget.item.pprice) * double.parse(productQun.toString());
    var s =
        double.parse(widget.item.sprice) * double.parse(servicesQun.toString());

    setState(() {
      total = double.parse((p + s).toString());
    });
  }

  var reconpro;
  recomandation(context) => Obx(() {
        if (agentcontroller.productrecomandation == null) {
          return CircularProgressIndicator();
        }
        reconpro = agentcontroller.productrecomandation;
        return Container(
          height: MediaQuery.of(context).size.height * .18,
          //color: Colors.green,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reconpro.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  width: 38.w,
                  height: 13.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              CachedNetworkImageProvider(reconpro[index].image),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(60, 100, 99, 99),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.themeColer,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: .5.w, horizontal: 2.w),
                                child: Text(
                                  reconpro[index].name,
                                  style:
                                      AppFonts.fontH7semi(AppColors.themeWhite),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      });
}
