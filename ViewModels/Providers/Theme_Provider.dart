import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:telfun/Models/theme_model.dart';
import '../ShPBDebug.dart';

bool _isLight;

class ThemeProvided extends ChangeNotifier {
  void tongleTheme() {
    _isLight = !_isLight;
    ShPValues(tag: "Theme").save(_isLight);
    notifyListeners();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: colorCanvas,
        statusBarColor: colorCanvas,
      ),
    );
  }

  bool getTheme() {
    if (_isLight == null) {
      _isLight = ShPValues(tag: "Theme", type: dataType.bool).get();
    }
    return _isLight;
  }

  //Colors/////////////////////////////////////////
  Color get colorCanvas =>
      getTheme() ? MyTheme.lightColorCanves : MyTheme.darkColorCanves;
  Color get colorAppBarIcon =>
      getTheme() ? MyTheme.lightColorAppBarIcon : MyTheme.darkColorAppBarIcon;
  Color get colorNavBarUnSelectIcon =>
      getTheme() ? MyTheme.lightColorNavBarUnIcon : MyTheme.darkColorNavBarUnIcon;
  Color get colorNavBarSelectIcon =>
      getTheme() ? MyTheme.lightColorNavBarIcon : MyTheme.darkColorNavBarIcon;
  Color get colorText =>
      getTheme() ? MyTheme.lightColorText : MyTheme.darkColorText;
  Color get colorModel =>
      getTheme() ? MyTheme.lightColorModel : MyTheme.darkColorModel;
  //TextStyles/////////////////////////////////////
  TextStyle get styleUserPage =>
      getTheme() ? MyTheme.lightStyleUserPage : MyTheme.darkStyleUserPage;
  TextStyle get styleEnable =>
      getTheme() ? MyTheme.lightStyleEnable : MyTheme.darkStyleEnable;
  TextStyle get styleDisable =>
      getTheme() ? MyTheme.lightStyleDisable : MyTheme.darkStyleDisable;
  TextStyle get styleDropDBItems =>
      getTheme() ? MyTheme.lightStyleDropDBItems : MyTheme.darkStyleDropDBItems;
  TextStyle get styleInputText =>
      getTheme() ? MyTheme.lightStyleInputText : MyTheme.darkStyleInputText;
  //Icons//////////////////////////////////////////
  Icon get iconThemeBtn =>
      getTheme() ? MyTheme.lightIconThemeBtn : MyTheme.darkIconThemeBtn;
  //Shadows////////////////////////////////////////
  List<BoxShadow> get shadowSlider =>
      getTheme() ? MyTheme.lightShadowSlider : MyTheme.darkShadowSlider;
  List<BoxShadow> get shadowSearch =>
      getTheme() ? MyTheme.lightShadowSearch : MyTheme.darkShadowSearch;
  List<BoxShadow> get shadowModel =>
      getTheme() ? MyTheme.lightShadowModel : MyTheme.darkShadowModel;
  List<BoxShadow> get shadowAll =>
      getTheme() ? MyTheme.lightShadowAll : MyTheme.darkShadowAll;
  List<BoxShadow> get shadowDown =>
      getTheme() ? MyTheme.lightShadowDown : MyTheme.darkShadowDown;
  List<BoxShadow> get shadowUp =>
      getTheme() ? MyTheme.lightShadowUp : MyTheme.darkShadowUp;
  //Brightness/////////////////////////////////////
  Brightness get ststusBrightness =>
      getTheme() ? MyTheme.lightBrightness : MyTheme.darkBrightness;
}
