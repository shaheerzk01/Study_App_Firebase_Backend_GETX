
import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:get/get.dart';
import 'package:study_app/controller/zoom_drawer_controller.dart';
import 'package:simple_icons/simple_icons.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: mainGradient(),
      ),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: onSurfaceTextColor))),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3, top: 15),
                child: Column(
                  children: [
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : Text(
                              controller.user.value!.displayName ?? '',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: onSurfaceTextColor,
                              ),
                            ),
                    ),
                    const SizedBox(height: 30),
                    Obx(
                          () => controller.user.value == null
                          ? const SizedBox()
                          : Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            controller.user.value!.photoURL ?? '',
                          ),
                          radius: 50,
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    Container(
                      alignment: Alignment.topLeft,
                      child: _DrawerButton(
                        icon: Icons.web,
                        label: "Website",
                        onPressed: () => controller.website(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: _DrawerButton(
                        icon: Icons.facebook,
                        label: "Facebook",
                        onPressed: () => controller.facebook(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: _DrawerButton(
                        icon: SimpleIcons.github,
                        label: "Github",
                        onPressed: () => controller.github(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: _DrawerButton(
                        icon: Icons.email,
                        label: "Email",
                        onPressed: () => controller.email(),
                      ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: _DrawerButton(
                        icon: Icons.logout,
                        label: "logout",
                        onPressed: () => controller.signOut(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 18,
      ),
      label: Text(
        label,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
