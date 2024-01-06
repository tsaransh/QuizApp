import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opacity(
        //   opacity: 0.6,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 200,
        //   ),
        // ),

        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),

        const SizedBox(height: 36),
        Text(
          'To start Quiz click on the below button',
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 6, 49, 105)),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('start quiz'),
        )
      ],
    ));
  }
}
