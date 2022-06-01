
import '../../quiz_model.dart';

class QuizData {
  List<QuizModel> questionsAnswers = <QuizModel>[
    QuizModel(suroolor: 'Кыргызстан Эгемендуу олко эмес', jooptor: false),
    QuizModel(
        suroolor: 'Кыргызстан эн чон мамлекет ',
        jooptor: false),
    QuizModel(
        suroolor: '  Ысык-Кол Кыргызстанда жайгашкан ', jooptor: true),
    QuizModel(suroolor: 'Кыргызстан Америка менен чектеш', jooptor: false),
    QuizModel(
        suroolor: '  Кыргызстандын элинин саны 15миллион ',
        jooptor: false),
    QuizModel(suroolor: 'Кыргызстан эн кооз олко', jooptor: true),
    QuizModel(suroolor: 'Кыргызстан Европада жайгашкан ', jooptor: false),
    QuizModel(suroolor: 'Кыргызстан тоолуу олко ', jooptor: true),
  ];
}


final QuizData quizData = QuizData();