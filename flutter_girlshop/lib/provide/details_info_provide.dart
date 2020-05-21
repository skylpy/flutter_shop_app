import 'package:flutter/material.dart';
import '../model/details_model.dart';
import '../service/http_service.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;

  bool isLeft = true;
  bool isRight = false;

  getGoodsInfo(String id) async {
    var formData = {'goodId':id};

    print('---------------------------- ${formData}');

    await request('getGoodDetail', formData: formData).then((val) {
      var responseData = json.decode(val.toString());
      goodsInfo = DetailsModel.fromJson(responseData);
      print('getGoodDetail:::' + responseData.toString());
      notifyListeners();
    });
  }

  //改变tabar的状态
  changeLeftAndRight(String changState){

    if(changState == 'left'){
      isLeft = true;
      isRight = false;
    }else{
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}
