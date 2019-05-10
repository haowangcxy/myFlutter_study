import 'package:flutter/material.dart';
import 'package:flutter_app/demo/bottom_appbar_demo.dart';
import 'package:flutter_app/demo/page_animation.dart';
import 'package:flutter_app/demo/fliter_demo.dart';
import 'package:flutter_app/demo/hold_state_demo.dart';
import 'package:flutter_app/demo/searchbar_demo.dart';
import 'package:flutter_app/demo/warp_demo.dart';
import 'package:flutter_app/demo/expansion_tile.dart';
import 'package:flutter_app/demo/ClipPath_demo.dart';
import 'package:flutter_app/demo/right_back_demo.dart';
import 'package:flutter_app/demo/tool_tips_demo.dart';
import 'package:flutter_app/demo/draggable_demo.dart';
import 'package:flutter_app/demo/preference.dart';
import 'package:flutter_app/demo/LocalPath.dart';
import 'package:flutter_app/demo/listview_demo.dart';
import 'package:flutter_app/demo/flow_wrap_table_demo.dart';
import 'package:flutter_app/demo/touch_event_demo.dart';
import 'package:flutter_app/demo/database_demo.dart';
import 'package:flutter_app/demo/paint_demo/paint_demo.dart';
import 'package:flutter_app/demo/bloc_demo/bloc_main.dart';
import 'package:flutter_app/demo/animation_demo.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: DemoList());
  }
}

class DemoList extends StatefulWidget {
  @override
  _DemoListState createState() => _DemoListState();
}

class _DemoListState extends State<DemoList> {
  final List <String> list = ['+号tabbar', '转场动画', '毛玻璃效果', '保持页面状态', '搜索框', '流式布局', '展开闭合案例','展开闭合列表案例', '贝塞尔曲线', '闪屏动画','右划返回','ToolTip控件实例', 'Draggable控件实例', '本地存储','本地文件相关','listview','flow, table, wrap','触摸事件','database','状态管理','动画','paint','原生交互','网页交互','地图','音视频','tab','单元测试'];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.separated(
      itemCount: list.length,
      padding: EdgeInsets.all(5.0),
      // itemExtent: 50,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
//       显示在title之前
          // leading: Image.network(
              // 'https://img-blog.csdn.net/20180727181058375?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2R1b19zaGluZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70'),
          title: Text(
            list[index]
          ),
          onTap: () {
            switch (index) {
              case 0:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context){
                  return BottomAppBarDemo();
                }
              ));
                break;
                case 1:
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:(BuildContext context){
                      return PageAnimationDemo();
                    }
                  )
                );
                break;
                
                case 2:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return FliterDemo();
                  }
                ));
                break;
                case 3:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return HoldStateDemo();
                  }
                ));
                break;
                case 4:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return MYSearchBarDemo();
                  }
                ));
                break;
                case 5:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return WarpDemo();
                  }
                ));
                break;
                case 6:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return ExpansionTileDemo();
                  }
                ));
                break;
                case 7:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return ExpansionPanelListDemo();
                  }
                ));
                break;
                case 8:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return ClipPathDemo();
                  }
                ));
                break;
                case 9:
                showAlertDialog(context);
                break;
                case 10:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return RightBackDemo();
                  }
                ));
                break;
                case 11:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return ToolTipDemo();
                  }
                ));
                break;
                case 12:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return DraggableDemo();
                  }
                ));
                break;
                case 13:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return PreferenceDemo();
                  }
                ));
                break;
                case 14:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return LocalPathTest();
                  }
                ));
                break;
                case 15:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return ListViewDemo();
                  }
                ));
                break;
                case 16:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return FlowWrapTableDemo();
                  }
                ));
                break;
                case 17:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return TouchEventDemo();
                  }
                ));
                break;
                case 18:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return DatabaseDemo();
                  }
                ));
                break;
                case 19:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return BlocDemo();
                  }
                ));
                break;
                case 20:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return AnimationPage();
                  }
                ));
                break;
                case 21:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return PaintDemo();
                  }
                ));
                break;
                case 22:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context){
                    return DraggableDemo();
                  }
                ));
                break;
              default:
            }
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1.0,
          color: Colors.grey[200],
        );
      },
    ));
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
                title: new Text("见启动页"),
                // content: new Text("This is my content"),
                actions: <Widget>[
                  // new FlatButton(
                  //   child: new Text("CANCEL"),
                  //   onPressed: () {
                  //     Navigator.of(context).pop();
                  //   },
                  // ),
                  new FlatButton(
                    child: new Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]));
  }
}
