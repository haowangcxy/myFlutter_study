import 'package:flutter/material.dart';
import 'package:flutter_app/demo/common_page.dart';

class PageAnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('转场动画'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(CustomRoute(CommonPage(pageTitle: 'Transition'), 0
                      // return CommonPage(pageTitle:'demo');
                      ));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15, 0),
              child: Center(
                child: Text(
                  '逐渐淡化动画',
                ),
              ),
              color: Colors.green,
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(CustomRoute(
                  CommonPage(
                    pageTitle: 'Transition',
                  ),
                  1));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15, 0),
              child: Center(
                child: Text(
                  '旋转缩放动画',
                ),
              ),
              color: Colors.blue,
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(CustomRoute(
                  CommonPage(
                    pageTitle: 'Transition',
                  ),
                  2));
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15, 0),
              child: Center(
                child: Text(
                  '左右滑动动画',
                ),
              ),
              color: Colors.green,
            ),
          )),
        ],
      ),
    );
  }
}

class CustomRoute extends PageRouteBuilder {
  final Widget widget;
  int type;
  CustomRoute(this.widget, @required this.type)
      : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              switch (type) {
                case 0:
                  return FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animation1, curve: Curves.fastOutSlowIn)),
                    child: child,
                  );
                  break;
                case 1:
                  return RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                      child: ScaleTransition(
                        scale: Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animation1,
                                curve: Curves.fastOutSlowIn)),
                        child: child,
                      ));
                  break;
                case 2:
                  return SlideTransition(
                    position: Tween<Offset>(
                            begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                        .animate(CurvedAnimation(
                            parent: animation1, curve: Curves.fastOutSlowIn)),
                    child: child,
                  );
                  break;
                default:
              }
            });
}
