import 'package:quiz_app/data/quizs/quiz_data.dart';

class QuizService {
  int _index = 0;
  String getQuestion() {
    if (_index < quizData.questionsAnswers.length) {
      return quizData.questionsAnswers[_index].suroolor;
    } else {
      return 'Конец';
    }
  }

  bool getAnswers() {
    return quizData.questionsAnswers[_index].jooptor;
  }

  void getNext() {
    _index++;
  }

  void reset() {
    _index = 0;
  }
}


QuizService quizService = QuizService();