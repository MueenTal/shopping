import 'package:flutter/material.dart';
import 'package:shopping/dbHelper.dart';
import 'package:shopping/models/Item.dart';
import 'package:shopping/screens/adding.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DbHelper helper;
  Widget wSum;

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      helper.getTotal();
      wSum = helper.con(context);
    });

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[600],
            title: Text("قائمة المشتريات"),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Adding()));
                  })
            ],
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
                      wSum
                      // Container(
                      //   height: 60,
                      //   width: MediaQuery.of(context).size.width / 2.2,
                      //   color: Colors.grey[100],
                      //   child: Center(
                      //       child: Text(
                      //     sum,
                      //     style: TextStyle(fontSize: 25),
                      //   )),
                      // ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Expanded(
                child: FutureBuilder(
                  future: helper.allItems(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            Item items = Item.fromMap(snapshot.data[i]);

                            return item(items.price, () {
                              helper.deleteItems(items.id);
                              Navigator.of(context).pop();

                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          HomeScreen(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                              );
                            }, items.name);
                          });
                    }
                  },
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
                                  height: 200,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "هل تريد  حذف العنصر هذا ؟",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 20),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, right: 8, bottom: 8),
                                            child: Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15.0),
                                                  ),
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Colors.grey[200],
                                                        Colors.grey[200],
                                                      ])),
                                              child: FlatButton(
                                                child: Text(
                                                  " لا ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, right: 8, bottom: 8),
                                            child: Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15.0),
                                                  ),
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Colors.grey[200],
                                                        Colors.grey[200],
                                                      ])),
                                              child: FlatButton(
                                                child: Text(
                                                  " نعم ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22),
                                                ),
                                                onPressed: function,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
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
