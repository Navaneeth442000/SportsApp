import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsapp/main.dart';
import 'package:sportsapp/screens/login_selection.dart';
import 'package:sportsapp/screens/organizer_page.dart';
import 'package:sportsapp/screens/user_page.dart';
import 'package:sportsapp/screens/view_post.dart';
// import 'package:sportsapp/screens/login_selection.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

Future<bool> CheckLogin() async {
  SharedPreferences prf = await SharedPreferences.getInstance();
  return prf.getBool('isLoggedIn') ?? false;
}

Future<String> CheckType() async {
  SharedPreferences prf = await SharedPreferences.getInstance();
  String? Type = prf.getString('Type');
  return Type!;
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // gotoLogin();
    super.initState();
    // Timer(Duration(seconds:3), (){
    Timer(
        Duration(seconds: 5),
        () => {
              CheckLogin().then((isLogged) => isLogged
                  ? CheckType() == 'Organizer' ? Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) {
                      return ScreenPost();
                    })):Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) {
                      return ScreenUser();}))
                  : Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) {
                      return ScreenLoginSelection();
                    }))) as bool
            });

    // });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splas_img.jpg',
          height: 350,
          width: 350,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // Future<void> gotoLogin() async {
  //   await Future.delayed(Duration(seconds: 3));
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (ctx) => ScreenLoginSelection(),
  //     ),
  //   );
  // }

  //  Future<void> checkUserLoggedIn() async {
  //   final _sharedPrefs = await SharedPreferences.getInstance();
  //   final  _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
  //   if(_userLoggedIn == null || _userLoggedIn == false)
  //   {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLoginSelection()));
  //   }
  //   else{
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenOrganizer()));
  //   }
  // }
}
