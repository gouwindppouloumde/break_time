import 'package:flutter/material.dart';
import 'package:break_time/views/my_material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AssetImage backImage = theBande;
  late bool formVisible;
  int? _formsIndex;

  @override
  void initState() {
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
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: kToolbarHeight + 40,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          flex: 1,
                          child: PaddingWith(
                              top: 50.0,
                              left: 30.0,
                              right: 30.0,
                              widget: const Text(
                                'Etes-vous prêt à rejoindre un monde de découvertes et de divertissements sans limites ?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    height: 1.4,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ))),
                      Flexible(
                          flex: 0,
                          child: PaddingWith(
                              top: 30,
                              left: 40.0,
                              right: 40.0,
                              widget: const Text(
                                '''
Inscrivez-vous pour commencer
ou connectez-vous si vous êtes déjà inscrit
''',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    height: 1.2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 18),
                              ))),
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
                        borderColor: Colors.white,
                        borderWidth: 1.5,
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
                          borderColor: Colors.white,
                          borderWidth: 1.5,
                          title: 'Sign up',
                          height: 40,
                          width: 50,
                          fontSize: 20,
                          onPressed: () {
                            setState(() {
                              formVisible = true;
                              _formsIndex = 2;
                            });
                          }),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.redAccent, width: 1.5),
                    textStyle: const TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  icon: const Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Continue with google',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 30.0,
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
                        Flexible(
                            flex: 0,
                            child: Row(
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
                                    width: 120,
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
                                  width: 120,
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
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: _formsIndex == 1
                                      ? const LoginForm()
                                      : const SignUpForm()),
                            )),
                      ],
                    ),
                  ),
          )
        ],
      ),
    ));
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _pwd;
  late TextEditingController _pwdCtrl;
  late TextEditingController _email;
  bool _requiredAge = false;

  @override
  void initState() {
    _pwd = TextEditingController();
    _pwdCtrl = TextEditingController();
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _pwd.dispose();
    _pwdCtrl.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  hintText: 'Votre Email',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Email est obligatoire';
                  } else {
                    return null;
                  }
                }),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
                controller: _pwd,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Votre mot de passe',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null) {
                    return "Le mot de passe est obligatoire";
                  } else if (value.length < 8) {
                    return "Le mot de passe doit avoir au moins 8 caractères";
                  } else {
                    return null;
                  }
                }),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
                controller: _pwdCtrl,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Confirmer votre mot de passe',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null) {
                    return "Le mot de passe est obligatoire";
                  } else if (value.length < 8) {
                    return "Le mot de passe doit avoir au moins 8 caractères";
                  } else {
                    return null;
                  }
                }),
            const SizedBox(
              height: 10.0,
            ),
            CheckboxListTile(
                title: const Text(
                    'Check this case to confirm you are over 15 years old'),
                value: _requiredAge,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    _requiredAge = value!;
                  });
                },
                subtitle: !_requiredAge
                    ? const Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Text(
                          'Important !',
                          style:
                              TextStyle(color: Color(0xFFe53935), fontSize: 15),
                        ),
                      )
                    : null),
            const SizedBox(
              height: 10.0,
            ),
            BtButton(
                backColor: Colors.redAccent,
                textColor: Colors.white,
                fontSize: 20,
                elevation: 0,
                radius: 30.0,
                title: 'Sign up',
                height: 40,
                width: 50,
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  final form = _formKey.currentState;
                  if (form != null && form.validate()) {
                    if (_pwd.text == _pwdCtrl.text) {
                      // logique d'inscription sur firebase
                      form.save();
                    } else {
                      {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Alert"),
                                titleTextStyle: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                                content: const Text(
                                  "Passwords do not match",
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  IconButton(
                                    color: Colors.white,
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.redAccent,
                                      size: 35.0,
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  )
                                ],
                              );
                            });
                      }
                    }
                  }
                })
          ],
        ),
      ),
    ));
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
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
            )));
  }
}

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(
      {Key? key,
      Widget? title,
      FormFieldSetter<bool>? onSaved,
      FormFieldValidator<bool>? validator,
      bool initialValue = false,
      bool autovalidate = false})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                dense: state.hasError,
                title: title,
                value: state.value,
                onChanged: state.didChange,
                subtitle: state.hasError
                    ? Builder(
                        builder: (BuildContext context) => Text(
                          state.errorText!,
                          style: TextStyle(color: Theme.of(context).errorColor),
                        ),
                      )
                    : null,
                controlAffinity: ListTileControlAffinity.leading,
              );
            });
}
