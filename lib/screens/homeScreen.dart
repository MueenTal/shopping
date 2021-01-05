import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sumtion = 22.33;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[600],
            title: Text("قائمة المشتريات"),
            centerTitle: true,
            actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
          ),
          backgroundColor: Colors.grey[200],
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[300],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2.2,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            "المجموع",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 4,
                        color: Colors.grey[300],
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2.2,
                        color: Colors.white,
                        child: Center(
                            child: Text(
                          sumtion.toString(),
                          style: TextStyle(fontSize: 25),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Expanded(
                child: ListView(
                  children: [
                    item(3.3, () {}, "mmm"),
                    item(3.3, () {}, "mmm"),
                    item(3.3, () {}, "mmm"),
                    item(3.3, () {}, "mmm"),
                    item(3.3, () {}, "mmm"),
                    item(3.3, () {}, "mmm"),
                    item(3.3, () {}, "mmm"),
                    item(3.3, () {}, "mmm"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget item(double price, Function function, String name) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 60,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(spreadRadius: 2.6, color: Colors.grey)],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2.4,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  width: 4,
                  color: Colors.grey[300],
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 5,
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    price.toString(),
                    style: TextStyle(fontSize: 18),
                  )),
                ),
                Container(
                  height: 70,
                  width: 4,
                  color: Colors.grey[300],
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 6,
                  color: Colors.white,
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  height: 350,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 1.3,
                                            color: Colors.grey)
                                      ],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
