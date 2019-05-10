import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:toast/toast.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseDemo extends StatefulWidget {
  @override
  _DatabaseDemoState createState() => _DatabaseDemoState();
}

class _DatabaseDemoState extends State<DatabaseDemo> {
  String name = '';
  String pwd = '';
  String searchName = '';
  Map m = Map();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
    TextEditingController _searchController = TextEditingController();

  DataBaseManager d;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    d = DataBaseManager();
    print(d);
    testQuery();
  }

  void testQuery() async {
    d.DatabaseInit().then((_) async {
      List a = await d.queryDataBase('wanghao');
      print(a);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height_screen = MediaQuery.of(context).size.height;
    final width_srcreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('database'),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Text(
                'database测试',
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
              TextField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: '请输入要查询的姓名'),
                onChanged: _searchTFChange,
                autofocus: false,
              ),
              SizedBox(height: 10,),
              Text(
                'database查询',
                style: TextStyle(color: Color(0xff333333), fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
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

void _searchTFChange(String t){
searchName = t;
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
    List l = await d.queryDataBase(searchName);
    Toast.show(l.toString(), context);
  }

  void _save() async {
    FocusScope.of(context).requestFocus(FocusNode());
    d.insert(name, pwd);
  }
}

class DataBaseManager {
  Database database;

  DataBaseManager() {
    DatabaseInit();
  }

  Future<void> DatabaseInit() async {
    var databasePath = await getDatabasesPath();
    String path = databasePath + '/demo.db';
// await deleteDatabase(path);
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, pwd TEXT, data BLOB)');
      // await db.insert('Test', {
      //   'name': 'wanghao',
      //   'pwd': '111',
      //   'data': ['1', '2', '3']
      // });
      print(await db.query('test'));
    });
  }

  void insert(String name, String pwd) async {
    await database.insert('test', {
      'name': name,
      'pwd': pwd,
      'data': {'dict_name': name, 'dict_pwd': pwd}
    });
  }

  void delete(String name) async {
    await database.delete('test', where: 'name = ?', whereArgs: [name]);
  }

  void update(String name, String pwd) async {
    await database.update('test', {'pwd': pwd},
        where: 'name = ?', whereArgs: [name]);
  }

  Future<List> queryDataBase(String name) async {
    return await database.rawQuery('select * from test where name = ?', [name]);
  }
}
