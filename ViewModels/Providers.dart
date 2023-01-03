import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:telfun/Demo/Provider%20update%20API/provider/todo_provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/ValueProvider.dart';

import 'ChatProvider.dart';
import 'EventProvider.dart';
import 'FilterProvider.dart';
import 'ShopProvider.dart';
import 'Theme_Provider.dart';
import 'UserProvider.dart';

class Providers {
  static List<SingleChildWidget> get list => [
        ///////////////////////////////////////////////
        ChangeNotifierProvider<ToDoProvider>(
            create: (context) => ToDoProvider()),
        ///////////////////////////////////////////////
        ChangeNotifierProvider<UsesVar>(create: (context) => UsesVar()),
        ChangeNotifierProvider<EventsFavoritProvid>(
            create: (context) => EventsFavoritProvid()),
        ChangeNotifierProvider<EventsProvid>(
            create: (context) => EventsProvid()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<SMSProvider>(create: (context) => SMSProvider()),
        ChangeNotifierProvider<ThemeProvided>(
            create: (context) => ThemeProvided()),
        ChangeNotifierProvider<ShopProvider>(
            create: (context) => ShopProvider()),
        ChangeNotifierProvider<FilterProvider>(
            create: (context) => FilterProvider()),
        ChangeNotifierProvider<ValuesProvider>(
            create: (context) => ValuesProvider()),
      ];
}
