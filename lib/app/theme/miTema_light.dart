import 'package:flutter/material.dart';

class Themes {
  final lighTheme = ThemeData.light().copyWith(
    accentColor: Color(0xffff3390),
    primaryColor: Color(0xffFF9966),
    primaryColorLight: Color(0xff176067),
    primaryColorDark: Color(0xff96d6d0),
    // degradado con primario
    hintColor: Color(0xfffda185),
    textTheme: TextTheme(
      caption: TextStyle(color: Colors.black),
      headline2: TextStyle(fontSize: 18, color: Colors.black87),
      headline3: TextStyle(fontSize: 16, color: Colors.black87),
      headline5: TextStyle(color: Colors.black, fontSize: 14),
      bodyText1: TextStyle(color: Colors.black, fontSize: 14),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      foregroundColor: Color(0xff777777),
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
      ),
    ),
    buttonColor: Colors.green,
  );

  final darkTheme = ThemeData.dark().copyWith(
      accentColor: Color(0xffFF9966),
      primaryColor: Color(0xffff3390),
      primaryColorLight: Color(0xff2e2e2e),
      primaryColorDark: Color(0xffbbbbbb),
      hintColor: Color(0xfffda185),
      textTheme: TextTheme(
        headline2: TextStyle(fontSize: 18, color: Colors.white70),
        headline3: TextStyle(fontSize: 16, color: Colors.white70),
        headline5: TextStyle(color: Colors.white70, fontSize: 14),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff2e2e2e),
        brightness: Brightness.dark,
        foregroundColor: Color(0xffbbbbbb),
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
        ),
      ),
      buttonColor: Colors.pink);

  final lighThemeVerde = ThemeData.light().copyWith(
    accentColor: Color(0xff176067),
    primaryColor: Color(0xff82c024),
    hintColor: Color(0xff008781),

    primaryColorLight: Color(0xff176067),
    primaryColorDark: Color(0xff96d6d0),
    // degradado con primario
    highlightColor: Color(0xff77dd77),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Color(0xff82c004), fontFamily: 'Samantha', fontSize: 38),
      bodyText2: TextStyle(color: Color(0xff222222), fontSize: 14),
      headline1: TextStyle(
          color: Color(0xff008781), fontSize: 18, fontWeight: FontWeight.w400),
      headline2: TextStyle(
          color: Color(0xff173037), fontSize: 18, fontWeight: FontWeight.w400),
      //alterna el color
      headline3: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
      headline4: TextStyle(
          color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),
      headline5: TextStyle(color: Colors.black, fontSize: 14),
      caption: TextStyle(
          color: Color(0xff008781), fontFamily: 'Samantha', fontSize: 38),
      overline: TextStyle(
          color: Color(0xff008781), fontFamily: 'Samantha', fontSize: 24),
      subtitle1: TextStyle(color: Color(0xff222222), fontSize: 14),
      subtitle2: TextStyle(color: Colors.white, fontSize: 14),
    ),
    //error
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff176067),
      brightness: Brightness.light,
      foregroundColor: Color(0xff82c004),
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
      ),
    ),
    buttonColor: Colors.green,
  );

  final darkThemeVerde = ThemeData.dark().copyWith(
    canvasColor: Color(0xff008781),
    scaffoldBackgroundColor: Color(0xff176067),
    accentColor: Color(0xff82c024),
    primaryColor: Color(0xff176067),
    hintColor: Color(0xff8edcb9),
    primaryColorLight: Color(0xff96d6d0),
    primaryColorDark: Color(0xff3a6b39),
    // degradado con primario
    highlightColor: Color(0xff77dd77),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: Color(0xffbbccbb), fontSize: 16),
        bodyText2: TextStyle(color: Color(0xffbbccbb), fontSize: 12),
        headline1: TextStyle(
            color: Color(0xffbbccbb),
            fontSize: 38,
            fontWeight: FontWeight.w400),
        headline2: TextStyle(
            color: Color(0xffbbccbb),
            fontSize: 28,
            fontWeight: FontWeight.w400),
        // alterna el color
        headline3: TextStyle(
            color: Color(0xffbbccbb),
            fontSize: 22,
            fontWeight: FontWeight.w400),
        headline4: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        headline5: TextStyle(color: Colors.white, fontSize: 14),
        headline6: TextStyle(color: Colors.red, fontSize: 12),
        caption: TextStyle(color: Color(0xff8edcb9), fontSize: 18),
        overline: TextStyle(color: Color(0xff8edcb9), fontSize: 16),
        subtitle1: TextStyle(color: Color(0xffdddddd), fontSize: 14),
        subtitle2: TextStyle(color: Colors.black, fontSize: 10),
        button: TextStyle(color: Color(0xff82c024), fontSize: 14)
        //error
        ),

    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff176067),
      brightness: Brightness.dark,
      foregroundColor: Color(0xff82c004),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: 'Samantha', fontSize: 42, color: Color(0xff82c004)),
      ),
    ),
    buttonColor: Colors.green,
  );
  //

  final customTheme = ThemeData.dark().copyWith(
    canvasColor: Color(0xffcccccc),
    scaffoldBackgroundColor: Color(0xffeeeeee),
    accentColor: Color(0xff444444),
    primaryColor: Color(0xff6F2C58),
    hintColor: Color(0xff334444),
    primaryColorLight: Color(0xff96d6d0),
    primaryColorDark: Color(0xff223333),
    // degradado con primario
    highlightColor: Color(0xff77dd77),
    textTheme: TextTheme(
        bodyText1: TextStyle(color: Color(0xff444444), fontSize: 22),
        bodyText2: TextStyle(color: Color(0xffdddddd), fontSize: 12),
        headline1: TextStyle(
            color: Color(0xff222222),
            fontSize: 12,
            fontWeight: FontWeight.w400),
        headline2: TextStyle(
            color: Color(0xffF0C0E7),
            fontSize: 14,
            fontWeight: FontWeight.w400),
        // alterna el color
        headline3: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        caption: TextStyle(color: Color(0xff6F2c58), fontSize: 22),
        overline: TextStyle(color: Color(0xff8edcb9), fontSize: 18),
        subtitle1: TextStyle(color: Color(0xff223333), fontSize: 12),
        subtitle2: TextStyle(color: Colors.black, fontSize: 12),
        //error
        headline4: TextStyle(
            color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400)),

    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff6F2C58),
      brightness: Brightness.dark,
      foregroundColor: Color(0xff82c004),
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
      ),
    ),
    buttonColor: Colors.green,
  );

  miTema() => ThemeData.light().copyWith(
      accentColor: Colors.red,
      //primaryColor: Color(0xff0DBFA7)
      primaryColor: Color(0xffFF9966));
}

