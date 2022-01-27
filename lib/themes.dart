import 'package:flutter/material.dart';

import 'constants/themes_constants.dart';
import 'style/colors/colors_constants.dart';

class Themes {
  ThemeData? defaultTheme;

  Themes() {
    defaultTheme = ThemeData(
      /// pour l'appBar, floating button et d'autre widget
      ///primarySwatch:
      /// pour le background
      scaffoldBackgroundColor: primaryColor,

      /// pour tout ce qui concerne le texte
      textTheme: const TextTheme(
        //le texte en général, Text
        bodyText2: TextStyle(
          color: textColor,
          fontFamily: dongleFont,
          fontSize: fontSize,
        ),

        ///titre de ListTile
        subtitle1: TextStyle(
          color: textColor,
          fontFamily: dongleFont,
          fontSize: fontSize,
        ),

        /// Tout texte lié avec une image,
        ///  attribut subtitle de ListTile par exemple
        caption: TextStyle(
          color: textColor,
          fontFamily: dongleFont,
          fontSize: fontSize,
        ),

        /// titre de l'Appbar
        headline6: TextStyle(
          color: textColor,
          fontFamily: dongleFont,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
