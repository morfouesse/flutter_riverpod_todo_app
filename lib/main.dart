import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/routes/route_generator.dart';
import 'package:flutter_riverpod_todo_app/themes.dart';

import 'constants/routes_constants.dart';
import 'firebase_options.dart';

void main() async {
  /// quand on commence avec firebase_options, l'install avec le CLI
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO:consumer plus tard pour controller l'authentication
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('fr')],

      //Définition du thème
      theme: Themes().defaultTheme,
      //Route au lancement de l'app
      initialRoute: animatedSplash,
      //Permet de générer les routes suivantes
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}
