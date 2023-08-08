import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';
import 'package:study_app/screens/question/test_overview_screen.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.tittle = '',
      this.showActionIcon = false,
      this.leading,
      this.tittleWidget,
      this.onMenuActionTap})
      : super(key: key);

  final String tittle;
  final Widget? tittleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: mobileScreenPadding, horizontal: mobileScreenPadding),
        child: Stack(
          children: [
            Positioned.fill(
              child: tittleWidget == null
                  ? Center(
                      child: Text(
                        tittle,
                        style: appBarTS,
                      ),
                    )
                  : Center(
                      child: tittleWidget,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-14, 0),
                      child: const BackButton(),
                    ),
                if (showActionIcon)
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: AppCircleButton(
                      child: const Icon(Icons.menu, size: 20,),
                      onTap: onMenuActionTap??()=>Get.toNamed(TestOverviewScreen.routeName),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 80);
}
