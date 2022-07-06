// ignore_for_file: sized_box_for_whitespace

import 'package:auth_ui/widgets/appbutton.dart';
import 'package:auth_ui/widgets/loader.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'view_model/verificationviewmodel.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

final _verificationViewModelProvider =
    ChangeNotifierProvider<VerificationViewModel>(
        (ref) => VerificationViewModel());

class VerificationScreen extends ConsumerWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(_verificationViewModelProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Loader(
        isBusy: model.isBusy,
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                // Container(
                //   width: double.infinity,
                //   height: 100,
                //   decoration: const BoxDecoration(
                //       // image: DecorationImage(
                //       //     image: AssetImage(
                //       //       "assets/images/img2.jpg",
                //       //     ),
                //       //     fit: BoxFit.fill),
                //       ),
                //   child: const Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 50),
                //       child: Text('logo')),
                // ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AppText.heading1(
                        //   "Verify Email",
                        //   color: kTextColor,
                        // ),
                        Text('verify Email'),
                        const SizedBox(
                          height: 16,
                        ),
                        // AppText.caption(
                        //   "Enter the code sent to ${model.email}.",
                        //   color: kTextColor,
                        // ),
                        Text("Enter the code sent to ${model.email}"),
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          key: model.formkey,
                          child: PinCodeTextField(
                            controller: model.otpController,
                            appContext: context,
                            length: 6,
                            onChanged: (value) {},
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "OTP Code cannot be empty";
                              } else if (value.length < 5) {
                                return "Please completly fill your OTP code";
                              }
                              return null;
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(10),
                              fieldWidth: 45,
                              inactiveColor: Colors.grey,
                              activeColor: Colors.grey,
                              selectedColor: Colors.black,
                              errorBorderColor: Colors.red,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Center(
                          child:
                              //  AppText.caption(
                              //   "Already have an account?Login instead",
                              //   color: kTextColor,
                              // ),
                              Text('Already have an account instead'),
                        ),
                        const SizedBox(height: 24),
                        // AppButton.green(
                        //   title: "Continue",
                        //   height: 50,
                        //   onTap: model.sendOTP,
                        // ),
                        AppButton.green(
                          title: "Continue",
                          height: 50,
                          onTap: model.sendOTP,
                        ),
                        // TextButton(
                        //     onPressed: () {
                        //       model.sendOTP();
                        //     },
                        //     child: const Text('continue'))
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
