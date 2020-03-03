import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';
import 'package:flutter/material.dart';
import 'router_handler.dart';


class Routers{
  static String root = '/';
  static String detailsPage = '/detail';

  static void configureRouters(Router router){

    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){

        print('error ::: router 没有找到');

      }
    );
    router.define(detailsPage, handler: detailsHandler);
  }
}