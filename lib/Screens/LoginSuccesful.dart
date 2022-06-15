import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:preview_1/Screens/FirstPage.dart';
import 'package:preview_1/Screens/HomeScreen.dart';


class LoggedIn extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  LoggedIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'You Succesfully logged in',
          style: TextStyle(
            color: Color(0xFF442B2D),
            fontSize: 25.0,
          ),
        ),
        backgroundColor: const Color(0xFFFEDBD0),
      ),
      body: Center(
        child: ActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MyApp()));
          },
          icon: const Icon(IconlyBold.logout),
        ),
      ),
    );
  }
}
