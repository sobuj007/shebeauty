
     import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ghore_Parlor/utils/appColors.dart';
import 'package:Ghore_Parlor/utils/appFonts.dart';
import 'package:Ghore_Parlor/utils/appStyle.dart';
import 'package:sizer/sizer.dart';
import '../../auth/Controllers/userContoller.dart';
import '../HistoryContoller.dart';
import 'itemsDetails.dart';


class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final HistoryController historyController = Get.put(HistoryController());
  PageController _pageController = PageController(initialPage: 0);
 var getcon= Get.put(Usercontoller());
  @override
  void initState() {
    super.initState();
  
   var users=getcon.getUser();
        
     historyController.fetchHistory(users['id'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        title: Text('Order History',style: AppFonts.fontH4semi(AppColors.themeWhite),),
        backgroundColor: AppColors.themeColer,
        iconTheme: IconThemeData(
          color: AppColors.themeWhite// Change the color of the back arrow here
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              buildTabButton("Completed", 0),
              buildTabButton("Pending", 1),
              buildTabButton("Today", 2),
            ],
          ),
        ),
      ),
      body: Obx(() {
        if (historyController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (historyController.hasError.value) {
          return Center(child: Text("Error loading data."));
        }

        return PageView(
          controller: _pageController,
          children: [
            buildOrderList("Completed Orders", historyController.historyModel.value.completedorders),
            buildOrderList("Pending Orders", historyController.historyModel.value.pendingorders),
            buildOrderList("Today's Orders", historyController.historyModel.value.todaylist),
          ],
        );
      }),
    );
  }

  Widget buildTabButton(String title, int pageIndex) {
    return TextButton(
      onPressed: () {
        _pageController.jumpToPage(pageIndex);
      },
      child: Text(
        title,
        style: TextStyle(color: AppColors.themeWhite),
      ),
    );
  }

  Widget buildOrderList(String title, List<dynamic>? orders) {
    if (orders == null || orders.isEmpty) {
      return Center(child: Text("No $title available"));
    }
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        var order = orders[index];
        return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.h,vertical: .5.h),
          child: Container(
            decoration: BoxDecoration( border: Border.all(width: .2.w,color: AppColors.themeborder),borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>ItemDetailPage(item: order.items2,)));
              },
              title: Text("#GPHW"+order.id.toString()),
              trailing: Text(order.status), // Customize this based on your order data
              
            ),
          ),
        );
      },
    );
  }
}
