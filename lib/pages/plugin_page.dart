import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:async';
import 'package:toast/toast.dart';
// import 'package:flutter_app/generated/translations.dart';
import 'package:flutter_app/plugin/plugin_dio.dart';
import 'package:flutter_app/plugin/plugin_calendar.dart';

class PluginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Plugin'),
      ),
      body: BasicPage(),
    );
  }
}

/// 基本使用页面
class BasicPage extends StatefulWidget {
  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {

  List<String> addStr=["9","0"];
  List<String> str=["网络请求","日历","actionsheet","地图","通知","dastabase","闲鱼原生交互","闲鱼状态管理"];
  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(Translations.of(context).text("basicUse")),
      // ),
      body: Center(
          child: new EasyRefresh(
            key: _easyRefreshKey,
            autoLoad: false,
            behavior: ScrollOverBehavior(),
            refreshHeader: ClassicsHeader(
              key: _headerKey,
              refreshText: "pullToRefresh",
              refreshReadyText: "releaseToRefresh",
              refreshingText: "refreshing" + "...",
              refreshedText: "refreshed",
              moreInfo: "updateAt",
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            refreshFooter: ClassicsFooter(
              key: _footerKey,
              loadText: "pushToLoad",
              loadReadyText: "releaseToLoad",
              loadingText: "loading",
              loadedText: "loaded",
              noMoreText: "noMore",
              moreInfo: "updateAt",
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            child: new ListView.builder(
              //ListView的Item
              
                itemCount: str.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    child: new Container(
                      height: 70.0,
                      child: Card(
                        child: new Center(
                          child: new Text(str[index],style: new TextStyle(fontSize: 18.0),),
                        ),
                      )
                  ),
                  onTap: (){                    
                    Toast.show('index' + index.toString(), context, gravity: 1);
                    switch (index) {
                      case 0:
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context){
                            return DioTest();
                          }
                        ));
                        break;
                        case 1:
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context){
                            return CalendarTest();
                          }
                        ));
                        break;
                      default:
                    }
                  },
                  );
                }
            ),
            onRefresh: () async{
              await new Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  str.clear();
                  str.addAll(addStr);
                });
              });
            },
            loadMore: () async {
              await new Future.delayed(const Duration(seconds: 1), () {
                if (str.length < 20) {
                  setState(() {
                    str.addAll(addStr);
                  });
                }
              });
            },
          )
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(onPressed: () {
          _easyRefreshKey.currentState.callRefresh();
        }, child: Text("refresh", style: TextStyle(color: Colors.black))),
        FlatButton(onPressed: () {
          _easyRefreshKey.currentState.callLoadMore();
        }, child: Text("loadMore", style: TextStyle(color: Colors.black)))
      ],// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}