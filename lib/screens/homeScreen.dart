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
              Expanded(
                child: ListView(
                  children: [item(3.3, () {}, "mmm")],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget item(double price, Function function, String name) {
    return Container();
  }
}
