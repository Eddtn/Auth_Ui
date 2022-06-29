import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isHidden = true;

  void _tooglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F0F1),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'Hello Again!',
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Welcome back you\'ve \n        been missed!',
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'required field';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          hintText: 'Enter Name '),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'required field';
                        }
                        return null;
                      },
                      obscureText: _isHidden,
                      obscuringCharacter: "+",
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password ',
                        suffixIcon: InkWell(
                            onTap: _tooglePasswordView,
                            child: Icon(Icons.visibility)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
