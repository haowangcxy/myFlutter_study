import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:toast/toast.dart';

class PreferenceDemo extends StatefulWidget {
  @override
  _PreferenceDemoState createState() => _PreferenceDemoState();
}

class _PreferenceDemoState extends State<PreferenceDemo> {
  String name = '';
  String pwd = '';
  Map m =Map();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height_screen = MediaQuery.of(context).size.height;
    final width_srcreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('preference'),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Text(
                'prefrence测试',
                style: TextStyle(color: Color(0xff333333), fontSize: 18),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize:MainAxisSize.min,
                children: <Widget>[
                  Text('name：',
                      style: TextStyle(color: Color(0xff333333), fontSize: 14)),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 60),
                      // width: 200,
                      child: TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: '请输入姓名'),
                        onChanged: _nameTFChange,
                        autofocus: false,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize:MainAxisSize.min,
                children: <Widget>[
                  Text('pwd：  ',
                      style: TextStyle(color: Color(0xff333333), fontSize: 14)),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 60),
                      child: TextField(
                        controller: _pwdController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: '请输入密码'),
                        onChanged: _pwdTFChange,
                        autofocus: false,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      '清除',
                      // style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _clear,
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      '保存',
                      // style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _save,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'prefrence查询',
                style: TextStyle(color: Color(0xff333333), fontSize: 18),
              ),
              
              SizedBox(height: 15,),
              MaterialButton(
color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      '查询',
                      // style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _searchClick,
              )
            ],
          )),
    );
  }

  void _nameTFChange(String t) {
    print(t);
    name = t;
  }

  void _pwdTFChange(String t) {
    pwd = t;
    print(pwd);
  }

  void _clear() {
    print('click clear');
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _nameController.clear();
      _pwdController.clear();
    });
  }

void _searchClick() async {
  await SpUtil.getInstance();
          Map m =SpUtil.getObject('test_key');
          Toast.show(m.toString(), context);
}

  void _save() async {
    FocusScope.of(context).requestFocus(FocusNode());
    await SpUtil.getInstance();
    Map m =Map();
    m.addAll({'test_name':name,'test_pwd':pwd});
    SpUtil.putObject('test_key', m);
    print(SpUtil.getObject('test_key'));
  }
}
