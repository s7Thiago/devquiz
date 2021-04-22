import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/models/answer_model.dart';
import 'package:devquiz/models/question_model.dart';
import 'package:devquiz/models/quiz_model.dart';
import 'package:devquiz/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.EMPTY);
  UserModel? user;
  List<QuizModel>? quizzes;

  set state(HomeState state) => stateNotifier.value = state;

  HomeState get state => stateNotifier.value;

  void getUser() async {
    state = (HomeState.LOADING);
    await Future.delayed(Duration(milliseconds: 2000));

    user = UserModel(
      name: 'Thiago Silva',
      photoUrl: 'https://avatars.githubusercontent.com/u/37230912?v=4',
    );

    state = (HomeState.SUCCESS);
  }

  void getQuizzes() async {
    state = (HomeState.LOADING);
    await Future.delayed(Duration(milliseconds: 2000));

    quizzes = [
      QuizModel(
        title: 'NLW 5 - Flutter',
        questionAnswered: 2,
        questions: [
          QuestionModel(
            title: '(Imagine uma pergunta)?',
            answers: [
              AnswerModel(title: 'Alternativa 1'),
              AnswerModel(title: 'Alternativa 2'),
              AnswerModel(title: 'Alternativa 3', isRight: true),
              AnswerModel(title: 'Alternativa 4'),
            ],
          ),
          QuestionModel(
            title: '(Imagine outra pergunta)?',
            answers: [
              AnswerModel(title: 'Alternativa 1', isRight: true),
              AnswerModel(title: 'Alternativa 2'),
              AnswerModel(title: 'Alternativa 3'),
              AnswerModel(title: 'Alternativa 4'),
            ],
          ),
          QuestionModel(
            title: '(Imagine mais uma pergunta)?',
            answers: [
              AnswerModel(title: 'Alternativa 1'),
              AnswerModel(title: 'Alternativa 2', isRight: true),
              AnswerModel(title: 'Alternativa 3'),
              AnswerModel(title: 'Alternativa 4'),
            ],
          ),
        ],
        image: AppImages.blocks,
        level: Level.FACIL,
      )
    ];

    state = (HomeState.SUCCESS);
  }
}
