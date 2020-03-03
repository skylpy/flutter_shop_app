import 'package:flutter/material.dart';
import '../model/details_model.dart';
import '../service/http_service.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;

  getGoodsInfo(String id) async {
    var formData = {'goodId': id};

    await request('getGoodDetail', formData: formData).then((val) {
      var responseData = json.decode(val.toString());
      goodsInfo = DetailsModel.fromJson(responseData);
      print('getGoodDetail:::' + responseData.toString());
      notifyListeners();
    });
  }
}
