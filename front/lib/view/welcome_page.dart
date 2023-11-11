import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotidary/view/social_page.dart';
import 'package:spotidary/widget/delayed_animation.dart';

const d_green = const Color(0xFF47513B);


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
                delay: 2000,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: d_green,
                        shape: LinearBorder(),
                        padding: EdgeInsets.all(13)),
                    child: Text('Let\'s Go !!!', 
                      style: 
                        GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w200),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SocialPage(),
                          ),
                      );
                    },
                  ),
                )),

            ],
          ),
        ),
      ),
    );
  }
}
