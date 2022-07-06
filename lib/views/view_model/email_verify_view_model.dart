import 'package:auth_ui/router/route.dart';
import 'package:auth_ui/services/auth_service.dart';
import 'package:auth_ui/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../baseview_model.dart';

class EmailVerificationViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService.instance;

  /// send email for verification
  verifyEmail() async {
    // check if all inputs are correct
    // if no stop function
    if (!formKey.currentState!.validate()) return;
    // set state to busy
    setBusy(ViewState.Busy);
    // calling server to send verification mail
    bool result = await _authService.emailVerification(emailController.text);
    // go to verification view if communication with server was suceful
    if (result) {
      //to verification
      NavigationService.instance.navigateTo(verificationRoute);
    }
    // chage state from busy to idle
    setBusy(ViewState.Idle);
  }

  // / go to login view
  toLogin() {
    NavigationService.instance.navigateToReplace(loginRoute);
  }
}
