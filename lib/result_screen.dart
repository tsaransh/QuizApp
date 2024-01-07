import 'package:flutter/material.dart';
import 'package:quiz_app/data/quiz_questions_data_loader.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.choosenAnswer}) : super(key: key);

  final List<String> choosenAnswer;

  List<Map<String, Object>> getResultSummary() {
    final List<Map<String, Object>> summary = [];

    // Calculate the result
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': QuizQuestionLoader().quizQuestions[i].question,
        'correct_answer': QuizQuestionLoader().quizQuestions[i].answers[0],
        'user_answer': choosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final resultSummary = getResultSummary();
    final numOfQuestions = QuizQuestionLoader().quizQuestions.length;
    final correctAnswers = resultSummary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $correctAnswers out of $numOfQuestions questions correctly'),
            const SizedBox(height: 30),
            QuestionSummary(summary: resultSummary),
            const SizedBox(height: 26),
            TextButton(onPressed: () {}, child: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
