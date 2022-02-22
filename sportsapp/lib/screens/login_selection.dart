import 'package:flutter/material.dart';
import 'package:sportsapp/screens/login_organizer.dart';
import 'package:sportsapp/screens/login_user.dart';

class ScreenLoginSelection extends StatelessWidget {
  const ScreenLoginSelection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              // flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Welcome',
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 43,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  // color: Colors.black,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => ScreenOrganizerLogin(),
                              ),
                            );
                          },
                          child: Text(
                            'Organizer',
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
                        SizedBox(
                          height: 17,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => ScreenUserLogin(),
                              ),
                            );
                          },
                          child: Text(
                            'User',
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
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}