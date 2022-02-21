// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sportsapp/auth_provider.dart';
// import 'package:sportsapp/main.dart';
// import 'package:sportsapp/screens/login_selection.dart';
// import 'package:provider/provider.dart';
// import 'package:sportsapp/screens/organizer_page.dart';

// class ScreenSplash extends StatefulWidget {
//   const ScreenSplash({ Key? key }) : super(key: key);

//   @override
//   State<ScreenSplash> createState() => _ScreenSplashState();
// }


// class _ScreenSplashState extends State<ScreenSplash> {
//   @override
//   void initState() {
//   //  gotoLogin();
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: context.watch<AuthProvider>().stream(),
//       builder: (context, snapshot) {
//         if(!snapshot.hasData) return ScreenOrganizer();
//         return Scaffold(
//           body: Center(
//             child: Image.asset(
//               'assets/images/splas_img.jpg',
//               height: 350,
//               width: 350,
//             ),
//           ),
//         );
//       }
//     );
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   Future<void> gotoLogin() async {
//     await Future.delayed(Duration(seconds: 3));
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (ctx) => ScreenLoginSelection(),
//       ),
//     );
//   }
//   // Future<void> checkUserLoggedIn() async {
//   //   final _sharedPrefs = await SharedPreferences.getInstance();
//   //   final  _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
//   //   if(_userLoggedIn == null || _userLoggedIn == false)
//   //   {
//   //     gotoLogin();
//   //   }
//   //   else{
//   //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenOrganizer()));
//   //   }
//   // }
// }