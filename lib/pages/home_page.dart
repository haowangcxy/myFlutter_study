import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: SwiperDemo(),
    );
  }
}

class SwiperDemo extends StatefulWidget {
  @override
  _SwiperDemoState createState() => _SwiperDemoState();
}

class _SwiperDemoState extends State<SwiperDemo> {

  // 声明一个list，存放image Widget
  List<Widget> imageList = List();

  @override
  void initState() {
    imageList
    ..add(Image.network(
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
      fit: BoxFit.fill,
    ))
    ..add(Image.network(
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
      fit: BoxFit.fill,
    ))
    ..add(Image.network(
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
      fit: BoxFit.fill,
    ))
    ..add(Image.network(
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
      fit: BoxFit.fill,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(     // 这里使用listView是因为本地写了几组不同样式的展示，太懒了，所以这里就没有改
          children: <Widget>[
            firstSwiperView()
          ],
        ),
    );
  }
  Widget firstSwiperView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Swiper(
        itemCount: 4,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white
            )
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }
  
  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }
}
