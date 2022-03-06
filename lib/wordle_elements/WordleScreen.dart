import 'package:flutter/material.dart';
import 'package:wordle/wordle_elements/Grid.dart';
import 'package:wordle/wordle_elements/TitleBar.dart';
import 'package:wordle/wordle_elements/Keyboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WordleTitleBar(),
              WordleGrid(),
              WordleKeyboard()
            ],
          ),
        ),
      ),
    );
  }
}
