
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotidary/view/login_page.dart';
import 'package:spotidary/view/welcome_page.dart';
import 'package:spotidary/widget/delayed_animation.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: d_green,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          DelayedAnimation(
              delay: 500,
              child: Container(
                height: 200,
                child: Image.asset('images/protologo.png'),
              )),
          DelayedAnimation(
              delay: 1000,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    Text(
                      'Commencez votre histoire',
                      style: GoogleFonts.poppins(
                          color: d_green,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Explorez, partagez et découvrez les lieux en racontant leurs histoires',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              )),
          DelayedAnimation(
              delay: 2000,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: d_green,
                        shape: LinearBorder(),
                        padding: EdgeInsets.all(13)),
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => LoginPage())
                          );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mail_outline_outlined
                          ),
                          SizedBox(width: 10, height: 16,) ,
                          Text('EMAIL', 
                            style: 
                              GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)
                            ,)]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        shape: LinearBorder(),
                        padding: EdgeInsets.all(13)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.facebook
                          ),
                          SizedBox(width: 10,) ,
                          Text('FACEBOOK', 
                            style: 
                              GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)
                            ,)]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: LinearBorder(),
                        padding: EdgeInsets.all(13)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login,
                            color: d_green,
                          ),
                          SizedBox(width: 10,) ,
                          Text('GOOGLE', 
                            style: 
                              GoogleFonts.poppins(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)
                            ,
                          )]),
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}