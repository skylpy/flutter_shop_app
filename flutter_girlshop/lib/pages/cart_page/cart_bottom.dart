import 'package:flutter/material.dart';
import '../../config/index.dart';
import 'package:provide/provide.dart';
import '../../provide/cart_provide.dart';
import '../../model/cart_info_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


//购物车底部
class CartBottom extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      child: Provide<CartProvide>(
        builder: (context,child,cartProvide){
          return Row(
              children: <Widget>[
                selectAllBtn(context),
                allPriceArea(context),
                goButton(context)
              ],

          );
        },
      ),
    );
  }

  //全选按钮
  Widget selectAllBtn(BuildContext context){

    bool isAllCheck = Provide.value<CartProvide>(context).isAllCheck;

    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
              value: isAllCheck,
              activeColor: KColor.checkBoxColor,
              onChanged: (bool val){
                Provide.value<CartProvide>(context).changeAllCheckBtnState(val);
              }
          ),
          Text(KString.allCheck)
        ],
      ),
    );
  }

  //合计价格区域
  Widget allPriceArea(BuildContext context){

    double allPrice = Provide.value<CartProvide>(context).allPrice;
    String allPriceStr = allPrice.toStringAsFixed(2);

    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(200),
                child: Text(
                  KString.allPriceTitle,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(200),
                child: Text(
                  '￥${allPriceStr}',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: KColor.presentPriceTextColor
                  ),
                ),
              )
            ],
          ),

          Container(
            alignment: Alignment.centerRight,
            width: ScreenUtil().setWidth(430),
            child: Text(
              KString.allPriceAdvTitle,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(22),
                  color: Colors.black38
              ),
            ),
          )

        ],
      ),
    );
  }

  //结算按钮
  Widget goButton(BuildContext context){

    int allGoodsCount = Provide.value<CartProvide>(context).allGoodsCount;

    return Container(
        width: ScreenUtil().setWidth(160),
        padding: EdgeInsets.only(left: 10),

         child: InkWell(
           onTap: (){
              //TODO 结算处理
           },
           child: Container(
             padding: EdgeInsets.all(10.0),
             alignment: Alignment.center,
             decoration: BoxDecoration(
               color: KColor.primaryColor,
               borderRadius: BorderRadius.circular(3.0),
             ),
             child: Text(
               '结算(${allGoodsCount})',
               style: TextStyle(
                 color: Colors.white,
               ),

             ),
           ),
         )
    );
  }
}