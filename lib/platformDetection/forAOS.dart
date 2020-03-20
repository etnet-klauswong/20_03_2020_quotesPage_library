


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_library/quotesPage_withJava/parameters.dart';
import 'package:flutter_library/quotesPage_withJava/quotesPage_hardCode.dart';
import 'package:provider/provider.dart';
final quotesPageNotifier = QuotesPageNotifier();
Widget widgetRoute(String route) {
  switch (route) {

    case "quotesPageCommunicationWidget":

      return MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(12, 24, 34, 1),
        ),
        home: SafeArea(
            child: ChangeNotifierProvider.value(
                value: quotesPageNotifier,
            child: QuotePage())),
      );
    default:
      return MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(12, 24, 34, 1),
        ),
        home: SafeArea(
            child: ChangeNotifierProvider.value(
                value: quotesPageNotifier,
                child: QuotePage())),
      );
  }
}

String getRoutePageName(String route) {
  String routePageName = route;
  debugPrint("\nPrint the whole routing data\n");
  debugPrint(route);
  if (route.indexOf("?") != -1)
    // Take the String before the ? of the route -> Behind the ? there are routing parameter
    routePageName = route.substring(0, route.indexOf("?"));
  print("RoutePageName:" + routePageName);
  return routePageName;
}

String parsingNativeParams(String route) {
  Map<String, dynamic> nativeParams = {};
  if (route.indexOf("?") != -1) {
    nativeParams = json.decode(route.substring(route.indexOf("?") + 1));
    debugPrint(
        "\n\n\nCheck stockParams \n\n${nativeParams["stockParams"]}\n\n\n");
//    debugPrint("\n\n\nCheck stockDetailParams \n\n${nativeParams["stockDetail"]}\n\n\n");
    // TODO: nativeParams['stockPrice']['fieldName']
  }
  return nativeParams['stockParams'] ?? "{}";
}

String parsingSpaceParams(String stockPrice) {
  debugPrint("Check $stockPrice \n\n\n");
  String parsingSpaceParams;
  // ignore: unrelated_type_equality_checks
  if (stockPrice.indexOf(":") == true) {
    parsingSpaceParams =
        json.decode(stockPrice.substring(stockPrice.indexOf(":") + 1));
    parsingSpaceParams = parsingSpaceParams.toString();
    debugPrint("Check parsingSpaceParams \n\n\n");
    // TODO: nativeParams['stockPrice']['fieldName']
  }
  return parsingSpaceParams;
}