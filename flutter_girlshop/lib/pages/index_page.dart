import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import '../config/index.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'person_page.dart';
import '../provide/current_index_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatelessWidget{

  final List<BottomNavigationBarItem> bottomTabs = [

    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text(KString.homeTitle),//首页
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      title: Text(KString.categoryTitle),//分类
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text(KString.shopCartTitle),//购物车
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text(KString.personTitle),//个人中心
    )
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    PersonPage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return Provide<CurrentIndexProvide>(

      builder: (context,child,val){

        //取到当前索引值
        int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;

        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: bottomTabs,
            onTap:(index){
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            } ,
          ),
          body: IndexedStack(
            index: currentIndex,
            children: tabBodies,
          ),
        );
      },
    );
  }
}