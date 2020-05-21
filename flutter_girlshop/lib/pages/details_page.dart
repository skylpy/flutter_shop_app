import 'package:flutter/material.dart';
import 'package:flutter_girlshop/config/index.dart';
import '../config/index.dart';
import '../service/http_service.dart';
import 'dart:convert';
import 'package:provide/provide.dart';
import '../provide/details_info_provide.dart';
import './details_page/details_top_area.dart';
import './details_page/details_top_explain.dart';
import './details_page/details_tabbar.dart';
import './details_page/details_web.dart';
import './details_page/details_bottom.dart';


class DetailsPage extends StatelessWidget{

  //商品ID
  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //    SafeArea
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            print('返回上一页');
            Navigator.pop(context);
          },

        ),
        title: Text(KString.detailsPageTitle),//商品详情

      ),
      body: FutureBuilder(
        future: _getGoodsInfo(context),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    DetailsTopArea(),
                    DetailsExplain(),
                    DetailsTaBar(),
                    DetailsWeb()

                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: DetailBottom(),
                ),
              ],
            );
          }else{
            return Text('加载中...');
          }
        },
      ),
    );
  }

  Future _getGoodsInfo(BuildContext context) async{

    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);

    return '完成加载';
  }
}

