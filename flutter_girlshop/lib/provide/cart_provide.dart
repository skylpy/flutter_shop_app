import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/cart_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//购物车Provide
class CartProvide with ChangeNotifier{


    String cartString = '[]';
    List <CartInfoModel> cartList = [];//商品列表对象
    double allPrice = 0;//总价格
    int allGoodsCount = 0;//商品总数
    bool isAllCheck = true;//是否全选

    save(goodsId,goodsName,count,price,images) async{

        //初始化SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        cartString = prefs.getString('cartInfo');//获取持久化储存的值
        var temp = cartString == null ? []:json.decode(cartString.toString());

        //把获取到的值转变为List
        List<Map> tempList = (temp as List).cast();
        //声明变量，用于判断购物车中时候已经存在这商品
        var isHave = false;//默认为没有
        int ival = 0;//用于进行循环的索引使用
        allPrice = 0;
        allGoodsCount = 0;//吧商品总数设置为0

        //
        tempList.forEach((item){

            if (item['goodsId'] == goodsId){
                tempList[ival]['count'] = item['count'] + 1;
                cartList[ival].count ++;
                isHave = true;
            }

            if (item['isCheck']){
                //算出总价
                allPrice += (cartList[ival].price*cartList[ival].count);
                //算出总得商品数量
                allGoodsCount += cartList[ival].count;
            }
            ival ++;
        });

        if (!isHave){
            Map<String,dynamic> newGoods = {

                'goodsId':goodsId,
                'goodsName':goodsName,
                'count':count,
                'price':price,
                'images':images,
                'isCheck':true
            };
            tempList.add(newGoods);
            cartList.add(new CartInfoModel.fromJson(newGoods));
            allPrice += (count*price);
            allGoodsCount += count ;
        }

        cartString = json.encode(tempList).toString();

        prefs.setString('cartInfo', cartString);
        notifyListeners();
    }

    //得到购物车种的商品
    getCartInfo() async{
        //初始化SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        cartString = prefs.getString('cartInfo');//获取持久化储存的值
        //吧cartList 进行初始化，防止数据混乱
        cartList = [];
        if(cartString == null){
            cartList = [];
        }else{
            List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
            allPrice = 0;
            allGoodsCount = 0;//吧商品总数设置为0
            isAllCheck = true;
            tempList.forEach((item){

                //是否为全选判断
                if (item['isCheck']){
                    //算出总价
                    allPrice += (item['price']*item['count']);
                    //算出总得商品数量
                    allGoodsCount += item['count'];
                }else{
                    isAllCheck = false;
                }

                cartList.add(new CartInfoModel.fromJson(item));

            });
        }
        notifyListeners();
    }


    changeCheckState(CartInfoModel cartItem) async{

        //初始化SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        cartString = prefs.getString('cartInfo');//获取持久化储存的值
        List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

        int tempIndex = 0;
        int changeIndex = 0;
        tempList.forEach((item){

            if(item['goodsId'] == cartItem.goodsId){
                changeIndex = tempIndex;
            }
            tempIndex++;

        });
        tempList[changeIndex] = cartItem.toJson();
        cartString = json.encode(tempList).toString();
        prefs.setString('cartInfo', cartString);
        await getCartInfo();
        notifyListeners();
    }

    //删除单个购物车商品
    deleteOneGoods(String goodsId) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      cartString = prefs.getString('cartInfo'); //获取持久化存储的值
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

      int tempIndex = 0;
      int delIndex = 0;
      tempList.forEach((item){
        if(item['goodsId'] == goodsId){
          delIndex = tempIndex;
        }
        tempIndex++;

      });
      tempList.removeAt(delIndex);
      cartString = json.encode(tempList).toString();
      prefs.setString('cartInfo', cartString);
      await getCartInfo();
    }


    //增加减少数量操作
    addOrReduceActionOneGoods(CartInfoModel cartItem,String todo) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      cartString = prefs.getString('cartInfo'); //获取持久化存储的值
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

      int tempIndex = 0;
      int changeIndex = 0;
      tempList.forEach((item){
        if(item['goodsId'] == cartItem.goodsId){
          changeIndex = tempIndex;
        }
        tempIndex++;

      });

      if (todo == 'add'){
        cartItem.count ++;
      }else if(cartItem.count > 1){
        cartItem.count --;
      }

      tempList[changeIndex] = cartItem.toJson();
      cartString = json.encode(tempList).toString();
      prefs.setString('cartInfo', cartString);
      await getCartInfo();
    }


    //全选状态处理
    changeAllCheckBtnState(bool isCheck) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      cartString = prefs.getString('cartInfo'); //获取持久化存储的值
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      List<Map> newList = [];

      for (var item in tempList){
        var newItem = item;
        newItem['isCheck'] = isCheck;
        newList.add(newItem);
      }


      cartString = json.encode(newList).toString();
      prefs.setString('cartInfo', cartString);
      await getCartInfo();
    }

}