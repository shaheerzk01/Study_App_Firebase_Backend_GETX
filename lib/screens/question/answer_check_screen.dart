import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/question_paper/questions_controller.dart';
import 'package:study_app/screens/question/result_screen.dart';
import 'package:study_app/widgets/common/background_decoration.dart';
import 'package:study_app/widgets/common/custom_app_bar.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/questions/answer_card.dart';

import '../../configs/themes/custom_text_styles.dart';

class AnswerCheckScreen extends GetView<QuestionController> {
  const AnswerCheckScreen({Key? key}) : super(key: key);

  static const String routeName = "/answercheckscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        tittleWidget: Obx(
          () => Text(
            "Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
            style: appBarTS,
          ),
        ),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(ResultScreen.routeName);
        },
      ),
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: ContentArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(controller.currentQuestion.value!.question),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<QuestionController>(
                          id: 'answer_review_list',
                          builder: (_) {
                            return ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (_, index) {
                                  final answer = controller
                                      .currentQuestion.value!.answers[index];
                                  final selectedAnswer = controller
                                      .currentQuestion.value!.selectedAnswer;
                                  final correctAnswer = controller
                                      .currentQuestion.value!.correctAnswer;
                                  final String answerText =
                                      '${answer.identifier}. ${answer.answer}';
                                  if (selectedAnswer == correctAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    return CorrectAnswer(answer: answerText);
                                  } else if (selectedAnswer == null) {
                                    return NotAnswered(answer: answerText);
                                  } else if (correctAnswer != selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    return WrongAnswer(answer: answerText);
                                  } else if (correctAnswer ==
                                      answer.identifier) {
                                    return CorrectAnswer(answer: answerText);
                                  }
                                  return AnswerCard(
                                    answer: answerText,
                                    onTap: () {},
                                    isSelected: false,
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount: controller
                                    .currentQuestion.value!.answers.length);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
