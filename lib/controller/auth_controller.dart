import 'package:flutter/material.dart';

class AuthController extends StatefulWidget {
  const AuthController({Key? key}) : super(key: key);

  @override
  State<AuthController> createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("On va s'authentifier ici")),
    );
  }
}
