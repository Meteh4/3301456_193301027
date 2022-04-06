import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:preview_1/secretnotes.dart';
import 'package:iconly/iconly.dart';
import 'package:preview_1/infoscreen.dart';
import 'package:preview_1/loginscreen.dart';

import 'homescreen.dart';
import 'notesscreen.dart';
import 'remindersscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [
    const HomeScreen(),
    const NotesScreen(),
    const RemindersScreen(),
    const SecretNotesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              IconlyBold.info_square,
              color: Color(0xFF442B2D),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InfoScreen()),
              );
            },
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: const Text(
          'Welcome',
          style: TextStyle(
            color: Color(0xFF442B2D),
            fontSize: 25.0,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFFFEDBD0),
      ),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                backgroundColor: Color(0xFFFEEAE6),
                activeIcon: Icon(Icons.home_rounded)),
            BottomNavigationBarItem(
              icon: Icon(Icons.sticky_note_2_outlined),
              label: 'Notes',
              backgroundColor: Color(0xFFFEEAE6),
              activeIcon: Icon(Icons.sticky_note_2_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(IconlyLight.tick_square),
              label: 'Reminders',
              backgroundColor: Color(0xFFFEEAE6),
              activeIcon: Icon(IconlyBold.tick_square),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_outline_rounded),
              label: 'Secret Notes',
              backgroundColor: Color(0xFFFEEAE6),
              activeIcon: Icon(Icons.lock_rounded),
            ),
          ],
          currentIndex: selectedPage,
          selectedItemColor: const Color(0xFF442B2D),
          unselectedItemColor: const Color(0xFF7D4F52),
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          }),
    );
  }
}
