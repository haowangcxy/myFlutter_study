import 'package:flutter/material.dart';



class CommonPage extends StatelessWidget {
final String pageTitle;
CommonPage({Key key, @required this.pageTitle}) :super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Center(
        child: Text(
        pageTitle
      ),
      )
    );
  }
}