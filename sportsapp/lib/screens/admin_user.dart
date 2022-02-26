import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/screens/admin_selection.dart';

class ScreenAdminUser extends StatelessWidget {
  const ScreenAdminUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 13),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      ScreenAdminViewSelection()));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ),
            Text(
              'Registered Users',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20,),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Interested")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return Expanded(
                    child: ListView(
                      children: snapshot.data!.docs.map((document) {
                        return ListTile(
                          leading: Text(document["TeamName"]),
                          title: Text(document["Place"]),
                          subtitle: Row(
                            children: [
                              Text('Players :'),
                              Text(document["TotalMember"]),
                            ],
                          ),
                          trailing: Text(document["Mobile"]),
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {

                            //   return ScreenOrganizer();

                            // }));
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
}
