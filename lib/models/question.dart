class Question {
  const Question(this.text, this.options);

  final String text;
  final List<String> options;

  List<String> getShuffledOptions() {
    final shuffledOptions = List.of(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }
}
