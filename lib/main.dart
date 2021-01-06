import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping/dbHelper.dart';
import 'package:shopping/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplachScreen(),
    );
  }
}

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  _loadSlpash() async {
    // Time (splash)
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
  }

  @override
  void initState() {
    _loadSlpash();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset("assets/images/shooping.png"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "   .....أهلا وسهلا بك في الحافظة",
                style: TextStyle(fontSize: 25, color: Colors.blue[800]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
