

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_library/platformDetection/forAOS.dart';
import 'package:flutter_library/quotesPage_withJava/stockDetailWidget.dart';
import 'package:flutter_library/quotesPage_withJava/stockPriceWidget.dart';

// ignore: must_be_immutable
class QuotePage extends StatefulWidget {
  final Function toggleTheme;
  final Function handleUpdate;
  final Function savePreferences;
  final bool darkEnabled;
  final String themeMode;
  final Function switchOLED;
  final bool darkOLED;

  QuotePage(
      {
      // TODO: Theme
      this.toggleTheme,
      this.savePreferences,
      this.handleUpdate,
      this.darkEnabled,
      this.themeMode,
      this.switchOLED,
      this.darkOLED,
      Key key})
      : super(key: key);
  @override
  QuotePageState createState() => new QuotePageState();
}


class QuotePageState extends State<QuotePage> {
  String _quotesPageMap;

  static const MethodChannel  ETNet_methodChannel = MethodChannel('ETNET/platformView');

  static const MethodChannel _methodChannel = MethodChannel('samples.flutter.io/platform_view');
  static const EventChannel _eventChannel = EventChannel('samples.flutter.io/quotesPageEvent');

  Map quotesPageMap =  {"FID_CURRENCY": " ", "FID_NOMINAL": " ", "FID_CHANGE": 1, "FID_HIGH": " ", "FID_OPEN": " ", "FID_LOW": " ",
    "FID_PER_CHANGE": " ", "FID_CLOSE": " ", "FID_TURNOVER": " ", "FID_VOLUME": " ", "FID_NO_OF_TRANS": " ",
    "FID_BOARDLOT": " ", "FID_VALUE": " ", "FID_DPS": " ", "FID_PE_RATIO": " ", "FID_PERCENT_YIELD": " ", "FID_EXPECT_PE_RATIO": " ",
    "FID_EXPECT_PERCENT_YIELD": " ", "FID_1M_HIGH": " ", "FID_52W_HIGH": " ", "FID_1M_LOW": " ", "FID_52W_LOW": " ", "FID_RSI14": " ",
    "FID_SMA_10": " ", "FID_MARKET_CAP": " ", "FID_SMA_20": " ", "FID_SHORTSELL": " ", "FID_SMA_50":  " "
  };
  // todo: swift to nativePlatform & pass a data
  Future<void> _launchPlatformQuotesPage() async{
    final Map platformCounter = await _methodChannel.invokeMapMethod('switchView', quotesPageMap);
    if(platformCounter != null){
      quotesPageNotifier.quotesPageHashMapUpdate(mapData: platformCounter);}
    setState(() {
      quotesPageMap = platformCounter;
    });
  }


  String quotesPageCurrency = " ";
  void receuveBroadCastStreamNotification(){}

  void _onDataEvent(Object event){
    setState(() {
      quotesPageCurrency = event == 'HK' ? "HK" : "UK";
    });
  }

  void _onError(Object error){
    setState(() {
      PlatformException platformException = error;
      quotesPageCurrency = platformException ?.message ?? "Status: Unknown.";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eventChannel.receiveBroadcastStream().listen(_onDataEvent, onError: _onError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text("${_counter.toString()}"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
            _launchPlatformQuotesPage();
          }),
        ],
      ),
      body: new ListView(
        scrollDirection: Axis.vertical, //TODO: Default Vertical
        children: <Widget>[
          StockPriceWidget(
            key: UniqueKey(),
          ),
          StockDetailWidget(),
        ],
      ),
    );
  }
}


