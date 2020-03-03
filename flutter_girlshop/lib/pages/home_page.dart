import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/index.dart';
import '../service/http_service.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/category_model.dart';
import '../provide/category_provide.dart';
import 'package:provide/provide.dart';
import '../provide/current_index_provide.dart';
import '../routers/application.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  //火爆分区分页
  int page = 1;

  //火爆专区数据
  List<Map> hotGoodsList = [];

  //防止刷新处理 保持当前状态
  @override
  bool get wantKeepAlive => true;

  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    super.initState();
    print('首页刷新了...');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      appBar: AppBar(
        title: Text(KString.homeTitle),
      ),
      body: FutureBuilder(
        future: request('homePageContext', formData: null),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            print(data);

            List<Map> swiperDataList =
                (data['data']['slides'] as List).cast(); //轮播图
            List<Map> navigateList =
                (data['data']['category'] as List).cast(); //分类
            List<Map> recommendList =
                (data['data']['recommend'] as List).cast(); //商品推荐
            List<Map> floor1 = (data['data']['floor1'] as List).cast(); //地步商品推荐
            Map fp1 = data['data']['floor1Pic']; //广告

            return EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerKey,
                bgColor: Colors.white,
                textColor: KColor.refreshTextColor,
                moreInfoColor: KColor.refreshTextColor,
                showMore: true,
                noMoreText: '',
                moreInfo: KString.loading,
                //加载中...
                loadReadyText: KString.loadReadyText,
              ),
              child: ListView(
                children: <Widget>[
                  SwiperDiy(
                    swiperDataList: swiperDataList,
                  ),
                  TopNavigator(
                    navigateList: navigateList,
                  ),
                  RecommendUI(
                    recommendList: recommendList,
                  ),
                  FloorPic(
                    floorPic: fp1,
                  ),
                  Floor(
                    floor: floor1,
                  ),
                  _hotGoods(),
                ],
              ),
              loadMore: () async {
                print('开始加载更多...');
                _getHotGoods();
              },
            );
          } else {
            return Center(
              child: Text('加载中...'),
            );
          }
        },
      ),
    );
  }

  //火爆专区
  void _getHotGoods() {
    var formPage = {'page': page};
    request('getHotGoods', formData: formPage).then((val) {
      var data = json.decode(val.toString());

      List<Map> newGoodsList = (data['data'] as List).cast();
      //设置火爆专区数据列表
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });
    });
  }

  //火爆专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: KColor.defaultBorderColor),
        )),
    //火爆专区
    child: Text(
      KString.hotGoodTitle,
      style: TextStyle(color: KColor.homeSubTitleTextColor),
    ),
  );

  //火爆专区子项
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val['image'],
                  width: ScreenUtil().setWidth(375),
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '¥${val['presentPrice']}',
                      style: TextStyle(color: KColor.presentPriceTextColor),
                    ),
                    Text(
                      '¥${val['oriPrice']}',
                      style: TextStyle(color: KColor.oriPriceTextColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }

  //火爆专区组合
  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[hotTitle, _wrapList()],
      ),
    );
  }
}

//首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Application.router.navigateTo(
                    context, "/detail?id=${swiperDataList[index]['goodsId']}");
              },
              child: Image.network(
                "${swiperDataList[index]['image']}",
                fit: BoxFit.cover,
              ));
        },
        //图片数量
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//首页分类导航组件编写
class TopNavigator extends StatelessWidget {
  final List navigateList;

  TopNavigator({Key key, this.navigateList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item, index) {
    return InkWell(
      onTap: () {
        //跳转到分类页面
        _goCategory(context,index,item['firstCategordId']);
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['firstCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigateList.length > 10) {
      navigateList.removeRange(10, navigateList.length);
    }

    var tempIndex = -1;

    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5.0),
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        //禁止滚动
        physics: NeverScrollableScrollPhysics(),
        children: navigateList.map((item) {
          tempIndex++;
          return _gridViewItemUI(context, item, tempIndex);
        }).toList(),
      ),
    );
  }

