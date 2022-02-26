import 'package:flutter/material.dart';
import 'package:sportsapp/screens/admin_org.dart';
import 'package:sportsapp/screens/admin_user.dart';
import 'package:sportsapp/screens/admin_view.dart';
import 'package:sportsapp/screens/login_admin.dart';

class ScreenAdminViewSelection extends StatelessWidget {
  const ScreenAdminViewSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: SafeArea(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 180),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => ScreenAdmin()));
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded)),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => ScreenAdminOrg(),
                ),
              );
            },
            child: Text(
              'Tournaments',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            style: OutlinedButton.styleFrom(
              primary: Colors.grey[700],
              fixedSize: Size(200, 50),
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.grey),
            ),
          ),
          SizedBox(height: 20,),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => ScreenAdminUser(),
                ),
              );
            },
            child: Text(
              'Registered User',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            style: OutlinedButton.styleFrom(
              primary: Colors.grey[700],
              fixedSize: Size(200, 50),
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.grey),
            ),
          ),
        ],
      )),
    );
  }
}
