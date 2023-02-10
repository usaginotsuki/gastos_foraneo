import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastos_foraneo/src/Providers/main_provider.dart';
import 'package:gastos_foraneo/src/Widgets/Common/Themes/color_generator.dart';
import 'package:gastos_foraneo/src/pages/login.page.dart';
import 'package:provider/provider.dart';
import 'Core/Colors/Hex_Color.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => MainProvider()),
              ],
              child: const MyApp(),
            ),
          ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //modo claro oscuro
      theme: AppTheme.themeData(false).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      )),
      home: const LoginPage(),
    );
  }
}