  void _goCategory(context,int index,String categoryId) async{
    await request('getCategory',formData: null).then((val){
      var data = json.decode(val.toString());
      CategoryModel categoryModel = CategoryModel.fromJson(data);
      List list = categoryModel.data;
      Provide.value<CategoryProvide>(context).changeFirstCategory(categoryId, index);
      Provide.value<CategoryProvide>(context).getSecondCategory(list[index].secondCategoryVO, categoryId);
      Provide.value<CurrentIndexProvide>(context).changeIndex(1);

    });
  }
}

//商品推荐
class RecommendUI extends StatelessWidget {
  final List recommendList;

  RecommendUI({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), _recommendList(context)],
      ),
    );
  }

  //推荐商品标题
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(width: 0.5, color: KColor.defaultBorderColor)),
      ),
      child: Text(
        KString.recommentText, //'商品推荐'
        style: TextStyle(color: KColor.homeSubTitleTextColor),
      ),
    );
  }

  //推荐商品列表
  Widget _recommendList(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(280),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _item(index, context);
          }),
    );
  }

  Widget _item(index, context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(280),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: KColor.defaultBorderColor),
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Image.network(
              recommendList[index]['image'],
              fit: BoxFit.contain,
            )),
            Text(
              '¥${recommendList[index]['presentPrice']}',
              style: TextStyle(
                color: KColor.presentPriceTextColor,
              ),
            ),
            Text(
              '¥${recommendList[index]['oriPrice']}',
              style: KFont.oriPriceStyle,
            )
          ],
        ),
      ),
    );
  }
}

//广告位
class FloorPic extends StatelessWidget {
  final Map floorPic;

  FloorPic({Key key, this.floorPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: InkWell(
        child: Image.network(
          floorPic['PICTURE_ADDRESS'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

//商品推荐下层
class Floor extends StatelessWidget {
  List<Map> floor;

  Floor({Key key, this.floor}) : super(key: key);

  void jumpDetail(context, String goodId) {
    //跳转到商品详情
  }

  @override
  Widget build(BuildContext context) {
    double width = ScreenUtil.getInstance().width;
    return Container(
      child: Row(
        children: <Widget>[
          //左侧商品
          Expanded(
            child: Column(
              children: <Widget>[
                //左上角大图
                Container(
                  padding: EdgeInsets.only(top: 4.0),
                  height: ScreenUtil().setHeight(400),
                  child: InkWell(
                    child: Image.network(
                      floor[0]['image'],
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      jumpDetail(context, floor[0]['goodsId']);
                    },
                  ),
                ),
                //左下角图
                Container(
                  padding: EdgeInsets.only(top: 1.0, right: 1.0),
                  height: ScreenUtil().setHeight(200),
                  child: InkWell(
                    child: Image.network(
                      floor[1]['image'],
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      jumpDetail(context, floor[1]['goodsId']);
                    },
                  ),
                )
              ],
            ),
          ),
          //右侧商品
          Expanded(
            child: Column(
              children: <Widget>[
                //右上图
                Container(
                  padding: EdgeInsets.only(top: 4.0, left: 1.0, bottom: 1.0),
                  height: ScreenUtil().setHeight(200),
                  child: InkWell(
                    child: Image.network(
                      floor[2]['image'],
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      jumpDetail(context, floor[2]['goodsId']);
                    },
                  ),
                ),
                //右中图
                Container(
                  padding: EdgeInsets.only(top: 1.0, left: 1.0),
                  height: ScreenUtil().setHeight(200),
                  child: InkWell(
                    child: Image.network(
                      floor[3]['image'],
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      jumpDetail(context, floor[3]['goodsId']);
                    },
                  ),
                ),
                //右下图
                Container(
                  padding: EdgeInsets.only(top: 1.0, left: 1.0),
                  height: ScreenUtil().setHeight(200),
                  child: InkWell(
                    child: Image.network(
                      floor[4]['image'],
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      jumpDetail(context, floor[4]['goodsId']);
                    },
                  ),
                )
              ],
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
