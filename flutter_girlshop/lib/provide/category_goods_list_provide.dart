import 'package:flutter/material.dart';
import '../model/category_good_list_model.dart';

//分类商品列表数据
class CategoryGoodsListProvide with ChangeNotifier{

    List<CategoryListData> goodList = [];

    getGoodsList(List<CategoryListData> list){
        goodList = list;
        notifyListeners();
    }

    addGoodsList(List<CategoryListData> list){
        goodList.addAll(list) ;
        notifyListeners();
    }
}