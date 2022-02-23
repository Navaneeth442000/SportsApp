import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/screens/login_selection.dart';
import 'package:sportsapp/screens/organizer_view_post.dart';

class ScreenOrganizerPost extends StatefulWidget {
  const ScreenOrganizerPost({ Key? key }) : super(key: key);

  @override
  State<ScreenOrganizerPost> createState() => _ScreenOrganizerPostState();
}

class _ScreenOrganizerPostState extends State<ScreenOrganizerPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (ctx) => ScreenPost()));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ),
            Text('Interested'),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("Interested").snapshots(),
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
                          onTap: (){
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

  // Future<bool> clearData() async {
  //   SharedPreferences prefe = await SharedPreferences.getInstance();
  //   return prefe.clear();
  // }
}
      
//     );
//   }
// }