// import 'package:cached_network_image/cached_network_image.dart';
import 'package:auth_ui/router/route.dart';
import 'package:auth_ui/views/view_model/regidtration_view_model.dart';
import 'package:auth_ui/widgets/appbutton.dart';
import 'package:auth_ui/widgets/loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final __signUpViewModelProvider =
    ChangeNotifierProvider<SignUpViewModel>((ref) => SignUpViewModel());

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  bool _isHidden = true;

  void _tooglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(__signUpViewModelProvider);
    return Loader(
      isBusy: model.isBusy,
      child: Scaffold(
        backgroundColor: const Color(0xffE7EFF5),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'Welcome \n To Registration Screen !',
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign Up',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: model.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: model.firstNameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'required field';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First Name',
                                hintText: 'Enter First Name '),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: model.lastNameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'required field';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Last Name',
                                hintText: 'Enter Last Name '),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: model.phoneController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'required field';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'phone',
                                hintText: 'Enter User phone '),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: model.passwordController,
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
                              border: const OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter Password ',
                              suffixIcon: InkWell(
                                  onTap: _tooglePasswordView,
                                  child: const Icon(Icons.visibility)),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: model.passwordController,
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
                              border: const OutlineInputBorder(),
                              labelText: 'Confirm Password',
                              hintText: 'Enter Confirm Password ',
                              suffixIcon: InkWell(
                                  onTap: _tooglePasswordView,
                                  child: const Icon(Icons.visibility)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Text(
                    //     'Recovery Password',
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: AppButton.green(
                        title: "SignUp",
                        height: 50,
                        onTap: model.signUp,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Or  continue with',
                      style: TextStyle(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xffE7EFF5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: Center(
                            child: Image.asset('assets/images/instagram.jpeg'),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xffE7EFF5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: Center(
                            child: Image.asset('assets/images/linkin.jpeg'),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xffE7EFF5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xffE7EFF5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Image.asset('assets/images/fb.jpeg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Not a Member? ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Login In Here',
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.popAndPushNamed(
                                      context, loginRoute);
                                },
                            ),
                          ]),
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



// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   bool _isHidden = true;

//   void _tooglePasswordView() {
//     setState(() {
//       _isHidden = !_isHidden;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child:
//   }
// }
