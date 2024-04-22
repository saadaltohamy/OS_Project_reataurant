import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:reataurant/auth/login.dart';
import 'package:reataurant/pages/homePage.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner:false,
        theme:ThemeData(
          textTheme:TextTheme(
            headline1:TextStyle(
                fontSize:30,
                fontWeight:FontWeight.w500,
                color:Colors.white
            ),
            headline2:TextStyle(
                fontSize:28,
                fontWeight:FontWeight.w500,
                color:Colors.white
            ),
            headline3:TextStyle(
                fontSize:20,
                fontWeight:FontWeight.w300,
                color:Colors.white
            ),
          ),
        ),
        home:(FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified) ? HomePage() : Login()
    );
  }
}