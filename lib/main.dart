import 'package:break_time/controller/auth_controller.dart';
import 'package:break_time/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'views/my_material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: globalTheme,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (BuildContext context, snapshot) {
            return (snapshot.hasData)
                ? const MainController()
                : const AuthController();
          },
        ));
  }
}

final globalTheme = ThemeData(
    colorScheme: _customColorScheme,
    textTheme: const TextTheme(
        bodyText1: TextStyle(fontSize: 22, height: 12),
        bodyText2: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1.0),
        caption: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          height: 1.2,
        ),
        headline2: TextStyle(
            color: Colors.black38, fontSize: 30, fontWeight: FontWeight.bold)),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.amber,
        iconTheme: IconThemeData(color: Colors.red),
        actionsIconTheme: IconThemeData(color: Colors.blue),
        centerTitle: true,
        elevation: 15,
        titleTextStyle: TextStyle(
          color: Colors.deepPurple,
          fontFamily: 'Allison',
          fontWeight: FontWeight.bold,
          fontSize: 40,
        )));

ColorScheme _customColorScheme = const ColorScheme(
  primary: principal,
  onSurface: black,
  brightness: Brightness.light,
  background: white,
  onPrimary: white,
  secondary: secondary,
  onSecondary: white,
  surface: white,
  error: redAccent,
  onError: white,
  onBackground: black,
);
