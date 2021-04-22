import 'dart:convert';

import 'package:devquiz/models/question_model.dart';

enum Level { FACIL, MEDIO, DIFICIL, PERITO }

extension StringExtension on String {
  Level get parse => {
        'FACIL': Level.FACIL,
        'MEDIO': Level.MEDIO,
        'DIFICIL': Level.DIFICIL,
        'PERITO': Level.PERITO,
      }[this]!;
}

extension LevelExtension on Level {
  String get parse => {
        Level.FACIL: 'FACIL',
        Level.MEDIO: 'MEDIO',
        Level.DIFICIL: 'DIFICIL',
        Level.PERITO: 'PERITO',
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
