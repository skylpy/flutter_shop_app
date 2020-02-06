import 'package:flutter/material.dart';
import '../model/category_model.dart';

class CategoryProvide with ChangeNotifier{

  List<SecondCategoryVO> secondCategoryGoodList = [];
  int secontCategoryIndex = 0;//二级分类
  int firstCategoryIndex = 0;//以及分类
  String secontCategoryId = '4';//二级id
  String firstCategoryId = '';//一级id
  int page = 1;//列表页数，当改变以及分类或二级分类时

  String noMoreText = '';//现实更多列表
  bool isNewCategord = true;

  //首页点击类别时更改类别
  changeFirstCategory(String id,int index){
    firstCategoryId = id;
    firstCategoryIndex = index;
    secontCategoryId = '';
    notifyListeners();
  }

  //获取二级分类数据
  getSecondCategory(List<SecondCategoryVO> list ,String id){
    isNewCategord = true;
    firstCategoryId = id;
    secontCategoryIndex = 0;
    page = 1;
    secontCategoryId = '';//点击以及分类时把二级分类清空

    SecondCategoryVO all = SecondCategoryVO();
    all.secondCategoryId = '';
    all.firstCategoryId = '00';
    all.secondCategoryName = '全部';
    all.comments = 'null';
    secondCategoryGoodList = [all];
    secondCategoryGoodList.addAll(list);
    notifyListeners();

  }

  changeSecondIndex(int index,String id){
    isNewCategord = true;
    secontCategoryIndex = index;
    secontCategoryId = id;
    page = 1;
    noMoreText = '';
    notifyListeners();
  }

  //增加page方法
  addPage(){
    page ++;
  }

  //改变changeNoMore 数据源
  changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }

  changeFale(){
    isNewCategord = false;
  }
}