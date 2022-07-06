import 'package:auth_ui/router/route.dart';
import 'package:auth_ui/views/view_model/email_verify_view_model.dart';
import 'package:auth_ui/widgets/appbutton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/loader.dart';

final _emailVerificationViewModelProvider =
    ChangeNotifierProvider<EmailVerificationViewModel>(
  (ref) => EmailVerificationViewModel(),
);

class EmailVerificationView extends ConsumerWidget {
  const EmailVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(_emailVerificationViewModelProvider);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Loader(
        isBusy: model.isBusy,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffE7EFF5),
            body: ListView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Email Verification Page! ',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
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
                            'Verify Email',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: model.formKey,
                          child: TextFormField(
                            controller: model.emailController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'required field';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                hintText: 'Enter Your Email '),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        AppButton.green(
                          title: "Continue",
                          height: 50,
                          onTap: model.verifyEmail,
                        ),

                        // TextButton(
                        //     onPressed: () {
                        //       onTap: model.verifyEmail;
                        //     },
                        //     child: const Text('verify Nows'))
                        // Container(
                        //   height: 60,
                        //   width: 300,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: const Color(0xffFD6B68),
                        //   ),
                        //   child: const Center(
                        //     child: Text(
                        //       'Verify Now',
                        //       style: TextStyle(color: Colors.white),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
