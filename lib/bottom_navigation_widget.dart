import 'package:flutter/material.dart';
import 'pages/demo_page.dart';
import 'pages/home_page.dart';
import 'pages/plugin_page.dart';


void main() => runApp(MaterialApp(
      home: BottomNavigationWidget(),
    ));

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
    final _BottomNavigationSelectColor = Colors.blue;
    final _BottomNavigationColor = Colors.grey;

    List <Widget> list =List();
    int _currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list..add(HomePage())
    ..add(DemoPage())
    ..add(PluginPage());
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            _currentIndex =index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon:Icon(
              Icons.home,
              color: _currentIndex == 0 ? _BottomNavigationSelectColor : _BottomNavigationColor
            ),
            title: Text(
              'home',
              style:TextStyle(
                color:_currentIndex == 0 ? _BottomNavigationSelectColor : _BottomNavigationColor
              )
            ),
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.mail,
              color: _currentIndex == 1 ? _BottomNavigationSelectColor : _BottomNavigationColor
            ),
            title: Text(
              'demo',
              style:TextStyle(
                color:_currentIndex == 1 ? _BottomNavigationSelectColor : _BottomNavigationColor
              )
            )
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.place,
              color: _currentIndex == 2 ? _BottomNavigationSelectColor : _BottomNavigationColor
            ),
            title: Text(
              'plugin',
              style:TextStyle(
                color:_currentIndex == 2 ? _BottomNavigationSelectColor : _BottomNavigationColor
              )
            )
          ),
        ],
      ),
      
      body:list[_currentIndex],
    );
  }
}