import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:preview_1/giris.dart';

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFEDBD0),
          title: const Center(
            child: Text(
              'Login',
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
                  'Username',
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
                controller: myController,
                cursorColor: const Color(0xFF7D4F52),
                onChanged: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF7D4F52)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF7D4F52),
                      width: 2.10,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text('Password',
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
                cursorColor: const Color(0xFF7D4F52),
                onChanged: (value) {
                  print(value);
                },
                obscureText: hidePassword,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF7D4F52)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFF7D4F52),
                      width: 2.10,
                    ),
                  ),
                  prefixIcon: const Icon(
                    IconlyBold.lock,
                    color: Color(0xFF7D4F52),
                  ),
                  suffixIcon: IconButton(
                    icon: hidePassword
                        ? const Icon(
                            IconlyBold.hide,
                            color: Color(0xFF7D4F52),
                          )
                        : const Icon(
                            IconlyBold.show,
                            color: Color(0xFF7D4F52),
                          ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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
