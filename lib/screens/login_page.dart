import 'package:flutter/material.dart';
import 'package:break_time/views/my_material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AssetImage backImage = fetards;
  late bool formVisible;
  int? _formsIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formVisible = false;
    _formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: backImage, fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.black54,
              child: Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight + 40,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        PaddingWith(
                            left: 30.0,
                            right: 30.0,
                            widget: const Text(
                              'Veuillez vous connecter ou vous inscrire pour continuer',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: BtButton(
                          backColor: Colors.redAccent,
                          textColor: Colors.white,
                          elevation: 0,
                          radius: 30.0,
                          title: 'Login',
                          height: 40,
                          width: 50,
                          fontSize: 20,
                          onPressed: () {
                            setState(() {
                              formVisible = true;
                              _formsIndex = 1;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: BtButton(
                          backColor: Colors.grey.shade700,
                          textColor: Colors.white,
                          elevation: 0,
                          radius: 30.0,
                          title: 'Sign up',
                          height: 40,
                          width: 50,
                          fontSize: 20,
                          onPressed: () {
                            setState(() {
                              formVisible = true;
                              _formsIndex = 2;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: (!formVisible)
                  ? null
                  : Container(
                      color: Colors.black54,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BtButton(
                                  textColor: _formsIndex == 1
                                      ? Colors.white
                                      : Colors.black,
                                  backColor: _formsIndex == 1
                                      ? Colors.redAccent
                                      : Colors.white,
                                  title: 'Login',
                                  fontSize: 16.0,
                                  height: 20,
                                  width: 150,
                                  radius: 20.0,
                                  onPressed: () {
                                    setState(() {
                                      _formsIndex = 1;
                                    });
                                  }),
                              const SizedBox(
                                width: 10.0,
                              ),
                              BtButton(
                                textColor: _formsIndex == 2
                                    ? Colors.white
                                    : Colors.black,
                                backColor: _formsIndex == 2
                                    ? Colors.redAccent
                                    : Colors.white,
                                title: 'Sign up',
                                fontSize: 16.0,
                                height: 20,
                                width: 150,
                                radius: 20.0,
                                onPressed: () {
                                  setState(() {
                                    _formsIndex = 2;
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              IconButton(
                                color: Colors.white,
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    formVisible = false;
                                  });
                                },
                              ),
                            ],
                          ),
                          Container(
                              child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: _formsIndex == 1
                                      ? const LoginForm()
                                      : const SignUpForm())),
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Votre Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Votre mot de passe',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Confirmer votre mot de passe',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          BtButton(
              backColor: Colors.redAccent,
              textColor: Colors.white,
              fontSize: 20,
              elevation: 0,
              radius: 30.0,
              title: 'Sign up',
              height: 50,
              width: 50,
              onPressed: () {})
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Votre Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Votre mot de passe',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            BtButton(
                backColor: Colors.redAccent,
                textColor: Colors.white,
                fontSize: 20,
                elevation: 0,
                radius: 30.0,
                title: 'Login',
                height: 50,
                width: 50,
                onPressed: () {})
          ],
        ));
  }
}
