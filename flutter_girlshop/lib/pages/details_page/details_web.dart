import 'package:flutter/material.dart';
import 'package:flutter_girlshop/model/details_model.dart';
import '../../provide/details_info_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';
import 'package:flutter_html/flutter_html.dart';


//商品详情页和评论切换
class DetailsWeb extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var goodsDetail = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo.goodsDetail;

    return Provide<DetailsInfoProvide>(
      builder: (context,child,wal) {
        var isLeft = Provide
            .value<DetailsInfoProvide>(context)
            .isLeft;

        if (isLeft) {
          return Container(
            child: Html(
                data: goodsDetail
            ),
          );
        } else {
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text('暂时没有评论'),
          );
        }
      }
    );
  }
}



