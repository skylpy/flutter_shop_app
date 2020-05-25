import 'package:flutter/material.dart';
import '../config/index.dart';
import 'package:provide/provide.dart';
import '../provide/cart_provide.dart';
import './cart_page/cart_item.dart';
import './cart_page/cart_bottom.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //    SafeArea
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.cartPageText), //商品详情
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot) {
          List cartList = Provide.value<CartProvide>(context).cartList;
          if (snapshot.hasData && cartList != null) {
            return Stack(
              children: <Widget>[
                Provide<CartProvide>(
                  builder: (context, child, cartProvide) {
                    cartList = Provide.value<CartProvide>(context).cartList;

                    return ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          var item = cartList[index];
//                          return Text('${item.goodsName}');
                          return CartItem(cartList[index]);
                        }
                    );
                  },
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: CartBottom()
                )
              ],
            );
          } else {
            return Text(KString.loading);
          }
        },
      ),
    );
  }

  Future _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();

    return '完成加载';
  }
}
