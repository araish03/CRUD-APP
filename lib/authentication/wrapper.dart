import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_flutter_app/authentication/login.dart';
import 'package:my_flutter_app/pages/home.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context,snapshot)
        {
          if(snapshot.hasData)
          {
            return Home();
          }
          else{
            return Login();
          }
        }),
    );
  }
}