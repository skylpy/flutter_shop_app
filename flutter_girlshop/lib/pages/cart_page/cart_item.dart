import 'package:flutter/material.dart';
import '../../config/index.dart';
import 'package:provide/provide.dart';
import '../../provide/cart_provide.dart';
import '../../model/cart_info_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './cart_count.dart';


//购物车商品列表项
class CartItem extends StatelessWidget{
  final CartInfoModel item;
  CartItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1,color: KColor.defaultBorderColor),
        ),
      ),
      child: Row(
        children: <Widget>[

          _cartCheckBt(context, item),
          _cartImage(item),
          _cartGoodsName(item),
          _cartPrice(context,item),
        ],
      ),
    );
  }

  //多选择按钮
  Widget _cartCheckBt(BuildContext context,CartInfoModel item){
    return Container(
      child: Checkbox(
          value: item.isCheck,
          activeColor: KColor.checkBoxColor,
          onChanged: (bool val){
            item.isCheck = val;
            Provide.value<CartProvide>(context).changeCheckState(item);
          }
      ),
    );
  }

  //商品图片
  Widget _cartImage(CartInfoModel item){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1,color: KColor.defaultBorderColor)
      ),
      child:Image.network(item.images),
    );
  }

  //商品名称
  Widget _cartGoodsName(CartInfoModel item){
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.topLeft,
      child:Column(
        children: <Widget>[
          Text(item.goodsName),
          CartCount(item),
        ],
      ),
    );
  }

  //商品价格
  Widget _cartPrice(BuildContext context,CartInfoModel item){
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child:Column(
        children: <Widget>[
          Text('￥${item.price}',style: TextStyle(color: KColor.presentPriceTextColor),),
          Container(
            child: InkWell(
              onTap: (){
                //删除商品
                Provide.value<CartProvide>(context).deleteOneGoods(item.goodsId);
              },
              child: Icon(
                Icons.delete_forever,
                color: KColor.deleteIconColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
