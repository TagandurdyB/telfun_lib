import '/Views/Pages/ModelPage.dart';
import '/Views/Pages/DemoPage.dart';
import '/Views/Login/LoginPage.dart';
import '/Views/Login/SignUp.dart';
import '/Views/Login/Verification.dart';
import '/Views/LogoPage.dart';
import '/Views/Pages/DetalPage.dart';
import '/Views/Pages/MainPage.dart';
import '/Views/Pages/SearchPage.dart';
import '/Views/Pages/SetingsPage.dart';

class PageName {
  static String pageMain = "/MainPage";
  static String pageSetting = "/SettingPage";
  static String pageSearch = "/SearchPage";
  static String pageLogo = "/LogoPage";
  static String pageLogIn = "/LogIn";
  static String pageSignUp = "/SignUp";
  static String pageVerification = "/Verification";
  static String pageDetal = "/DetalPage";
  static String pageDemo = "/DetalPage";
  static String pageMark = "/MarkPage";

  final routes = {
    pageMain: (context) => MainPage(),
    pageSetting: (context) => SetingsPage(),
    pageSearch: (context) => SearchPage(),
    pageLogo: (context) => Logo(),
    pageLogIn: (context) => LoginPage(),
    pageSignUp: (context) => SignUpPage(),
    pageVerification: (context) => VerificationPage(),
    pageDetal: (context) => DetalPage(),
    pageDemo: (context) => DemoPage(),
    pageMark: (context) => ModelPage(),
  };
}
