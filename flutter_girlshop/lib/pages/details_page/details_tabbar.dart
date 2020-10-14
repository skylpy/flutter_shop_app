import 'package:flutter/material.dart';
import 'package:flutter_girlshop/model/details_model.dart';
import '../../provide/details_info_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';


//商品详情页和评论切换
class DetailsTaBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provide<DetailsInfoProvide>(
      builder: (context,child,wal){
        var isLeft = Provide.value<DetailsInfoProvide>(context).isLeft;
        var isRight = Provide.value<DetailsInfoProvide>(context).isRight;

        return Container(
          margin:  EdgeInsets.only(top: 15.0),
          child: Row(
            children: <Widget>[
              _myTaBarLeft(context, isLeft),
              _myTaBarRight(context, isRight),
            ],
          ),
        );
      },
    );
  }

  Widget _myTaBarLeft(BuildContext context,bool isLeft){

    return InkWell(
      onTap: (){
        Provide.value<DetailsInfoProvide>(context).changeLeftAndRight('left');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment:  Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: isLeft ? KColor.detailTextColor : KColor.defaultBorderColor,
            )
          )
        ),
        child: Text(
          '详情',
          style: TextStyle(
            color: isLeft ? KColor.detailTextColor : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _myTaBarRight(BuildContext context,bool isRight){

    return InkWell(
      onTap: (){
        Provide.value<DetailsInfoProvide>(context).changeLeftAndRight('right');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment:  Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: isRight ? KColor.detailTextColor : KColor.defaultBorderColor,
                )
            )
        ),
        child: Text(
          '评论',
          style: TextStyle(
            color: isRight ? KColor.detailTextColor : Colors.black,
          ),
        ),
      ),
    );
  }

}



