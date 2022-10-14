class Clauns {
  String clue;
  String answer;
  DateTime date;

  Clauns({required this.clue, required this.answer, required this.date}) {
    if (clue.length > 150) {
      this.clue = 'clue length too long';
    } else {
      this.clue = clue;
    }
    if (answer.length > 21) {
      this.answer = 'answer is too long';
    } else {
      this.answer = answer;
    }
  }

  DateTime getDate() {
    return date;
  }

  String getClue() {
    return clue;
  }

  String getAnswer() {
    return answer;
  }
}
