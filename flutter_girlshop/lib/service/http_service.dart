import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/index.dart';


Future request(url,{formData})async{

  try{

    Response response ;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse('application/x-www-from-urlencoded');
    if(formData == null){
      response = await dio.post(servicePath[url]);

    }else{
      response = await dio.post(servicePath[url],data: formData);
    }

    if(response.statusCode == 200){

      return response;
    }else{
      throw Exception('后端借口异常，请检查测试代码和服务器数据...');
    }


  }catch(e){
    return print('(error:::${e}');
  }
}
