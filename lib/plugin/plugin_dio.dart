import 'package:flutter/material.dart';
import 'package:flutter_app/network/NetUtil.dart';

class DioTest extends StatefulWidget {
  @override
  _DioTestState createState() => _DioTestState();
}

class _DioTestState extends State<DioTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DioTest'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}