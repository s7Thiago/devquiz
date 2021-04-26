import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback onTap;

  const AnswerWidget({
    Key? key,
    this.isSelected = false,
    required this.answer,
    required this.onTap,
    this.isDisabled = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: this.isDisabled,
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? _selectedColorCardRight : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              BorderSide(
                color: isSelected ? _selectedBorderCardRight : AppColors.border,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(this.answer.title,
                    style: isSelected
                        ? _selectedTextStyleRight
                        : AppTextStyles.body),
              ),
              Container(
                width: 24,
                height: 24,
                child: isSelected
                    ? Icon(_selectedIconRight, size: 16, color: Colors.white)
                    : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.fromBorderSide(BorderSide(
                    color: isSelected ? _selectedBorderRight : AppColors.border,
                  )),
                  color: isSelected ? _selectedColorRight : AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
