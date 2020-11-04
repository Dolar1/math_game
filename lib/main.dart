import 'package:flutter/material.dart';
import 'package:jayaho/screen/EasyHard.dart';
import 'package:jayaho/screen/spalsh.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'JayaHo',
    theme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 10),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EasyHard(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SpalshScreen();
  }
}
