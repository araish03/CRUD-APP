import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/authentication/wrapper.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
   TextEditingController email = TextEditingController();

  reset() async {
    
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: email.text);
   
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
         appBar: AppBar(
        title: Text("Forgot Password",
        style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255), // Optional: Change text color
                ),),
        
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reset Your Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: 'Enter email',
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          
         
            ElevatedButton(
              onPressed: (()=>reset()),
              child: Text("Send Link"),
              style: ElevatedButton.styleFrom(
               
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}