
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuotesPageNotifier with ChangeNotifier{

  static Map<String, dynamic> _quotesPageHashMap =
 {"FID_CURRENCY": " ", "FID_NOMINAL": ' ', "FID_CHANGE": 1, "FID_HIGH": ' ', "FID_OPEN": " ", "FID_LOW": " ",
  "FID_PER_CHANGE": " ", "FID_CLOSE": " ", "FID_TURNOVER": " ", "FID_VOLUME": " ", "FID_NO_OF_TRANS": " ",
  "FID_BOARDLOT": " ", "FID_VALUE": " ", "FID_DPS": " ", "FID_PE_RATIO": " ", "FID_PERCENT_YIELD": " ", "FID_EXPECT_PE_RATIO": " ",
  "FID_EXPECT_PERCENT_YIELD": " ", "FID_1M_HIGH": " ", "FID_52W_HIGH": " ", "FID_1M_LOW": " ", "FID_52W_LOW": " ", "FID_RSI14": " ",
  "FID_SMA_10": " ", "FID_MARKET_CAP": " ", "FID_SMA_20": " ", "FID_SHORTSELL": " ", "FID_SMA_50": " "
  };

  void updateQuotesHadshMap({@required String keyName, @required dynamic updatedValue}){
    if(_quotesPageHashMap.containsKey(keyName)){
      _quotesPageHashMap.update(keyName, (value) => updatedValue);
      notifyListeners();
    }
  }

  void quotesPageHashMapUpdate ({@required Map mapData}){
    mapData.forEach((keyName, keyValue){
      if(_quotesPageHashMap.containsKey(keyName)){
        updateQuotesHadshMap(keyName: keyName, updatedValue: keyValue);
      }
    });
  }

  String getBackValueOfQuotesPageHashMap(@required String keyName){
    if(_quotesPageHashMap.containsKey(keyName)){
      return _quotesPageHashMap[keyName].toString();
    } else {
      return "Null";
    }
  }
}

final String etnetBasicMessageChannel = "etnet_MessageChannel";
final String etnetBasicMethodChannel = "etnet_MethodChannel";
final String etnetBasicEventChannel = "etnet_EventChannel";


class QuotesPageModel with ChangeNotifier{
    final MethodChannel _etnetMethodChannel = MethodChannel(etnetBasicMethodChannel);
    final BasicMessageChannel<String> _etnetMessageChannel = BasicMessageChannel<String>(etnetBasicMessageChannel, StringCodec());
    final EventChannel _etnetEventChannel = EventChannel(etnetBasicEventChannel);

  QuotesPageModel(){
    _etnetMethodChannel.setMethodCallHandler(_handleNativeMessage);
  }

    Map<String, dynamic> _quotesPageHashMap = 
 {"FID_CURRENCY": " ", "FID_NOMINAL": " ", "FID_CHANGE": "0", "FID_HIGH": " ", "FID_OPEN": " ", "FID_LOW": " ", 
  "FID_PER_CHANGE": " ", "FID_CLOSE": " ", "FID_TURNOVER": " ", "FID_VOLUME": " ", "FID_NO_OF_TRANS": " ",
  "FID_BOARDLOT": " ", "FID_VALUE": " ", "FID_DPS": " ", "FID_PE_RATIO": " ", "FID_PERCENT_YIELD": " ", "FID_EXPECT_PE_RATIO": " ",
  "FID_EXPECT_PERCENT_YIELD": " ", "FID_1M_HIGH": " ", "FID_52W_HIGH": " ", "FID_1M_LOW": " ", "FID_52W_LOW": " ", "FID_RSI14": " ",
  "FID_SMA_10": " ", "FID_MARKET_CAP": " ", "FID_SMA_20": " ", "FID_SHORTSELL": " ", "FID_SMA_50": " "
  };
    Map get getQuotesHashMap => _quotesPageHashMap;



  Future <void> updateQuotesHadshMap({@required String keyName, @required dynamic updatedValue}) async{
    if(_quotesPageHashMap.containsKey(keyName)){
      await _quotesPageHashMap.update(keyName, (value) => updatedValue);
      notifyListeners();
    }
  }

  String getBackValueOfQuotesPageHashMap(@required String keyName){
    if(_quotesPageHashMap.containsKey(keyName)){
      return _quotesPageHashMap[keyName].toString();
    } else {
      return "Null";
    }
  }

  Future <dynamic> _handleNativeMessage(MethodCall methodCall)async{
    if(methodCall.method == "update_FID_CURRENCY"){
      dynamic tempVar = methodCall.arguments as String;
      updateQuotesHadshMap(keyName: "FID_CURRENCY", updatedValue: tempVar);
    }
  }

}


// Future<dynamic> _getParameterMethodChannel() async{
//   dynamic comingData;
//   try{
//     final dynamic receivedData = await etnet_MethodChannel.invokeMethod('getUpdatedParameters');
//   } on PlatformException catch (e){
//     comingData = e.message;
//   }
//   return comingData;
// }