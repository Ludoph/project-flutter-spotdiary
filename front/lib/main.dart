import 'package:flutter/material.dart';
// import 'package:spotidary/controller/MessageController.dart';
import 'package:spotidary/view/welcome_page.dart';
import 'widget/delayed_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spot Diary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}
