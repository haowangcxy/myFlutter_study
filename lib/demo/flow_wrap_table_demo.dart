import 'package:flutter/material.dart';

class FlowWrapTableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'flow_wrap_table'
        )
      ),

body:Column(
  children: <Widget>[
    
    Expanded(
      child: Center(
        child: LYFlowContent(),
      ),
      flex: 1,
    ),
    Expanded(
      child: LYTableContent(),
      flex: 1,
    ),
    Expanded(
      child: LYWrapContent(),
      flex: 1,
    ),    
  ],
),
    );
  }
}

class LYFlowContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const width = 80.0;
    const height = 60.0;
    return Flow(
      
      delegate: TestFlowDelegate(margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)),
      children: <Widget>[
        new Container(width: width, height: height, color: Colors.yellow,),
        new Container(width: width-30, height: height, color: Colors.green,),
        new Container(width: width-20, height: height, color: Colors.red,),
        new Container(width: width-60, height: height+40, color: Colors.black,),
        new Container(width: width, height: height, color: Colors.blue,),
        new Container(width: width, height: height, color: Colors.lightGreenAccent,),
      ],
      
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});

@override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
  // return Size(300, 400);
    return super.getSize(constraints);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class LYTableContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(50.0),
        1: FixedColumnWidth(100.0),
        2: FixedColumnWidth(50.0),
        3: FixedColumnWidth(100.0),
      },
      border: TableBorder.all(color: Colors.red, width: 1.0, style: BorderStyle.solid),
      children: const <TableRow>[
        TableRow(
          children: <Widget>[
            Text('A1'),
            Text('B1'),
            Text('C1'),
            Text('D1'),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text('A2'),
            Text('B2'),
            Text('C2'),
            Text('D2'),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text('A3'),
            Text('B3'),
            Text('C3'),
            Text('D3'),
          ],
        ),
      ],
    );
  }
}

class LYWrapContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, //
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: new Text('AH', style: TextStyle(fontSize: 10.0),)),
          label: Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: new Text('ML', style: TextStyle(fontSize: 10.0),)),
          label: Text('Lafayette'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: new Text('HM', style: TextStyle(fontSize: 10.0),)),
          label: Text('Mulligan'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: new Text('JL', style: TextStyle(fontSize: 10.0),)),
          label: Text('Laurens'),
        ),
      ],
    );
  }
}