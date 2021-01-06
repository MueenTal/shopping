import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping/dbHelper.dart';
import 'package:shopping/models/Item.dart';

class Adding extends StatefulWidget {
  @override
  _AddingState createState() => _AddingState();
}

class _AddingState extends State<Adding> {
  String name = "";
  double price = 0;

  DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.red[600],
            title: Text(" إضافة المشتريات"),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                          margin: EdgeInsets.only(
                              top: 100, left: 20, right: 20, bottom: 100),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(38)),
                            boxShadow: [
                              BoxShadow(spreadRadius: 2.6, color: Colors.red)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: TextField(
                                      cursorColor: Colors.red,
                                      onChanged: (value) {
                                        setState(() {
                                          name = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: '    الغرض  ',
                                        labelText: ' ادخل اسم الغرض ',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 3),
                                          borderRadius:
                                              BorderRadius.circular((25)),
                                        ),
                                      )),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: TextField(
                                      keyboardType: TextInputType.number,
                                      cursorColor: Colors.red,
                                      onChanged: (value) {
                                        setState(() {
                                          price = double.parse(value);
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: '    السعر  ',
                                        labelText: ' ادخل سعر الغرض ',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 3),
                                          borderRadius:
                                              BorderRadius.circular((25)),
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, right: 8, bottom: 8),
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.grey[200],
                                            Colors.grey[200],
                                          ])),
                                  child: FlatButton(
                                    child: Text(
                                      " إضافة",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 25),
                                    ),
                                    onPressed: () async {
                                      if (name == "" || price == 0) {
                                        Fluttertoast.showToast(
                                            msg: " يرجى الادخال الاسم والسعر ",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else {
                                        var item = Item(
                                            {'name': name, 'price': price});
                                        await helper.createItem(item);
                                        Fluttertoast.showToast(
                                            msg: " تم الادخال بنجاح ",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.white,
                                            textColor: Colors.teal[800],
                                            fontSize: 16.0);
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
