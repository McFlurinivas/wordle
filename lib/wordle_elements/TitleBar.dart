import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/providers/game_settings_provider.dart';

class WordleTitleBar extends StatelessWidget {
  const WordleTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
    AttemptToggle(),
    Text(
      'WORDLE',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    SizeToggle()
      ],
    );
  }
}

class SizeToggle extends ConsumerWidget {
  const SizeToggle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameSettingsNotifier = ref.read(gameSettingsProvider.notifier);

    void _updateWordSize() {
      var newWordSize = 5;
      if (gameSettings.wordsize == 4) {
        newWordSize = 5;
      }
      if (gameSettings.wordsize == 5) {
        newWordSize = 6;
      }
      if (gameSettings.wordsize == 6) {
        newWordSize = 4;
      }
      gameSettingsNotifier.updateWordsize(newWordSize);
    }

    return Container(
      child: OutlinedButton(
          onPressed: _updateWordSize,
          child: Text(gameSettings.wordsize.toString())),
      margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
    );
  }
}

class AttemptToggle extends ConsumerWidget {
  const AttemptToggle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameSettingsNotifier = ref.read(gameSettingsProvider.notifier);

    void _updateAttempt() {
      var newAttempt = 6;
      if (gameSettings.attempts == 4) {
        newAttempt = 5;
      }
      if (gameSettings.attempts == 5) {
        newAttempt = 6;
      }
      if (gameSettings.attempts == 6) {
        newAttempt = 4;
      }
      gameSettingsNotifier.updateAttempts(newAttempt);
    }

    String text;
    switch (gameSettings.attempts) {
      case 4:
        text = "HIGH";
        break;
      case 5:
        text = "MED";
        break;
      case 6:
      default:
        text = "LOW";
        break;
    }

    return Container(
      child: OutlinedButton(
        onPressed: _updateAttempt,
        child: Text(text),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
    );
  }
}
