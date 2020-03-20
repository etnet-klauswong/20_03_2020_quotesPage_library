
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_library/quotesPage_withJava/parameters.dart';
import 'package:flutter_library/quotesPage_withJava/quotesPage_hardCode.dart';
import 'package:provider/provider.dart';


const String FlutterMessageChannelName = 'EtNet_FlutterIntegration';
const BasicMessageChannel<String> kReloadChannel =
BasicMessageChannel<String>(FlutterMessageChannelName, StringCodec());

Future<String> run(String name) async {
  // The platform-specific component will call [setInitialRoute] on the Flutter
  // view (or view controller for iOS) to set [ui.window.defaultRouteName].
  // We then dispatch based on the route names to show different Flutter
  // widgets.
  // Since we don't really care about Flutter-side navigation in this app, we're
  // not using a regular routes map.
  switch (name) {
    case "quotesPageCommunicationWidget": // TODO: -> advertisementWidget
      final quotespageMODEL = QuotesPageModel();
      runApp(
          MaterialApp(
            showPerformanceOverlay: false,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Color.fromRGBO(12, 24, 34, 1),
            ),
            home: SafeArea(
                child: ChangeNotifierProvider.value(
                    value: quotespageMODEL,
                    child: QuotePage())),
          ),
      );
      break;
    default:
      final quotespageMODEL = QuotesPageModel();
      runApp(
        MaterialApp(
          showPerformanceOverlay: false,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color.fromRGBO(12, 24, 34, 1),
          ),
          home: SafeArea(
              child: ChangeNotifierProvider.value(
                  value: quotespageMODEL,
                  child: QuotePage())),
        ),
      );
      break;
  }
  return '';
}