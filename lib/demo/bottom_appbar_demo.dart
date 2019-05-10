import 'package:flutter/material.dart';
import 'package:flutter_app/demo/common_page.dart';

class BottomAppBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarDemoContent(),
    );
  }
}

class AppBarDemoContent extends StatefulWidget {
  @override
  _AppBarDemoContentState createState() => _AppBarDemoContentState();
}

class _AppBarDemoContentState extends State<AppBarDemoContent> {
  final _BottomNavigationSelectColor = Colors.blue;
  final _BottomNavigationColor = Colors.grey;

  List<Widget> list = List();
  int _currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
    list
      ..add(CommonPage(
        pageTitle: 'Home',
      ))
      ..add(CommonPage(
        pageTitle: "Mine",
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'floating',
        child: Icon(
          Icons.add,
          color:Colors.white
        ),
        onPressed: (){
          
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: list[_currentIndex],
      bottomNavigationBar: BottomAppBar(
         color:Colors.lightBlue,
         shape:CircularNotchedRectangle(),
         child: Row(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             IconButton(
               icon:Icon(Icons.home),
               color:Colors.white,
               onPressed:(){
                
               }
             ),
             IconButton(
               icon:Icon(Icons.airport_shuttle),
               color:Colors.white,
               onPressed:(){
                 
               }
             ),
           ],
         ),
       )
      // bottomNavigationBar: BottomAppBar(
      //   currentIndex: _currentIndex,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (int index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home,
      //             color: _currentIndex == 0
      //                 ? _BottomNavigationSelectColor
      //                 : _BottomNavigationColor),
      //         title: Text(
      //           'home',
      //           style: TextStyle(
      //               color: _currentIndex == 0
      //                   ? _BottomNavigationSelectColor
      //                   : _BottomNavigationColor),
      //         )),
      //         BottomNavigationBarItem(
      //         icon: Icon(Icons.map,
      //             color: _currentIndex == 1
      //                 ? _BottomNavigationSelectColor
      //                 : _BottomNavigationColor),
      //         title: Text(
      //           'mine',
      //           style: TextStyle(
      //               color: _currentIndex == 1
      //                   ? _BottomNavigationSelectColor
      //                   : _BottomNavigationColor),
      //         ))
      //   ],
      // ),
    );
  }
}
