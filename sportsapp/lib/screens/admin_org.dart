import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsapp/screens/admin_selection.dart';

class ScreenAdminOrg extends StatelessWidget {
  const ScreenAdminOrg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => ScreenAdminViewSelection()));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    )),
              ],
            ),
            Text(
              'Post',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
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
                          leading: Text(
                            document["Sport"],
                            style: TextStyle(color: Colors.white),
                          ),
                          title: Text(
                            document["OrgName"],
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Column(
                            children: [
                              Text(
                                document["Place"],
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Price',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    document["Price"],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                          trailing: Column(
                            children: [
                              Text(
                                document["Date"],
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                document["Time"],
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
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
