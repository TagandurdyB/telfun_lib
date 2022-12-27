import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ChatProvider.dart';
import 'package:telfun/ViewModels/EventProvider.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/ShopProvider.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import 'package:telfun/Views/Pages/DetalPage.dart';
import '/Views/Login/SignUp.dart';
import '/Views/Login/Verification.dart';
import '/Views/Login/LoginPage.dart';
import 'Demo/Provider update API/provider/todo_provider.dart';
import 'ViewModels/UserProvider.dart';
import 'Views/LogoPage.dart';
import '/Views/Pages/SetingsPage.dart';
import '/Models/Public.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Views/Pages/MainPage.dart';
import '/Views/Pages/FilterPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserLoginDetals.createSharedPObj();
  await UserProperties.create();
  await ShPValues().create();
  // await ShPUser().create();
  runApp(MultiProvider(
    providers: [
      ///////////////////////////////////////////////
      ChangeNotifierProvider<ToDoProvider>(
          create: (BuildContext context) => ToDoProvider()),
      ///////////////////////////////////////////////
      ChangeNotifierProvider<UsesVar>(
          create: (BuildContext context) => UsesVar()),
      ChangeNotifierProvider<EventsFavoritProvid>(
          create: (BuildContext context) => EventsFavoritProvid()),
      ChangeNotifierProvider<EventsProvid>(
          create: (BuildContext context) => EventsProvid()),
      ChangeNotifierProvider<UserProvider>(
          create: (BuildContext context) => UserProvider()),
      ChangeNotifierProvider<SMSProvider>(
          create: (BuildContext context) => SMSProvider()),
      ChangeNotifierProvider<ThemeProvided>(
          create: (BuildContext context) => ThemeProvided()),
      ChangeNotifierProvider<ShopProvider>(
          create: (BuildContext context) => ShopProvider()),
    ],
    child: MyApp(),
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
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
      title: 'Telfun App',
      theme: ThemeData(
          textTheme: TextTheme(
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Provider.of<ThemeProvided>(context).colorText,
            // displayColor: Colors.blue,
          ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Color(0xffAD88DF)),
          hintStyle: TextStyle(color: Color(0xffAD88DF)),
          focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(60)),
              borderSide: BorderSide(color: Color(0xff5308BE))),
          enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(60)),
              borderSide: BorderSide(color: Color(0xffAD88DF))),
        ),
        primarySwatch: Colors.blue,
        canvasColor: Provider.of<ThemeProvided>(context).colorCanvas, //Color(0xffF0EBFF),
        appBarTheme: AppBarTheme(
            color: Colors.transparent,
            iconTheme: IconThemeData(
              color: Provider.of<ThemeProvided>(context).colorAppBarIcon,
            )),
      ),
      initialRoute: PageName.pageLogo,
      routes: PageName().routes,
    );
  }
}
