import 'package:auth_ui/baseview_model.dart';
import 'package:auth_ui/router/route.dart';
import 'package:auth_ui/services/auth_service.dart';
import 'package:auth_ui/services/navigation_service.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService.instance;
  signUp() async {
    if (!formKey.currentState!.validate()) return;

    setBusy(ViewState.Busy);
    bool result = await _authService.signUp(
      firstname: firstNameController.text,
      lastname: lastNameController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );
    if (result) {
      print("Complete");
      // NavigationService.instance.navigateTo(homeRoute);
    }
    setBusy(ViewState.Idle);
  }
}
