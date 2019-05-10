import 'package:flutter/material.dart';
import 'package:flutter_app/demo/paint_demo/clock.dart';
import 'package:flutter_app/demo/paint_demo/thermometer.dart';

class PaintDemo extends StatefulWidget {
  @override
  _PaintDemoState createState() => _PaintDemoState();
}

class _PaintDemoState extends State<PaintDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('paintDemo'),
),
body: Column(
  children: <Widget>[
    Center(
      child: ClockPage(),
    ),
    Center(
      child: ThermometerPage(width: 300, degree: 50,),
    )
  ],
),
    );
  }
}