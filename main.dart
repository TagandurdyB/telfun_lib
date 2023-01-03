import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import 'ViewModels/Providers.dart';
import '/ViewModels/ShPBDebug.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserLoginDetals.createSharedPObj();
  await UserProperties.create();
  await ShPValues().create();
  // await ShPUser().create();
  runApp(MultiProvider(
    providers: Providers.list,
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
