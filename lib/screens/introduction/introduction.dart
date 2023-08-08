import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import '../../widgets/app_circle_button.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65,
              ),
              const Gap(40),
              const Text(
                "This is a study app. You an use it as you want. If you understand how this works, you will be able to scale it",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold
                ),
              ),
              const Gap(30),
              AppCircleButton(
                onTap: () => Get.offAndToNamed("/home"),
                child: const Icon(Icons.arrow_forward, size: 35),
              )
            ],
          ),
        ),
      ),
    );
  }
}
