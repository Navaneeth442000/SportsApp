// import 'dart:html';
// import 'dart:js';

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsapp/screens/login_selection.dart';
import 'package:sportsapp/screens/organizer_page.dart';
import 'package:sportsapp/screens/organizer_post.dart';

class ScreenPost extends StatefulWidget {
  const ScreenPost({Key? key}) : super(key: key);

  @override
  State<ScreenPost> createState() => _ScreenPostState();
}

class _ScreenPostState extends State<ScreenPost> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => ScreenOrganizer()));
          });
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 270,top:13),
                  child: TextButton(onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenOrganizerPost()));
                  }, child: Text('View')),
                ),
                IconButton(
                    onPressed: () {
                      
                      clearData();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => ScreenLoginSelection()));
                    },
                    icon: Icon(
                      Icons.logout_rounded,
                      color: Colors.black,
                    )),
              ],
            ),
            Text('Post'),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("posts").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return Expanded(
                    child: ListView(
                      children: snapshot.data!.docs.map((document) {
                        return ListTile(
                          leading: Text(document["Sport"]),
                          title: Text(document["OrgName"]),
                          subtitle: Column(
                            children: [
                              Text(document["Place"]),
                              Row(
                                children: [
                                  Text('Price'),
                                  Text(document["Price"]),
                                ],
                              )
                            ],
                          ),
                          trailing: Column(
                            children: [
                              Text(document["Date"]),
                              Text(document["Time"]),
                            ],
                          ),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                              
                              return ScreenOrganizer();

                            }));
                          },
                        );
                      }).toList(),
                    ),
                  );
                }
              },
            )
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
