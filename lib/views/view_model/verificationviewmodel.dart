import 'package:auth_ui/baseview_model.dart';
import 'package:auth_ui/router/route.dart';
import 'package:auth_ui/services/auth_service.dart';
import 'package:auth_ui/services/navigation_service.dart';
import 'package:flutter/material.dart';

class VerificationViewModel extends BaseViewModel {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  final AuthService _authService = AuthService.instance;
  final NavigationService _navigationService = NavigationService.instance;

  String get email => _authService.userEmail;
  sendOTP() async {
    if (!formkey.currentState!.validate()) return;

    setBusy(ViewState.Busy);

    ///
    bool result = await _authService.sendOTPVerification(otpController.text);
    if (result) {
      // _navigationService.navigateTo(registerRoute);
      NavigationService.instance.navigateTo(signupRoute);
    }
    setBusy(ViewState.Idle);
  }
}
