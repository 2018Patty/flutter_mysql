import 'package:flutter/material.dart';
import 'package:fluttermysql/pages/getuser.dart';

import 'package:splashscreen/splashscreen.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.5;
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: Getuser(),
        title: Text(
          'Address Book',
          // style: TextStyle(fontSize: 15, fontFamily: 'BaiJamjuree', fontWeight: FontWeight.bold),
          style: Theme.of(context).textTheme.headline3,
        ),
        image: Image.asset(
          'images/addressbook.png',
          height: height,
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(color: Colors.deepPurple),
        photoSize: 60.0,
        loaderColor: Colors.pinkAccent);
  }
}
