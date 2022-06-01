import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors/app_colors.dart';
import 'package:quiz_app/constants/textStyles/app_text_style.dart';
import 'package:quiz_app/data/repositories/quiz_repo.dart';

import 'package:quiz_app/widgets/icon_widget.dart';

import '../widgets/custom_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<IconWidget> icons = <IconWidget>[];
  IconWidget correctIcon = IconWidget(
    icon: Icons.check,
    iconColor: AppColors.green,
  );
  IconWidget incorrectIcon = IconWidget(
    icon: Icons.close,
    iconColor: AppColors.red,
  );

  String suroo;

  bool isFinished;

  @override
  void initState() {
    super.initState();
    suroo = quizRepo.getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          'ТАПШЫРМА-07',
          style: AppTextStyle.appStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Text(
              suroo,
              style: AppTextStyle.content,
            ),
            if (isFinished == true)
              CustomButton(
                textButton: ' Пройти занова ',
                onPress: reset,
              )
            else
              Column(
                children: [
                  CustomButton(
                      onPress: () {
                        userAnswered(true);
                      },
                      textButton: 'Туура',
                      color: AppColors.green),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    onPress: () {
                      userAnswered(false);
                    },
                    textButton: 'Туура эмес',
                    color: AppColors.red,
                  ),
                ],
              ),
            Row(
              children: icons,
            )
          ],
        ),
      ),
    );
  }

  void userAnswered(bool userAnswer) {
    bool correctAnswer = quizRepo.getAnswers();
    log('userAnswer.answer:${userAnswer == correctAnswer}');
    if (userAnswer == correctAnswer) {
      icons.add(correctIcon);
    } else {
      icons.add(incorrectIcon);
    }
    quizRepo.getNext();
    suroo = quizRepo.getQuestion();
    if (suroo == 'Конец') {
      isFinished = true;
    }

    setState(() {});
  }

  void reset() {
    quizRepo.reset();
    suroo = quizRepo.getQuestion();
    isFinished = false;
    icons = <IconWidget>[];
    setState(() {});
  }
}
