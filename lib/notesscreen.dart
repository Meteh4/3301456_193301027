import 'package:flutter/material.dart';
import 'package:preview_1/giris.dart';
import 'package:preview_1/homescreen.dart';

import 'addnotescreen.dart';

void main() => runApp(const MyApp());

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: const Color(0xFFFEEAE6),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: 25,
              itemBuilder: (context, index) {
                return FakeItem(isBig: index.isOdd);
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          backgroundColor: const Color(0xFF7D4F52),
          foregroundColor: const Color(0xFFFEEAE6),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNoteScreen()),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Notes'),
        ));
  }
}
