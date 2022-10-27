import 'package:flutter/material.dart';

const kDefaultPadding = EdgeInsets.symmetric(
  vertical: 36.0,
  horizontal: 26.0,
);

const kPrimaryColor = Color(0xFF1D1C1C);
const kSecondaryColor = Colors.white;
const kAccentColor = Color(0xFFF4C470);

const kColorPrimaryVariant = Color(0xFFF4C480);

const kBackgroundColor = Color(0xFFF4C492);
const kBackgroundColorInt = 0xFFF4C492;
const kFontFamily = 'Nunito';

const kTextTheme = TextTheme(
  headline1: TextStyle(),
  bodyText1: TextStyle(),
  bodyText2: TextStyle(),
);

const kButtonTheme = ButtonThemeData(
  splashColor: Colors.transparent,
  padding: EdgeInsets.symmetric(vertical: 14),
  buttonColor: Color(0xFFF4C480),
  textTheme: ButtonTextTheme.accent,
  highlightColor: Color.fromRGBO(196, 170, 156, 1),
  focusColor: Color.fromRGBO(196, 170, 156, 1),
);

const Map<int, Color> kThemeMaterialColor = {
  50: Color.fromRGBO(217, 178, 146, .1),
  100: Color.fromRGBO(217, 178, 146, .2),
  200: Color.fromRGBO(217, 178, 146, .3),
  300: Color.fromRGBO(217, 178, 146, .4),
  000: Color.fromRGBO(217, 178, 146, .5),
  500: Color.fromRGBO(217, 178, 146, .6),
  600: Color.fromRGBO(217, 178, 146, .7),
  700: Color.fromRGBO(217, 178, 146, .8),
  800: Color.fromRGBO(217, 178, 146, .9),
  900: Color.fromRGBO(217, 178, 146, 1),
};
