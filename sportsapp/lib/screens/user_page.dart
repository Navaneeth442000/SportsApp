import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsapp/screens/login_selection.dart';
import 'package:sportsapp/screens/user_post_view.dart';

class ScreenUser extends StatefulWidget {
  const ScreenUser({ Key? key }) : super(key: key);

  @override
  State<ScreenUser> createState() => _ScreenUserState();
}

class _ScreenUserState extends State<ScreenUser> {
    final TextEditingController _orgName = TextEditingController();
    CollectionReference reg = FirebaseFirestore.instance.collection('Interested');
  late String teamname;
  late String place;
  late String totalmember;
  late String mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0,),
                child: IconButton(onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenUserPostView()));
                }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  teamname = value;
                },
                // controller: _orgName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Team Name',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  place = value;
                },
                // controller: _orgName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.place,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Place',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  totalmember = value;
                },
                // controller: _orgName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Team Members',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  mobile = value;
                },
                // controller: _orgName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Mobile',
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                  onPressed: () async {

                     await reg.add({
                      'TeamName' : teamname,
                      'Place' : place,
                      'TotalMember' : totalmember,
                      'Mobile' : mobile,
                    }).then((value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenUserPostView()));
                    });
                    
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
      ),
    );
  }

  Future<bool> clearData() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    return prefe.clear();
  }
}