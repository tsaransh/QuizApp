import 'package:flutter/material.dart';

class AnswerButtonStyle extends StatelessWidget {
  const AnswerButtonStyle(
      {super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            backgroundColor: const Color.fromARGB(255, 32, 110, 212),
            foregroundColor: Colors.white),
        child: Text(answerText, textAlign: TextAlign.center));
  }
}
