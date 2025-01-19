import 'package:agportfolio/presentation/admin_pages/admin_page/admin_home.dart';
import 'package:agportfolio/presentation/admin_pages/controllers/is_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:agportfolio/values/values.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_page_desktop.dart';
import 'home_page_mobile.dart';

class HomePage extends StatelessWidget {
  static const String homePageRoute = StringConst.HOME_PAGE;

  HomePage({
    Key? key,
  }) : super(key: key);

  IsAdminController _isAdminController = Get.find<IsAdminController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: _isAdminController.isAdmin.value == false ? null : AppBar(
          actions: [
            InkWell(onTap: () => Get.to(() => AdminHome()),
              child: Icon(Icons.admin_panel_settings, color: AppColors.white,),)
          ],), body: ScreenTypeLayout(
        mobile: HomePageMobile(),
        tablet: HomePageDesktop(),
        desktop: HomePageDesktop(),
      ),
      );
    });
  }
}
