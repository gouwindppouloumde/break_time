import 'package:break_time/utilitaires/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:break_time/views/my_material.dart';
import 'package:provider/provider.dart';

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

  _hideSignupForm(BuildContext context) {
    Provider.of<DataProvider>(context, listen: false).hideSignupForm();
  }

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
            IconButton(
              color: Colors.black54,
              alignment: Alignment.topRight,
              icon: const Icon(Icons.clear),
              onPressed: () {
                _hideSignupForm(context);
              },
            ),
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
                    'Check this case to confirm you are over 18 years old'),
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
