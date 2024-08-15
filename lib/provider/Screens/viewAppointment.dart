import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shebeauty/provider/Model/allproviderDataModel.dart';
import 'package:shebeauty/utils/appLanguage.dart';
import 'package:shebeauty/utils/appStyle.dart';
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
 
  TimeOfDay _selectedTime = TimeOfDay.now();
  int productQun = 1;
  int servicesQun = 1;
  double total = 0;
   final CartController cartController = Get.put(CartController());
 var args=Get.arguments;
 var  date = DateTime.now();
      
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
   date=AppStyle.stringToDate(args.selectedDate) ;
   _selectedTime=AppStyle.stringToTime(args.selectedTime) ;
   
   });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Column(
        children: [
            CustomAppbar(
            title: "My Cart",
          ),
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Column(
                  children: [
                    
                    Expanded(
                      
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero, children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: AppColors.themeborder),
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 1.h),
                            child: Row(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            args.item.img_url,
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 2),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 15.h,
                                            width: 58.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text(
                                                      args.name.toUpperCase(),
                                                      style: AppFonts.fontH6bold(
                                                          AppColors.themeBlack),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      applng.getLang(16) +
                                                          args.item.category,
                                                      style: AppFonts.fontH7semi(
                                                          AppColors.themeBlack),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      applng.getLang(17) +
                                                          args.item.subcategory,
                                                      style: AppFonts.fontH7semi(
                                                          AppColors.themeBlack),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                          text: applng.getLang(18),
                                                          style: AppFonts.fontH7semi(
                                                              AppColors.themeBlack),
                                                          children: [
                                                            TextSpan(
                                                                text: args.item
                                                                        .servicePrice +
                                                                    "Tk",
                                                                style:
                                                                    AppFonts.fontH2semi(
                                                                        AppColors
                                                                            .themeColer))
                                                          ]),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            isfav = !isfav;
                                                            if (wishListItem.contains(
                                                                args)) {
                                                              wishListItem
                                                                  .remove(args);
                                                            } else {
                                                              wishListItem
                                                                  .add(args);
                                                              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content))
                                                              AppStyle.snackbar(
                                                                  'Wishlist',
                                                                  'Product add to wishlist');
                                                            }
                                                            //wishList.add(items);
                                                          });
                                                        },
                                                        icon: isfav
                                                            ? Icon(
                                                                Icons.favorite,
                                                                color: AppColors
                                                                    .themeColer,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .favorite_border_outlined,
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255, 56, 45, 49),
                                                              )),
                                                    Rattings(
                                                      rate:
                                                          args.item.rating.toString(),
                                                    ),
                                                  ],
                                                )
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
                                            height: 4.h,
                                            width: 58.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  applng.getLang(19) +
                                                      args.item.gender
                                                          .toString()
                                                          .toUpperCase(),
                                                  style: AppFonts.fontH7semi(
                                                      AppColors.themeBlack),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: applng.getLang(20),
                                                      style: AppFonts.fontH5semi(
                                                          AppColors.themeBlack),
                                                      children: [
                                                        TextSpan(
                                                            text: " " +
                                                                args.item.price +
                                                                "Tk",
                                                            style: AppFonts.fontH1semi(
                                                                AppColors.themeColer))
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
                                  style: AppFonts.fontH6regular(AppColors.themeColer),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: AppColors.themehint)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(args.item.available),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  applng.getLang(32),
                                  style: AppFonts.fontH6regular(AppColors.themeColer),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1, color: AppColors.themehint)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(args.item.slot.toString()),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        timeslot()
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            GestureDetector(
                    onTap: () {
                      if(cartController.itemExists(args.name)){
                        cartController.removeItem(args.id);
                         var  date2 = (date.day.toString() + "/" + date.month.toString()+ "/" +date.year.toString())
                .toString();
              //          final CartItem sampleItem = CartItem(
              //   id: args.id.toString(),
              //   name: args.name.toString(),
              //   img: args.img_url.toString(),
              //   selectedTime: _selectedTime.toString(),
              //   selectedDate: date2,
              //   selectedServicsQun: servicesQun.toString(),
              //   selectedProductQun:  productQun.toString(),
              //   item: args,
              // );
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
                        applng.getLang(36),
                        style: AppFonts.fontH4semi(AppColors.themeWhite),
                      ),
                    )),
                    IconButton(onPressed: (){
                      if(cartController.itemExists(args.name)){
                        cartController.removeItem(args.id);
                         AppStyle.snackbar('Item Delete', ' Cart Item Delete');
                        }
                    }, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }

  timeslot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EasyDateTimeLine(
          initialDate:date,
          
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
            CustomCounterproduct(
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
            CustomCounterService(context)
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
                if (productQun > 1) {
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
    var p = int.parse(args.item.price) * productQun;
    var s = int.parse(args.item.servicePrice) * servicesQun;

    setState(() {
      total = double.parse((p + s).toString());
    });
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
