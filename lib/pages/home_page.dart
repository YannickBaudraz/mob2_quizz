import 'package:flutter/material.dart';
import 'package:mob2_quizz/services/local_question_repository.dart';

import '../models/question.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Question>> questions = LocalQuestionRepository().get();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
      ),
      body: Align(
        alignment: Alignment.center,
        // 2 containers. for the title and the question
        child: FutureBuilder<List<Question>>(
          future: questions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _Title(snapshot.data!.first.caption),
                    _Answers(snapshot.data!.first),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}

class _Answers extends StatelessWidget {
  const _Answers(this.question, {Key? key}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        children: [
          ...question.answers.map((answer) => _Answer(answer)),
        ],
      ),
    );
  }
}

class _Answer extends StatelessWidget {
  const _Answer(this.answer, {Key? key}) : super(key: key);

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Text(answer);
  }
}
