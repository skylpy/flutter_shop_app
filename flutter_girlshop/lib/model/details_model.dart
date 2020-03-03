
class DetailsModel {

  String code;
  String message;
  DetailsGoodsData data;

  DetailsModel({this.code,this.message,this.data});

  DetailsModel.fromJson(Map<String,dynamic> json){

    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new DetailsGoodsData.fromJson(json['data']) : null;
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if(this.data != null){
      data['data'] = this.data.toJson();
    }

    return data;
  }

}


class DetailsGoodsData {

  GoodInfo goodInfo;

  DetailsGoodsData({this.goodInfo});

  DetailsGoodsData.fromJson(Map<String,dynamic> json){

    goodInfo = json['goodInfo'] != null ? new GoodInfo.fromJson(json['goodInfo']):null;

  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    if(this.goodInfo != null){
      data['goodInfo'] = this.goodInfo.toJson();
    }

    return data;
  }

}

class GoodInfo {

  int amount;
  String goodsId;
  String image1;
  String goodsSerialNumber;
  double oriPrice;
  double presentPrice;
  String shopId;
  String goodsName;
  String goodsDetail;

  GoodInfo({this.amount,
    this.goodsId,
    this.image1,
    this.goodsSerialNumber,
    this.oriPrice,
    this.presentPrice,
    this.shopId,
    this.goodsName,
    this.goodsDetail
  });

  GoodInfo.fromJson(Map<String,dynamic> json){

    goodsId = json['goodsId'];
    image1 = json['image1'];
    goodsSerialNumber = json['goodsSerialNumber'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    shopId = json['shopId'];
    goodsName = json['goodsName'];
    goodsDetail = json['goodsDetail'];

  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['goodsId'] = this.goodsId;
    data['image1'] = this.image1;
    data['goodsSerialNumber'] = this.goodsSerialNumber;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['shopId'] = this.shopId;
    data['goodsName'] = this.goodsName;
    data['goodsDetail'] = this.goodsDetail;

    return data;

  }

}