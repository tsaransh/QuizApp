import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button_style.dart';
import 'package:quiz_app/data/quiz_questions_data_loader.dart';
import 'package:quiz_app/model/quiz_questions.dart';

class QuizQuestionScreen extends StatefulWidget {
  const QuizQuestionScreen(this.selectedAnswer, {super.key});

  final void Function(String answer) selectedAnswer;

  @override
  State<QuizQuestionScreen> createState() {
    return _QuizQuestionState();
  }
}

class _QuizQuestionState extends State<QuizQuestionScreen> {
  var currentQuetionIndex = 0;

  void showNextQuestion(String answer) {
    widget.selectedAnswer(answer);

    setState(() {
      if (currentQuetionIndex + 1 < QuizQuestionLoader().quizQuestions.length) {
        currentQuetionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestions currentQuestion =
        QuizQuestionLoader().quizQuestions[currentQuetionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ...currentQuestion.getSuffledAnswer().map((answer) {
              return Padding(
                padding: const EdgeInsets.all(6),
                child: AnswerButtonStyle(
                    answerText: answer,
                    onTap: () {
                      showNextQuestion(answer);
                    }),
              );
            })
          ],
        ),
      ),
    );
  }
}
