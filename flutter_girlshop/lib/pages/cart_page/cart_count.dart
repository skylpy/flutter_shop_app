import 'package:flutter/material.dart';
import '../../config/index.dart';
import 'package:provide/provide.dart';
import '../../provide/cart_provide.dart';
import '../../model/cart_info_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartCount extends StatelessWidget{

  final CartInfoModel item;

  CartCount(this.item);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: KColor.defaultBorderColor),
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(context),

          _countBtn(context),
          _addBtn(context),
        ],
      ),
    );
  }

  //减少按钮
  Widget _reduceBtn(BuildContext context){
    
    return InkWell(
      onTap: (){
        Provide.value<CartProvide>(context).addOrReduceActionOneGoods(item, 'reduce');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: item.count > 1 ? Colors.white : KColor.defaultBorderColor,
          border: Border(
            right: BorderSide(width: 1,color: KColor.defaultBorderColor)
          )
        ),
        child: item.count > 1 ?Text("-"):Text(''),
      ),
    );
  }

  //增加按钮
  Widget _addBtn(BuildContext context){

    return InkWell(
      onTap: (){
        Provide.value<CartProvide>(context).addOrReduceActionOneGoods(item, 'add');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white ,
            border: Border(
                left: BorderSide(width: 1,color: KColor.defaultBorderColor)
            )
        ),
        child: Text('+'),
      ),
    );
  }

  //显示数量
  Widget _countBtn(BuildContext context){

    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('${item.count}'),
    );
  }
  
}