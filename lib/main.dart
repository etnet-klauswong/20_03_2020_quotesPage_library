
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_library/platformDetection/forAOS.dart';
import 'package:flutter_library/platformDetection/forIOS.dart';
import 'package:streams_channel/streams_channel.dart';

final StreamsChannel streamsChannel = new StreamsChannel("QuotesPageCommunication");
final ETNet_methodChannel = const MethodChannel("EtNet_methodChannel");

void main() {
  if (Platform.isIOS) {
    kReloadChannel.setMessageHandler(run);
    run(window.defaultRouteName);
  } else if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
//    ETNet_methodChannel.setMethodCallHandler(_handlePlatformHashMapData);
    runApp(widgetRoute(window.defaultRouteName));
  }
}

//Future<dynamic> _handlePlatformHashMapData(MethodCall methodCall) async {
//  switch (methodCall.method){
//    case "nativeSendData":
//      dynamic receivedResult = await methodCall.arguments;
//      if(receivedResult != null){
//        debugPrint("This is the receivedData Output: " + receivedResult.toString());
//        log("This is the receivedData Output: " + receivedResult.toString());
//      }
//      break;
//    default:
//      throw MissingPluginException();
//  }
//}



