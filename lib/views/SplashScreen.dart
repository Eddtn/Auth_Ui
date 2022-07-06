import 'package:auth_ui/router/route.dart';
import 'package:auth_ui/views/emailverification.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/img1.jpg"),
            //   fit: BoxFit.fill,
            // ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, authScreenRoute);
                  },
                  child: const Text("splash screen"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
