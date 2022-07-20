import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeResolver.of(context).theme;
    return Scaffold(
        body: Container(
      color: theme.colorScheme.primary,
      child: Center(
        child: Text(
          'Break-time',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
      ),
    ));
  }
}
