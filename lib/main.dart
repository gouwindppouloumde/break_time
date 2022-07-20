import 'package:break_time/controller/auth_controller.dart';
import 'package:break_time/controller/main_controller.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:theme/theme.dart';

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
      title: 'Break-time',
      builder: (context, child) {
        final themeData = ThemeDataContainer.main();
        return ThemeResolver(
          data: themeData,
          child: Theme(
              data: themeData.theme,
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (BuildContext context, snapshot) {
                  return (snapshot.hasData)
                      ? const MainController()
                      : const AuthController();
                },
              )),
        );
      },
    );
  }
}
