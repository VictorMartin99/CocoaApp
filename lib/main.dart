import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        // home: const MainMenu(),
        initialRoute: "HomeScreen",
        routes: {
          "HomeScreen": (context) => const MainMenu(),
          "cocoaHomePage": (context) => HomeScreenCocoa(),
          "classicHomePage": (context) => HomeScreenClassic(),
          "privatHomePage": (context) => const HomeScreenPrivat(),
          //"cocoaDayImages": (context) => ScreenCocoaDayImages(),
          "cocoaImageDetail": (context) => ScreenCocoaImageDetail(),
          "cocoaImagenes": (context) => ScreenCocoaImage(),
        });
  }
}
