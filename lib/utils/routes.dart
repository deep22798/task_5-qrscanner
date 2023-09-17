import 'package:get/get.dart';
import 'package:task5/views/home.dart';
import 'package:task5/views/scannerscreen.dart';
import 'package:task5/views/webview.dart';
import 'package:task5/views/widgets/qr.dart';
import 'package:task5/views/splash.dart';

class Routes{
  static String splash='/';
  static String home='/home';
  static String qr='/qr';
  static String webview='/webview';
  static String scannerscren='/ss';
}

final Pages=[
  GetPage(name: Routes.splash, page: ()=>Splash()),
  GetPage(name: Routes.home, page: ()=>HomeScreen()),
  GetPage(name: Routes.qr, page: ()=>QrScannerWidget()),
  GetPage(name: Routes.webview, page: ()=>webview(uri: '')),
  GetPage(name: Routes.scannerscren, page: ()=>ScannerScreen()),
];