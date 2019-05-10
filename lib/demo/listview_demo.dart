import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:toast/toast.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<String> addStr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> str = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewDemo'),
      ),
      body: Center(
        child: EasyRefresh(
            key: _easyRefreshKey,
            autoLoad: false,
            behavior: ScrollBehavior(),
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
            child: ListView.builder(
              
              itemCount: str.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Toast.show('在月读的世界里，空间、时间、质量，全部由我来支配' + index.toString(),
                          context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/you01.jpg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '宇智波鼬' + str[index],
                                  style: TextStyle(
                                      color: Color(0xff333333), fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '太过优秀也未必就是好事，实力超群便会被孤立，并且也会使人傲慢，就算最初是被人期待被人追捧也是一样。',
                                  style: TextStyle(
                                      color: Color(0xff666666), fontSize: 15),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              },
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
                setState(() {
                  str.addAll(addStr);
                });
              });
            },
            ),
      ),
    );
  }
}
