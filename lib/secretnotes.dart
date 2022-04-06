import 'package:flutter/material.dart';
import 'package:preview_1/giris.dart';

void main() => runApp(const MyApp());

class SecretNotesScreen extends StatefulWidget {
  const SecretNotesScreen({Key? key}) : super(key: key);

  @override
  State<SecretNotesScreen> createState() => _SecretNotesScreenState();
}

class _SecretNotesScreenState extends State<SecretNotesScreen> {
  String _textString = 'Work in Proccess :';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _textString,
          style: const TextStyle(fontSize: 30),
        ),
        TextField(
          //                       <--- TextField
          onChanged: (text) {
            _doSomething(text);
          },
        )
      ],
    );
  }

  void _doSomething(String text) {
    setState(() {
      _textString = text;
    });
  }
}
