import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:sportsapp/screens/login_selection.dart';

class ScreenOrganizer extends StatelessWidget {
  const ScreenOrganizer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //   return StreamBuilder<User?>(
  //     stream: context.watch<AuthProvider>().stream(),
  //     builder: (context, snapshot) {
  //       if(!snapshot.hasData) return const ScreenLoginSelection();
  //       return Scaffold(
  //         body: SafeArea(child: Text('OrgA')),
          
  //       );
  //     }
  //   );
  // }
  return Scaffold(
    body: SafeArea(child: Text('OrgA')),
  );

}
}