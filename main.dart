import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Views/Pages/DetalPage.dart';
import '/Views/Login/SignUp.dart';
import '/Views/Login/Verification.dart';
import '/Views/Login/LoginPage.dart';
import 'Views/LogoPage.dart';
import '/Views/Pages/SetingsPage.dart';
import '/Models/Public.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Views/Pages/MainPage.dart';
import '/Views/Pages/SearchPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserLoginDetals.createSharedPObj();
  await UserProperties.create();
 // await ShPUser().create();
  runApp(ChangeNotifierProvider<UsesVar>(
      create: (BuildContext context) => UsesVar(), child: MyApp()));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark));
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SPref login is true or false loading
//UserLoginDetals.saveLogin(false);
UserLoginDetals.loadIsLogin();
UserProperties.loading();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor:  Colors.white,//Color(0xffF0EBFF),
        appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Color(0xff7163DF),
            )),
      ),
      initialRoute: LogoPage.routName,
      routes: {
        MainPage.routName: (context) => MainPage(),
        SetingsPage.routName: (context) => SetingsPage(),
        SearchPage.routName: (context) => SearchPage(),
        LogoPage.routName: (context) => Logo(),
        LoginPage.routName: (context) => LoginPage(),
        SignUpPage.routName: (context) => SignUpPage(),
        VerificationPage.routName: (context) => VerificationPage(),
        DetalPage.routName:(context)=>DetalPage(),
      },
    );
  }
}
