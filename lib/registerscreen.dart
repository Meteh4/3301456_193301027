import 'package:flutter/material.dart';
import 'package:preview_1/main.dart';

void main() {
  runApp(const RegisterScreen());
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RegisterScreen',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFEDBD0),
          title: const Center(
            child: Text(
              'Register',
              style: TextStyle(
                color: Color(0xFF442B2D),
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Choose an Username',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF442B2D),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  print(value);
                },
                obscureText: hidePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10), 
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text('Choose a Password',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF442B2D),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  print(value);
                },
                obscureText: hidePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: hidePassword
                        ? const Icon(Icons.visibility_off_rounded)
                        : const Icon(Icons.visibility_rounded),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
