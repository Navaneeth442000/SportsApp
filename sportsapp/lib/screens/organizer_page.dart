import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsapp/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:sportsapp/screens/login_selection.dart';
import 'package:sportsapp/screens/view_post.dart';

class ScreenOrganizer extends StatefulWidget {
  const ScreenOrganizer({Key? key}) : super(key: key);

  @override
  State<ScreenOrganizer> createState() => _ScreenOrganizerState();
}

class _ScreenOrganizerState extends State<ScreenOrganizer> {
  // final TextEditingController _orgName = TextEditingController();
  // final TextEditingController _place = TextEditingController();
  // final TextEditingController _date = TextEditingController();
  // final TextEditingController _time = TextEditingController();
  // final TextEditingController _price = TextEditingController();



  String dropDownValue = "Foot Ball";
  var items = ["Foot Ball", "Cricket", "Badminton", "VolleyBall"];

  CollectionReference post = FirebaseFirestore.instance.collection('posts');
  late String orgname;
  late String place;
  late String date;
  late String time;
  late String price;


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
              // Padding(
              //   padding: const EdgeInsets.only(left: 330, top: 13),
              //   child: IconButton(
              //       onPressed: () {
              //         clearData();
              //         Navigator.of(context).pushReplacement(MaterialPageRoute(
              //             builder: (ctx) => ScreenLoginSelection()));
              //       },
              //       icon: Icon(
              //         Icons.logout_rounded,
              //         color: Colors.white,
              //       )),
              // ),
              Text(
                'Register Tournament',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                // controller: _orgName,
                onChanged: (value) {
                  orgname = value;
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Organization Name',
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
              Theme(
                data: Theme.of(context).copyWith(canvasColor: Colors.black),
                child: DropdownButtonFormField(
                  value: dropDownValue,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.w)
                  // ),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  // hint: Text("select"),
                  onChanged: (String? newValue) {
                    // FocusScope.of(context).requestFocus(new FocusNode());
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
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
                // controller: _place,
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
                  date = value;
                },
                
                // controller: _date,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Date',
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
                  time = value;
                },
                // controller: _time,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.timelapse,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Time',
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
                  price = value;
                },
                // controller: _price,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.money,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Cash Price',
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
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: ()  {

                    //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenPost()));
                     post.add({
                      'OrgName' : orgname,
                      'Sport' : dropDownValue,
                      'Place' : place,
                      'Date' : date,
                      'Time' : time,
                      'Price' : int.parse(price),
                    }).then((value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenPost()));
                    });

                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenPost()));
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

  // Future<bool> clearData() async {
  //   SharedPreferences prefe = await SharedPreferences.getInstance();
  //   return prefe.clear();
  // }
}
