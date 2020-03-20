import 'package:flutter/material.dart';
import 'package:flutter_library/quotesPage_withJava/parameters.dart';
import 'package:flutter_library/quotesPage_withJava/quotesPage_hardCode.dart';
import 'package:provider/provider.dart';

final backgroundColors = Color.fromRGBO(12, 24, 34, 0.85);

class StockDetailWidget extends StatefulWidget {
  @override
  _StockDetailWidget createState() => _StockDetailWidget();
}

class _StockDetailWidget extends State<StockDetailWidget> {
  Widget _build(
      Color color, String key1, String value1, String key2, String value2) {
    return Column(
      children: <Widget>[
        Container(
          color: color,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: buildKeyValueItem(key1, value1),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: buildKeyValueItem(key2, value2),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildKeyValueItem(String title, String value) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(66, 118, 155, 1),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.lime,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionTile(
      title: Text(
        "Stock Detail",
      ),
      backgroundColor: backgroundColors,
      initiallyExpanded: false,
      children: <Widget>[
        Container(
//          height: MediaQuery.of(context).size.height/2,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[
                    // quotespageMODEL.getBackValueOfQuotesPageHashMap("FID_VOLUME")
                    Consumer<QuotesPageNotifier>(
                      builder: (context, quotesPageNotifier, child){
                        return _build(Color.fromRGBO(27, 36, 45, 1), "成交金額",
                            quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_TURNOVER"),
                           "成交股數", quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_VOLUME"));
                      }
                    ),
                    Consumer<QuotesPageNotifier>(
                      builder: (context, quotesPageNotifier, child){
                        return _build(Color.fromRGBO(19, 29, 35, 1), "交易宗數",
                            quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_NO_OF_TRANS"),
                           "每手股數", quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_BOARDLOT"));
                      }
                    ),
                    Consumer<QuotesPageNotifier>(
                      builder: (context, quotesPageNotifier, child){
                        return _build(Color.fromRGBO(27, 36, 45, 1), "帳面淨值",
                            quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_VALUE"),
                           "每股派息", quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_DPS"));
                      }
                    ),
                    Consumer<QuotesPageNotifier>(
                      builder: (context, quotesPageNotifier, child){
                        return _build(Color.fromRGBO(19, 29, 35, 1), "市盈率",
                            quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_PE_RATIO"),
                          "周息率", quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_PERCENT_YIELD"));
                      }
                    ),
                    Consumer<QuotesPageNotifier>(
                      builder: (context, quotesPageNotifier, child){
                        return _build(Color.fromRGBO(27, 36, 45, 1), "預測市盈",
                            quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_EXPECT_PE_RATIO"),
                           "預測周息", quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_EXPECT_PERCENT_YIELD"));
                      }
                    ),
                    Consumer<QuotesPageNotifier>(
                      builder: (context, quotesPageNotifier, child){
                        return _build(Color.fromRGBO(19, 29, 35, 1), "1個月高",
                            quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_1M_HIGH"),
                           "52周高", quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_52W_LOW"));
                      }
                    ),
                    Consumer<QuotesPageNotifier>(
                      builder: (context, quotesPageNotifier, child){
                        return _build(Color.fromRGBO(27, 36, 45, 1), "1個月低",
                            quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_1M_LOW"),
                           "52周低", quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_52W_LOW"));
                      }
                    ),

                    Consumer<QuotesPageNotifier>(
                      builder: (context, quotesPageNotifier, child){
                        return _build(Color.fromRGBO(19, 29, 35, 1), "14天RSI",
                            quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_RSI14"),
                           "10天平均", quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_SMA_10"));
                      }
                    ),
                    Consumer<QuotesPageNotifier>(
                      builder: (context, quotesPageNotifier, child){
                        return _build(Color.fromRGBO(27, 36, 45, 1), "市值",
                            quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_MARKET_CAP"),
                           "20天平均", quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_SMA_20"));
                      }
                    ),
                    Consumer<QuotesPageNotifier>(
                      builder: (context, quotesPageNotifier, child){
                        return _build(Color.fromRGBO(19, 29, 35, 1), "沽空",
                            quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_SHORTSELL"),
                           "50天平均", quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_SMA_50"));
                      }
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
