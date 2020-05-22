import 'package:flutter/material.dart';
import 'package:flutter_girlshop/config/color.dart';
import 'package:flutter_girlshop/config/index.dart';
import '../../provide/details_info_provide.dart';
import '../../provide/current_index_provide.dart';
import '../../provide/cart_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBottom extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var goodsInfo = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;

    var goodsID = goodsInfo.goodsId;
    var goodsname = goodsInfo.goodsName;
    var count = 1;
    var price = goodsInfo.presentPrice;
    var images = goodsInfo.image1;

    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: ScreenUtil().setHeight(80),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                onTap: (){
                  //跳转到购物车页面
                  Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                  Navigator.pop(context);
                },
                child: Container(
                  width: ScreenUtil().setWidth(110),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                    size: 35,
                  ),
                ),
              ),
              //TODO 购物商品数量
              Provide<CartProvide>(
                builder: (context,child,val){
                  int goodsCount = Provide.value<CartProvide>(context).allGoodsCount;
                  return Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                      decoration: BoxDecoration(
                        color: KColor.primaryColor,
                        border: Border.all(width: 2,color: Colors.white),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        '${goodsCount}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(22),
                        ),
                      ),
                    ),
                  );
                },
              ),

            ],
          ),

          InkWell(
            onTap: () async{
              // TODO 添加至购物车
              await Provide.value<CartProvide>(context).save(goodsID, goodsname, count, price, images);
            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              color: Colors.green,
              child: Text(
                KString.addToCartText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(28),
                ),
              ),
            ),
          ),

          InkWell(
            onTap: (){
              // TODO 马上购买

            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              color: KColor.primaryColor,
              child: Text(
                KString.buyGoodsText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(28),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}