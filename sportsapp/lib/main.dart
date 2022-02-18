import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/auth_provider.dart';
import 'package:sportsapp/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({ Key? key }) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(FirebaseAuth.instance),),
        StreamProvider(create: (context)=> context.watch<AuthProvider>().stream(), initialData: null)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Colors.blue,
        ),
      //  home: ScreenLoginSelection(),
      home: ScreenSplash(),

      ),
    );
  }
}