//final darkThemeVerde = ThemeData.dark().copyWith(
//   canvasColor: Color(0xff008781),
//   scaffoldBackgroundColor: Color(0xff176067),
//   accentColor: Color(0xff82c024),
//   primaryColor: Color(0xff176067),
//   hintColor: Color(0xff8edcb9),
//   primaryColorLight: Color(0xff96d6d0),
//   primaryColorDark: Color(0xff3a6b39),
//   // degradado con primario
//   highlightColor: Color(0xff77dd77),
//   textTheme: TextTheme(
//     bodyText1: TextStyle(
//         color: Color(0xff82c004), fontFamily: 'Samantha', fontSize: 38),
//     bodyText2: TextStyle(color: Color(0xffdddddd), fontSize: 14),
//     headline1: TextStyle(
//         color: Color(0xff176067), fontSize: 18, fontWeight: FontWeight.w400),
//     headline2: TextStyle(
//         color: Color(0xff77dd77), fontSize: 18, fontWeight: FontWeight.w400),
//     // alterna el color
//     headline3: TextStyle(
//         color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
//     headline4: TextStyle(
//         color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),
//     headline5: TextStyle(color: Colors.white, fontSize: 14),
//     caption: TextStyle(
//         color: Color(0xff8edcb9), fontFamily: 'Samantha', fontSize: 38),
//     overline: TextStyle(
//         color: Color(0xff8edcb9), fontFamily: 'Samantha', fontSize: 24),
//     subtitle1: TextStyle(color: Color(0xffdddddd), fontSize: 14),
//     subtitle2: TextStyle(color: Colors.black, fontSize: 14),
//     //error
//   ),

//   appBarTheme: AppBarTheme(
//     backgroundColor: Color(0xff176067),
//     brightness: Brightness.dark,
//     foregroundColor: Color(0xff82c004),
//     textTheme: TextTheme(
//       headline1: TextStyle(color: Colors.black),
//     ),
//   ),
//   buttonColor: Colors.green,
// );
