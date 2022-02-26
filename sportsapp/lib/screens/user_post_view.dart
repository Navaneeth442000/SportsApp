import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsapp/screens/login_selection.dart';
import 'package:sportsapp/screens/user_page.dart';

class ScreenUserPostView extends StatefulWidget {
  const ScreenUserPostView({ Key? key }) : super(key: key);

  @override
  State<ScreenUserPostView> createState() => _ScreenUserPostViewState();
}

class _ScreenUserPostViewState extends State<ScreenUserPostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
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
                    color: Colors.white,
                  )),
            ),
            Text('Tournament',style: TextStyle(color: Colors.white,fontSize: 20),),
            SizedBox(height: 20,),
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
                          leading: Text(document["Sport"],style: TextStyle(color: Colors.white),),
                          title: Text(document["OrgName"],style: TextStyle(color: Colors.white),),
                          subtitle: Column(
                            children: [
                              Text(document["Place"],style: TextStyle(color: Colors.white),),
                              Row(
                                children: [
                                  Text('Price',style: TextStyle(color: Colors.white),),
                                  Text(document["Price"],style: TextStyle(color: Colors.white),),
                                ],
                              )
                            ],
                          ),
                          trailing: Column(
                            children: [
                              Text(document["Date"],style: TextStyle(color: Colors.white),),
                              Text(document["Time"],style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                              
                              return ScreenUser();

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