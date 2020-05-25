
import 'package:flutter/material.dart';
import '../config/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PersonPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text(KString.personTitle),
      ),
      body: ListView(
        children: <Widget>[
          _topHeader(),
          _orderTitle(),
          _orderType(),
          _actionList()
        ],
      ),

    );
  }

  //头像区域
  Widget _topHeader(){
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20),
      color: KColor.primaryColor,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/image/girl.jpeg',fit: BoxFit.cover,),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'skylpy',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Colors.white
              ),
            )
          )
        ],
      ),
    );
  }

  //我的订单标题
  Widget _orderTitle(){
    return Container(

        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1,color: KColor.defaultBorderColor)
          )
        ),
        child: ListTile(
          leading: Icon(Icons.list),
          title: Text(KString.orderTitle),
          trailing: Icon(Icons.arrow_right),
        )
    );
  }

  //订单类型
  Widget _orderType(){
    return Container(

        margin: EdgeInsets.only(top: 5),
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(150),
        padding: EdgeInsets.only(top: 20),
        color: Colors.white,

        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.payment,
                    size: 30,
                  ),
                  Text(KString.pendingPayText)

                ],
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.directions_car,
                    size: 30,
                  ),
                  Text(KString.toBeSend)

                ],
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.directions_run,
                    size: 30,
                  ),
                  Text(KString.toBeReceived)

                ],
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.message,
                    size: 30,
                  ),
                  Text(KString.evaluateText)

                ],
              ),
            ),
          ],
        )
    );
  }

  //列表标题
  Widget _myListTitle(String title){
    return Container(

        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 1,color: KColor.defaultBorderColor)
            )
        ),
        child: ListTile(
          leading: Icon(Icons.blur_circular),
          title: Text(title),
          trailing: Icon(Icons.arrow_right),
        )
    );
  }

  //点击列表
  Widget _actionList(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTitle('领取优惠券'),
          _myListTitle('已领取优惠券'),
          _myListTitle('地址管理'),
          _myListTitle('客服电话'),
          _myListTitle('关于我们')
        ],
      ),
    );
  }

}

