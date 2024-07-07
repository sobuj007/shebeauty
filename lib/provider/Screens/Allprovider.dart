
import 'package:flutter/material.dart';

import '../../utils/custom widget/CustomAppbar.dart';
import 'singelProvider.dart';


class AllProvider extends StatefulWidget {
  List<String> selectedBody;
  AllProvider({required this.selectedBody, super.key});

  @override
  State<AllProvider> createState() => _AllProviderState();
}

class _AllProviderState extends State<AllProvider> {
  TextEditingController serachController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.selectedBody.add("All");
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            CustomAppbar(
              title: "All Provider",
            ),
            searchWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .05,
                    // // (.06 * widget.selectedBody.length % 2),
                    // width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.selectedBody.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 1),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    widget.selectedBody[index].toString(),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  GestureDetector(
                                      onTap: (() {
                                        widget.selectedBody
                                            .remove(widget.selectedBody[index]);
                                        setState(() {});
                                      }),
                                      child: Icon(
                                        Icons.close,
                                        size: 13,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .75,
                    //    (.80 - (.5 * (widget.selectedBody.length % 3))),
                    // color: Colors.grey.shade100,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SingelProvider()));
                          },
                          child: Card(
                            child: Container(
                              height: 150,
                              width: 100,
                              color: Colors.blueAccent.shade400,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  searchWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .77,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: TextField(
              controller: serachController,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                  onPressed: () {
                    showpopup(context);
                  },
                  icon: Icon(Icons.sort)))
        ],
      ),
    );
  }

  showpopup(context) {
    showDialog(
        context: context,
        builder: ((context) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              height: 300,
              color: Colors.amber,
              child: Text("data"),
            ),
          );
        }));
  }
}
