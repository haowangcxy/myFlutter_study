import 'package:flutter/material.dart';

class TouchEventDemo extends StatefulWidget {
  @override
  _TouchEventDemoState createState() => _TouchEventDemoState();
}

class _TouchEventDemoState extends State<TouchEventDemo> {
  String listenerStr = '';
  String gestureStr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('触摸事件'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Text(listenerStr),
          SizedBox(height: 10,),
          Center(
            child: Listener(
              onPointerDown: (down) {
                setState(() {
                  listenerStr = 'onPointerDownEvent';
                });
                print("onPointerDownEvent");
              },
              onPointerMove: (move) {
                print("onPointerMove");
                setState(() {
                  listenerStr = 'onPointerMove';
                });
              },
              onPointerUp: (up) {
                print("onPointerUp");
                setState(() {
                  listenerStr = 'onPointerUp';
                });
              },
              onPointerHover: (hover) {
                print("onPointerHover");
                setState(() {
                  listenerStr = 'onPointerHover';
                });
              },
              onPointerExit: (exit) {
                print("onPointerExit");
                setState(() {
                  listenerStr = 'onPointerExit';
                });
              },
              onPointerCancel: (cancle) {
                print("onPointerCancel");
                setState(() {
                  listenerStr = 'onPointerCancel';
                });
              },
              onPointerEnter: (enter) {
                print("onPointerEnter");
                setState(() {
                  listenerStr = 'onPointerEnter';
                });
              },
              child: Center(
                
                child: Text(
                  "Listener",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(gestureStr),
          SizedBox(height: 10,),
          Center(
            child: GestureDetector(
              onTap: () {
                print("onPointerDownEvent");
                setState(() {
                  gestureStr = 'onPointerDownEvent';
                });
              },
              onDoubleTap: () {
                print("onDoubleTap");
                setState(() {
                  gestureStr = 'onDoubleTap';
                });
              },
              onForcePressEnd: (end) {
                print("onForcePressEnd");
                setState(() {
                  gestureStr = 'onForcePressEnd';
                });
              },
              onForcePressPeak: (peak) {
                print("onForcePressPeak");
                setState(() {
                  gestureStr = 'onForcePressPeak';
                });
              },
              onForcePressStart: (start) {
                print("onForcePressStart");
                setState(() {
                  gestureStr = 'onForcePressStart';
                });
              },
              onForcePressUpdate: (update) {
                print("onForcePressUpdate");
                setState(() {
                  gestureStr = 'onForcePressUpdate';
                });
              },
              onHorizontalDragCancel: () {
                print("onHorizontalDragCancel");
                setState(() {
                  gestureStr = 'onHorizontalDragCancel';
                });
              },
              onHorizontalDragDown: (down) {
                print("onHorizontalDragDown");
                setState(() {
                  gestureStr = 'onHorizontalDragDown';
                });
              },
              onHorizontalDragEnd: (end) {
                print("onHorizontalDragEnd");
                setState(() {
                  gestureStr = 'onHorizontalDragEnd';
                });
              },
              onHorizontalDragStart: (start) {
                print("onHorizontalDragStart");
                setState(() {
                  gestureStr = 'onHorizontalDragStart';
                });
              },
              onHorizontalDragUpdate: (update) {
                print("onHorizontalDragUpdate");
                setState(() {
                  gestureStr = 'onHorizontalDragUpdate';
                });
              },
              onLongPressStart: (start) {
                print("onLongPressDragStart");
                setState(() {
                  gestureStr = 'onLongPressDragStart';
                });
              },
              onLongPressUp: () {
                print("onLongPressDragUp");
                setState(() {
                  gestureStr = 'onLongPressDragUp';
                });
              },
              onLongPressMoveUpdate: (update) {
                print("onLongPressDragUpdate");
                setState(() {
                  gestureStr = 'onLongPressDragUpdate';
                });
              },
              //监听更多方法可以在这里添加
              child: Center(
                child: Text(
                  "GestureDetector",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.lightBlue
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
