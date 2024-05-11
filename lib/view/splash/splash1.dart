import 'package:e_commerce/view/splash/splash_2.dart';
import 'package:flutter/material.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff704f38),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Splash2()));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/71.jpg",
                fit: BoxFit.fill,
                width: MediaQuery.sizeOf(context).width - 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
