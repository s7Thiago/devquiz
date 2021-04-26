import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/models/answer_model.dart';
import 'package:devquiz/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? selectedIndex = -1;

  AnswerModel getAnswer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(child: SizedBox(height: 64)),
          Flexible(
            child: Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
          ),
          Flexible(child: SizedBox(height: 24)),
          for (int i = 0; i < widget.question.answers.length; i++)
            Flexible(
              child: AnswerWidget(
                answer: getAnswer(i),
                isSelected: this.selectedIndex == i,
                isDisabled: selectedIndex != -1,
                onTap: () {
                  setState(() {
                    this.selectedIndex = i;
                  });

                  Future.delayed(Duration(seconds: 2))
                      .then((value) => widget.onChange());
                },
              ),
            )
        ],
      ),
    );
  }
}
