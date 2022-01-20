import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/routes/route_generator.dart';
import 'package:flutter_riverpod_todo_app/style/colors/colors_constants.dart';

import 'constants/theme_constants.dart';
import 'firebase_options.dart';

void main() async {
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
    //consumer
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('fr')],

      //Définition du thème
      theme: ThemeData(
        /// pour l'appBar, floating button et d'autre widget
        ///primarySwatch:
        /// pour le background
        scaffoldBackgroundColor: primaryColor,

        /// pour tout ce qui concerne le texte
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: textColor,
            fontFamily: dongleFont,
            fontSize: fontSize,
          ),
        ),
      ),
      //Route au lancement de l'app
      initialRoute: '/animatedSplash',
      //Permet de générer les routes suivantes
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}
