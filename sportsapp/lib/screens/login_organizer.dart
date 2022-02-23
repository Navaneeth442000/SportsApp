import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportsapp/auth_provider.dart';
import 'package:sportsapp/screens/login_selection.dart';
import 'package:sportsapp/screens/organizer_page.dart';
import 'package:sportsapp/screens/signup_organizer.dart';
import 'package:provider/provider.dart';
import 'package:sportsapp/screens/organizer_view_post.dart';

class ScreenOrganizerLogin extends StatefulWidget {
  const ScreenOrganizerLogin({ Key? key }) : super(key: key);

  @override
  State<ScreenOrganizerLogin> createState() => _ScreenOrganizerLoginState();
}

class _ScreenOrganizerLoginState extends State<ScreenOrganizerLogin> {

  

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signIn(AuthProvider provider)async {
    final msg = await provider.signIn(_usernameController.text, _passwordController.text);

    if(msg == '') {
      setData();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenPost()));
    };
    

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }


  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
            resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                      child: IconButton(onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLoginSelection()));
                          }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 25.0),
                      child: Text(
                        'Sign in back into your account',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent[700],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                        bottomRight: Radius.circular(70),
                        bottomLeft: Radius.circular(10),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'Username',
                              labelStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              // hintText: 'Username',
                            ),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Enter Username';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              // hintText: 'Password',
                            ),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Enter Password';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                          ),
                          if(authProvider.loading)
                          const CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                           if(!authProvider.loading)
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () => signIn(authProvider),
                              // {
                              //   if (_formKey.currentState!.validate()) {
                              //     checkLogin(context);
                              //   } else {}
                              // },
                              child: const Text(
                                'Sign In',
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
                          //  if(authProvider.loading)
                          // const CircularProgressIndicator(
                          //   strokeWidth: 2,
                          // ),
                          //  if(!authProvider.loading)


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account yet?"),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => ScreenSignupOrganizer(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          // style: TextStyle(
                          //   color: Colors.lightGreenAccent[700],
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> setData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLoggedIn', true);
    pref.setString('Type', 'Organizer');
  }
  // Future<void> checkLogin(BuildContext ctx) async {
  //   final _username = _usernameController.text;
  //   final _password = _passwordController.text;
  //   if (_username == 'admin' && _password == 'admin') {
  //     // Goto Donor Page
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (ctx) => ScreenOrganizer()));
  //   } else {
  //     print('Invalid');
  //   }
  // }

}