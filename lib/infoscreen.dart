import 'package:flutter/material.dart';
import 'package:preview_1/giris.dart';

void main() => runApp(const MyApp());

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final String _textString = 'Work in Proccess :';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              color: Colors.white,
              child: const Text(
                'Bu Ekran henüz işlevsel değil.',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
