import 'package:auth_ui/router/route.dart';
import 'package:auth_ui/views/authpage.dart';
import 'package:auth_ui/views/homeview.dart';
import 'package:auth_ui/views/loginscreen.dart';
import 'package:auth_ui/views/signup.dart';
import 'package:auth_ui/views/emailverification.dart';
import 'package:auth_ui/views/verificationscreen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case signupRoute:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case emailverificationRoute:
        return MaterialPageRoute(
            builder: (context) => const EmailVerificationView());
      case verificationRoute:
        return MaterialPageRoute(
            builder: (context) => const VerificationScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeViewScreen());
      case authScreenRoute:
        return MaterialPageRoute(builder: (context) => const AuthScreen());
      // case ForgotPasswordViewRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const ForgotPasswordView());
      // case ResetPasswordViewRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const ResetPasswordView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
