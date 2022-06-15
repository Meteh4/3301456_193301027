import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:preview_1/Screens/HomeScreen.dart';
import 'package:preview_1/Screens/LoginScreen.dart';

class HoSc extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  HoSc({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log Out',
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
            auth.signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          icon: const Icon(IconlyBold.logout),
        ),
      ),
    );
  }
}
