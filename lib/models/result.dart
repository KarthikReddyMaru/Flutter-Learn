class Result {
  const Result({
    required this.question,
    required this.correctOption,
    required this.chosenOption,
    required this.questionId,
  });

  final int questionId;
  final String question;
  final String correctOption;
  final String chosenOption;
}
