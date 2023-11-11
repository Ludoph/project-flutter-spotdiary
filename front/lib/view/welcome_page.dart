import 'package:flutter/material.dart';
import 'package:spotidary/widget/delayed_animation.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          child: Column(
            children: [
              DelayedAnimation(
                  delay: 500,
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 400,
                  )
              ),
              DelayedAnimation(
                  delay: 1000,
                  child: Container(
                    child: Image.asset('images/protologo.png'),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
