class QuizQuestions {
  const QuizQuestions(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getSuffledAnswer() {
    final List<String> suffledList = List.of(answers);
    suffledList.shuffle();
    return suffledList;
  }
}
