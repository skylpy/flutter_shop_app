
class CategoryGoodListModel {

  String code;
  String message;
  List<CategoryListData> data;

  CategoryGoodListModel({this.code,this.message,this.data});

  CategoryGoodListModel.fromJson(Map<String,dynamic> json){

    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = new List<CategoryListData>();
      json['data'].forEach((v){
        data.add(new CategoryListData.fromJson(v));

      });
    }
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if(this.data != null){
      data['data'] = this.data.map((v)=>v.toJson()).toList();
    }

    return data;
  }

}


class CategoryListData {

  String image;
  String name;
  double presentPrice;
  double oriPrice;
  String goodsId;

  CategoryListData({this.image,this.name,this.presentPrice,this.oriPrice,this.goodsId});

  CategoryListData.fromJson(Map<String,dynamic> json){

    image = json['image'];
    name = json['name'];
    presentPrice = json['presentPrice'];
    oriPrice = json['oriPrice'];
    goodsId = json['goodsId'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['presentPrice'] = this.presentPrice;
    data['oriPrice'] = this.oriPrice;
    data['goodsId'] = this.goodsId;

    return data;
  }

}