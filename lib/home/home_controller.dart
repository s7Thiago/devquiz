import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/models/quiz_model.dart';
import 'package:devquiz/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.EMPTY);
  UserModel? user;
  List<QuizModel>? quizzes;
  final repository = HomeRepository();

  HomeState get state => stateNotifier.value;
  set state(HomeState state) => stateNotifier.value = state;

  void getUser() async {
    state = (HomeState.LOADING);

    user = await repository.getUser();

    state = (HomeState.SUCCESS);
  }

  void getQuizzes() async {
    state = (HomeState.LOADING);

    quizzes = await repository.getQuizzes();

    state = (HomeState.SUCCESS);
  }
}
