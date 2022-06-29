import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE8EAF6),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffD897FC),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: SvgPicture.network('https://mppxs.csb.app/happy.svg'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Discover Your \n Dream job Here',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Explore all the most exiting jobs roles \n based on your  interest and stufy major',
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                    color: Color(0xffE8EAF6),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                  Container(
                    height: 70,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
