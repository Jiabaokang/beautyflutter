import 'package:flutter/material.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChange;
  final ContentPagerController contentPagerController;
  ///构造方法可选参数
  const ContentPager({Key key, this.onPageChange, this.contentPagerController})
      ///初始化列表
      : super(key: key);

  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.teal,
  ];

  ///ViewPage滑动控制
  PageController _pageController = PageController(
    //视图比例
      viewportFraction: 0.8
  );

  @override
  void initState() {
    if(widget.contentPagerController != null){
      widget.contentPagerController._pageController = _pageController;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //Appbar

      children: <Widget>[
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged:widget.onPageChange,
            children: <Widget>[
              _wrapItem(0),
              _wrapItem(1),
              _wrapItem(2),
              _wrapItem(3),
            ],
          ),
        )
      ],
    );
  }

  Widget _wrapItem(int index) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(color: _colors[index]),
      ),
    );
  }
}
///内容区域控制器
class ContentPagerController{
  PageController _pageController;
  void jumpToPage(int page){
    //dart 编程技巧：安全调用
    _pageController?.jumpToPage(page);
  }
}
