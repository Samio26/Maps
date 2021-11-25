// @dart=2.9

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testh/pages/homePage.dart';
import 'package:testh/pages/login.dart';
import 'package:testh/pages/register.dart';

bool isLogin;
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user=FirebaseAuth.instance.currentUser;
  if(user==null){
    isLogin=false;
  }else{
    isLogin=true;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:isLogin==false?LoginPage():HomePage(), 
      routes: {
        'log':(context)=>Register(),
        'Home':(context)=>HomePage(),
        "login":(context)=>LoginPage(),
      },
    );
  }
}
