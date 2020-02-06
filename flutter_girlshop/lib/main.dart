import 'package:flutter/material.dart';
import './config/index.dart';
import './provide/current_index_provide.dart';
import 'package:provide/provide.dart';
import './pages/index_page.dart';
import './provide/category_provide.dart';
import './provide/category_goods_list_provide.dart';

void main() {

  var currentIndexProvide = CurrentIndexProvide();
  var categoryProvide = CategoryProvide();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var provides = Providers();

  provides
    ..provide(Provider<CategoryProvide>.value(categoryProvide))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  runApp(ProviderNode(child: MyApp(), providers: provides));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KString.mainTitle,//flutter 女装商城
      debugShowCheckedModeBanner: false,
      //主题
      theme: ThemeData(

        primaryColor: KColor.primaryColor,
      ),
      home: IndexPage(),

    );
  }
}

