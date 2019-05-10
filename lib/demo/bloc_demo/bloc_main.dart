/**
 * 有两个地方需要切换，一个是导入的top_page要切换，另外一个是MyApp要切换
 */

import 'package:flutter/material.dart';

//scoped
// import 'package:flutter_app/demo/bloc_demo/bloc/top_page.dart';
// import 'package:flutter_app/demo/bloc_demo/bloc/bloc_provider.dart';
//rxdart
import 'package:flutter_app/demo/bloc_demo/bloc_rxdart/bloc_provider.dart';
import 'package:flutter_app/demo/bloc_demo/bloc_rxdart/top_page.dart';

/**
 * scoped 入口
 */
// class BlocDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
      
//       child: MaterialApp(
//         title: 'scoped',
//         theme: ThemeData.dark(),
//         home: TopPage(),
//       ),
//     );
//   }
// }

/**
 * rxdart 入口
 */
class BlocDemo extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return BlocProvider(
     child: MaterialApp(
       title: 'rxdart',
       theme: ThemeData.dark(),
       
       home: TopPage(),
     ),
   );
 }
}
