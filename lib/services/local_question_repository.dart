import 'package:mob2_quizz/models/question.dart';
import 'package:mob2_quizz/services/question_repository.dart';

class LocalQuestionRepository implements QuestionRepository {
  final List<Question> _questions = [
    Question(
      'What is the answer to life, the universe and everything?',
      ['42', '24', '21'],
    ),
    Question(
      'What is the capital of Germany?',
      ['Paris', 'London', 'Berlin'],
    ),
    Question(
      'Who made the Mona Lisa?',
      ['Leonardo da Vinci', 'Michelangelo', 'Donatello'],
    ),
    Question(
      'What is the name of the largest ocean on Earth?',
      ['Pacific', 'Atlantic', 'Indian'],
    ),
    Question(
      'What is the name of the largest country in the world?',
      ['Russia', 'China', 'United States'],
    ),
  ];

  @override
  Future<List<Question>> get() {
    _questions.shuffle();
    for (var question in _questions) {
      question.answers.shuffle();
    }

    return Future.delayed(
      const Duration(milliseconds: 500),
      () => _questions,
    );
  }
}
