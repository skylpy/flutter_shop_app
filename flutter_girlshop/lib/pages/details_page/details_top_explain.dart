import 'package:flutter/material.dart';
import 'package:flutter_girlshop/model/details_model.dart';
import '../../provide/details_info_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';


//商品详情页的说明
class DetailsExplain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top:10.0),
      width: ScreenUtil().setWidth(750),
      child: Text(
        KString.detailsPageExplain,
        style: TextStyle(
          color: Colors.red,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),

    );
  }
}

