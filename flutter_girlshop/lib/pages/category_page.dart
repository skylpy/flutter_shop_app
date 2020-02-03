
import 'dart:convert';

import 'package:flutter/material.dart';
import '../config/index.dart';
import '../service/http_service.dart';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../model/category_model.dart';


//分类页面
class CategoryPage extends StatefulWidget{

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.categoryTitle),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                RightCategoryNav(),
                CategoryGoodList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//左侧导航菜单
class LeftCategoryNav extends StatefulWidget{

  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav>{

  List list = [];
  var listIndex = 0;//索引

  @override
  void initState(){
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('左侧分类');
  }

  //获取分类数据
  _getCategory() async{
    await request('getCategory',formData:null ).then((val){

      var data = json.decode(val.toString());
      CategoryModel categoryMode = CategoryModel.fromJson(data);
      setState((){
        list = categoryMode.data;
      });
    });
  }
}

//右侧导航菜单
class RightCategoryNav extends StatefulWidget{

  _RightCategoryNavPage createState() => _RightCategoryNavPage();
}

class _RightCategoryNavPage extends State<RightCategoryNav>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('右侧分类');
  }
}

//商品列表
class CategoryGoodList extends StatefulWidget{

  _CategoryGoodListState createState() => _CategoryGoodListState();
}

class _CategoryGoodListState extends State<CategoryGoodList>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('右侧分类');
  }
}

