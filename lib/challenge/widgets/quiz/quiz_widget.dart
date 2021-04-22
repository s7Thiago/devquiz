import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          AnswerWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
            isSelected: true,
            isRight: true,
          ),
          AnswerWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
            isSelected: false,
            isRight: false,
          ),
          AnswerWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
            isSelected: false,
          ),
          AnswerWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
            isSelected: true,
          ),
        ],
      ),
    );
  }
}
