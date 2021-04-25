import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              QuestionIndicatorWidget(),
            ],
          ),
        ),
      ),
      body: QuizWidget(
        question: widget.questions[0],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: NextButtonWidget.white(
                  label: 'Fácil',
                  onTap: () {},
                ),
              ),
              SizedBox(width: 7),
              Expanded(
                child: NextButtonWidget.green(
                  label: 'Confirmar',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
