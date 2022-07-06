import 'package:auth_ui/router/app_router.dart';
import 'package:auth_ui/router/route.dart';
import 'package:auth_ui/services/navigation_service.dart';
import 'package:auth_ui/views/SplashScreen.dart';
// import 'package:auth_ui/views/SplashScreen.dart';
// import 'package:auth_ui/views/authpage.dart';
import 'package:auth_ui/views/signup.dart';
import 'package:auth_ui/views/emailverification.dart';
import 'package:auth_ui/views/verificationscreen.dart';
// import 'package:auth_ui/views/verify_email_View.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'views/loginscreen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      home: const SplashScreen(),
      // EmailVerificationView(),
      // routes: {
      //   loginRoute: (context) => const LoginView(),
      //   registerRoute: (context) => const RegisterPage(),
      //   // homeRoute: (context) => const homeView(),
      //   emailverificationRoute: (context) => const EmailVerificationView(),
      // },
      //  SplashScreen(),
    );
  }
}
