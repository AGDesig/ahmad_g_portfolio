import 'package:agportfolio/core/controllers/experience_data/create_experience_data_controller.dart';
import 'package:agportfolio/core/controllers/experience_data/experience_controller.dart';
import 'package:agportfolio/core/controllers/portfolio_data/create_portfolio_data.dart';
import 'package:agportfolio/core/controllers/portfolio_data/portfolio_controller.dart';
import 'package:agportfolio/core/controllers/resume_controller.dart';
import 'package:agportfolio/core/controllers/skills_data/skill_controller.dart';
import 'package:agportfolio/firebase_options.dart';
import 'package:agportfolio/presentation/admin_pages/controllers/is_admin_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agportfolio/app_theme.dart';
import 'package:agportfolio/presentation/pages/home/home_page.dart';
import 'package:agportfolio/presentation/routes/routes.dart';
import 'package:agportfolio/values/values.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoogleFonts.config.allowRuntimeFetching = false;
  Get.put(PortfolioController());
  Get.put(PortfolioControllerCreate());
  Get.put(CreateExperienceDataController());
  Get.put(ExperienceController());
  Get.put(ResumeController());
  Get.put(SkillController());
  Get.put(IsAdminController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringConst.APP_TITLE,
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.homePageRoute,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
