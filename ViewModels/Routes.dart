import 'package:telfun/Views/Login/RemowePassPage.dart';
import 'package:telfun/Views/Login/contractPage.dart';
import 'package:telfun/Views/Pages/AddShopPage.dart';
import 'package:telfun/Views/Pages/FilterPage/FilterDetalPage.dart';
import 'package:telfun/Views/Pages/InModelPage.dart';

import '/Views/Pages/SmsPage.dart';

import '/Demo/Menue.dart';
import '/Views/Pages/ProductPage.dart';
import '/Views/Pages/ShopPage.dart';
import '/Views/Pages/AboutPage.dart';
import '/Views/Pages/FavoritePage.dart';
import '/Views/Pages/ModelPage.dart';
import '/Views/Login/LoginPage.dart';
import '/Views/Login/SignUp.dart';
import '/Views/Login/Verification.dart';
import '/Views/LogoPage.dart';
import '/Views/Pages/DetalPage.dart';
import '/Views/Pages/MainPage.dart';
import '../Views/Pages/FilterPage/FilterPage.dart';
import '/Views/Pages/SetingsPage.dart';

class PageName {
  static const String pageMain = "/MainPage";
  static const String pageSetting = "/SettingPage";
  static const String pageFilter = "/SearchPage";
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
  static const String pageProduct = "/ProductPage";
  static const String pageChat = "/ChatPage";
  static const String pageAddShop = "/AddShopPage";
  static const String pageContract = "/ContractPage";
  static const String pageRemovePass = "/RemovePassPage";
  static const String pageFilterDetal = "/FilterDetalPage";

  final routes = {
    pageMain: (context) => MainPage(),
    pageSetting: (context) => SetingsPage(),
    pageFilter: (context) => FilterPage(),
    pageLogo: (context) => Logo(),
    pageLogIn: (context) => LoginPage(),
    pageSignUp: (context) => SignUpPage(),
    pageVerification: (context) => VerificationPage(),
    pageDetal: (context) => DetalPage(),
    pageDemo: (context) => DemoMenue(),
    pageMark: (context) => ModelPage(),
    pageFavorite: (context) => FavoritePage(),
    pageAbout: (context) => AboutPage(),
    pageShop: (context) => ShopPage(),
    pageProduct: (context) => ProductPage(),
    pageChat: (context) => ChatPage(),
    pageAddShop:(context)=>AddShopPage(),
    pageContract:(context)=>ContractPage(),
    pageRemovePass:(context)=>RemowePassPage(),
    pageFilterDetal:(context)=>FilterDetalPage(),
  };
}
