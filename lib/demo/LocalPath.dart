import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';

class LocalPathTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _getTemporaryDirectory() async {
      var d = await getTemporaryDirectory();
      Toast.show(d.path, context);
    }

void _getApplicationDocumentsDirectory() async {
  var d = await getApplicationDocumentsDirectory();
  Toast.show(d.path, context);
}

void _getExternalStorageDirectory() async {
  try {
      var d = await getExternalStorageDirectory();
      Toast.show(d.path, context);
  } catch (e) {
    Toast.show('iOS设备不支持外部内存', context);
    }

}

    return Scaffold(
      appBar: AppBar(
        title: Text('localPath'),
      ),
      body: Container(
        width: 800,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('获取临时目录'),
            onPressed: _getTemporaryDirectory,
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('获取文档目录'),
            onPressed: _getApplicationDocumentsDirectory,
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('获取外部存储目录'),
            onPressed: _getExternalStorageDirectory,
          ),
        ],
      ),
      )
    );
  }
}
