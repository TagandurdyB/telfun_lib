import 'package:telfun/Views/Pages/Demo/Menue.dart';

import '/Views/Pages/ShopPage.dart';
import '/Views/Pages/AboutPage.dart';
import '/Views/Pages/FavoritePage.dart';
import '/Views/Pages/ModelPage.dart';
import '../Views/Pages/Demo/Sliver/DemoSliver.dart';
import '/Views/Login/LoginPage.dart';
import '/Views/Login/SignUp.dart';
import '/Views/Login/Verification.dart';
import '/Views/LogoPage.dart';
import '/Views/Pages/DetalPage.dart';
import '/Views/Pages/MainPage.dart';
import '/Views/Pages/SearchPage.dart';
import '/Views/Pages/SetingsPage.dart';

class PageName {
  static const String pageMain = "/MainPage";
  static const String pageSetting = "/SettingPage";
  static const String pageSearch = "/SearchPage";
  static const String pageLogo = "/LogoPage";
  static const String pageLogIn = "/LogIn";
  static const String pageSignUp = "/SignUp";
  static const String pageVerification = "/Verification";
  static const String pageDetal = "/DetalPage";
  static const String pageDemo = "/DetalPage";
  static const String pageMark = "/MarkPage";
  static const String pageFavorite = "/FavoritePage";
  static const String pageAbout = "/AboutPage";
  static const String pageShop = "/ShopPage";

  final routes = {
    pageMain: (context) => MainPage(),
    pageSetting: (context) => SetingsPage(),
    pageSearch: (context) => SearchPage(),
    pageLogo: (context) => Logo(),
    pageLogIn: (context) => LoginPage(),
    pageSignUp: (context) => SignUpPage(),
    pageVerification: (context) => VerificationPage(),
    pageDetal: (context) => DetalPage(),
    pageDemo: (context) => DemoMenue(),
    pageMark: (context) => ModelPage(),
    pageFavorite: (context) => FavoritePage(),
    pageAbout: (context) => AboutPage(),
    pageShop: (context) => ShopPage()
  };
}
