import 'package:study_app/controller/question_paper/question_paper_controller.dart';
import 'package:study_app/controller/question_paper/questions_controller.dart';
import 'package:study_app/controller/zoom_drawer_controller.dart';
import 'package:study_app/screens/introduction/introduction.dart';
import 'package:study_app/screens/login/login_screen.dart';
import 'package:study_app/screens/question/question_screen.dart';
import 'package:study_app/screens/question/result_screen.dart';
import 'package:study_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/screens/question/test_overview_screen.dart';

import '../screens/question/answer_check_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(
          name: '/introduction',
          page: () => AppIntroductionScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
            Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),
        GetPage(
          name: QuestionScreen.routeName,
          page: () => QuestionScreen(),
          binding: BindingsBuilder(() {
            Get.put<QuestionController>(QuestionController());
          }),
        ),
        GetPage(
          name: TestOverviewScreen.routeName,
          page: () => const TestOverviewScreen(),
        ),
        GetPage(
          name: ResultScreen.routeName,
          page: () => const ResultScreen(),
        ),
        GetPage(
          name: AnswerCheckScreen.routeName,
          page: () => const AnswerCheckScreen(),
        )
      ];
}
