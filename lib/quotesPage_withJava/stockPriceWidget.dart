
import 'package:flutter/material.dart';
import 'package:flutter_library/materialComponents/MaterialStyle.dart';
import 'package:flutter_library/quotesPage_withJava/chartUtilWidget.dart';
import 'package:flutter_library/quotesPage_withJava/parameters.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StockPriceWidget extends StatefulWidget {

  StockPriceWidget(
      {Key key})
      : super(key: key);
  @override
  _StockPriceWidget createState() => _StockPriceWidget();
}

class _StockPriceWidget extends State<StockPriceWidget> {
  @override
  
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool stockIsUp = true;
    // TODO: implement build
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  new SizedBox(
                    width: 70.0,
                    height: 40.0,
                    child: GestureDetector(
                      // TODO: Tap the StockCode Input Button to Change the Stock -> This Button Should Be pop up the NumKeyBoard for user input and search
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.lightBlue, width: 1),
                            color: Color.fromRGBO(50, 62, 77, 1),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          "00423",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  new Text("經濟日報集團", style: TextStyle(fontSize: 20))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      child: InkWell(
                          child: Text(
                            "DD",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
//                            getChartUtil("D1");
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4),
                    ),
                    Container(
                      color: Colors.blue,
                      child: InkWell(
                          child: Text(
                            "DD",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
//                            getChartUtil("D1");
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        new SizedBox(
            child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Consumer<QuotesPageNotifier>(
                        builder: (context, quotesPageNotifier, child){
                          double.parse(quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_CHANGE")) >= 0  ? stockIsUp = true : stockIsUp = false;
                          return Container(
                          alignment: Alignment.centerLeft,
                          child: new Text(quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_CURRENCY"), style: stockKey),
                        );
                        },

                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: stockIsUp
                                  ? EdgeInsets.only(top: 20)
                                  : EdgeInsets.only(bottom: 20),
                              child: Icon(
                                stockIsUp
                                    ? FontAwesomeIcons.sortUp
                                    : FontAwesomeIcons.sortDown,
                                size: 55,
                                color: stockIsUp
                                    ? Color.fromRGBO(77, 225, 51, 1)
                                    : Colors.red,
                              ),
                            ),
                          ),
                          new Expanded(
                              flex: 4,
                              child: Consumer<QuotesPageNotifier>(
                                builder: (context, quotesPageNotifier, child){
                                  return Text(quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_NOMINAL"),
                                  style: stockIsUp ? stockCurrentPriceUp : stockCurrentPriceDown,
                                  textAlign: TextAlign.end
                                  );
                                },
                              ),
                          ),
                        ],
                      ),

                      //tryParse(findChange) > 0 ? stockIsUp = true : stockIsUp = false;
                      new Container(
                        alignment: Alignment.centerRight,
                        child: Consumer<QuotesPageNotifier>(
                          builder: (context, quotesPageNotifier, child){
                           return Text(
                            (stockIsUp
                                    ? "+" + quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_CHANGE")
                                    : quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_CHANGE") +
                                "(" +
                                (stockIsUp
                                    ? "+" + quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_PER_CHANGE")
                                    : quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_PER_CHANGE")) +
                                "%" +
                                ")"),
                            style: stockIsUp
                                ? stockDiffPriceWin
                                : stockDiffPriceLost,
                            textAlign: TextAlign.end,
                          );
                          }
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: new Text("高"),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Consumer<QuotesPageNotifier>(
                                    builder: (context, quotesPageNotifier, child){
                                      return new Text(
                                        quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_HIGH"),
                                        textDirection: TextDirection.rtl,
                                      );
                                    }
                                  ),
                                ),
                              ],
                            ),
//                          child: _buildKeyValueItem(
//                              '高', _fallbackFilter<double>(stream[FID_HIGH], (v) => v.toStringAsFixed(2))),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: new Text(" 開"),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Consumer<QuotesPageNotifier>(
                                    builder: (context, quotesPageNotifier, child){
                                      return new Text(
                                        quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_OPEN"),
                                    textDirection: TextDirection.rtl,
                                  );
                                    }
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: new Text("低"),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Consumer<QuotesPageNotifier>(
                                    builder: (context, quotesPageNotifier, child){
                                      return new Text(
                                        quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_LOW"),
                                    textDirection: TextDirection.rtl,
                                  );
                                    }
                                  ),
                                ),
                              ],
                            ),
//                          child: _buildKeyValueItem(
//                              '高', _fallbackFilter<double>(stream[FID_HIGH], (v) => v.toStringAsFixed(2))),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: new Text(" 前"),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Consumer<QuotesPageNotifier>(
                                    builder: (context, quotesPageNotifier, child){
                                      return new Text(
                                        quotesPageNotifier.getBackValueOfQuotesPageHashMap("FID_CLOSE"),
                                    textDirection: TextDirection.rtl,
                                  );
                                    }
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue.withOpacity(0.2),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "買入",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(Icons.arrow_right)),
                                ],
                              ),
                              Text(
                                "46.900",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ), onPressed: () {
                            debugPrint("Button");
                          },
//                              child: new Text(" 前", style: TextStyle(color: Colors.white)),
//                          onPressed: () => TransactionFAB(true),
                        ),
                        RaisedButton(
                          color: Colors.red.withOpacity(0.2),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "賣出",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(Icons.arrow_right)),
                                ],
                              ),
                              Text(
                                "46.950",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
//                              child: new Text(" 前", style: TextStyle(color: Colors.white)),
                          onPressed: () => debugPrint("FullChart PopUp"),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.all(5.0),
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height / 6,
                        child: ChartUtilWidget()),
                  ],
                ),
              ),
            ],
          ),
        ])),
      ],
    );
  }
}
