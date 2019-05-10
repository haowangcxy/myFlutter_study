import 'package:flutter/material.dart';
import 'pages/launch_flash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      title: 'demo',
      theme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}