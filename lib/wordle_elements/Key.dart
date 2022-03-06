import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/game_status_provider.dart';

class WordleKey extends ConsumerWidget {
  final String letter;

  const WordleKey(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mediaQuery = MediaQuery.of(context).size;
    Widget keyCap;
    if (letter == "_") {
      keyCap = const Icon(Icons.keyboard_return, size: 20);
    } else if (letter == '<') {
      keyCap = const Icon(
        Icons.backspace_outlined,
        size: 20,
      );
    } else {
      keyCap = Text(
        letter.toUpperCase(),
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
    }

    return InkWell(
      child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color.fromARGB(44, 44, 44, 44),
          ),
          child: keyCap),
      onTap: () {
        ref.read(gameStateProvider.notifier).updateCurrentAttempt(letter);
      },
    );
  }
}
