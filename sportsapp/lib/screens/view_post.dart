import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsapp/screens/login_selection.dart';
import 'package:sportsapp/screens/organizer_page.dart';

class ScreenPost extends StatelessWidget {
  const ScreenPost({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Padding(
                padding: const EdgeInsets.only(left: 330, top: 13),
                child: IconButton(
                    onPressed: () {
                      clearData();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => ScreenLoginSelection()));
                    },
                    icon: Icon(
                      Icons.logout_rounded,
                      color: Colors.black,
                    )),
              ),
          Text('Post'),
          Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenOrganizer()));
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: Size(200, 50),
                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
              ),
        ],
      ),
      ),
      
      
    );
  }

 Future<bool> clearData() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    return prefe.clear();
  }
}