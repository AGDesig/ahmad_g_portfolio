import 'package:agportfolio/core/controllers/experience_data/experience_controller.dart';
import 'package:flutter/material.dart';
import 'package:agportfolio/presentation/pages/experience/experience_page.dart';
import 'package:agportfolio/presentation/widgets/app_drawer.dart';
import 'package:agportfolio/presentation/widgets/custom_app_bar.dart';
import 'package:agportfolio/presentation/widgets/experience_section.dart';
import 'package:agportfolio/values/values.dart';
import 'package:get/get.dart';

class ExperiencePageMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ExperienceController  experienceController = Get.find<ExperienceController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: experienceController.experienceData.length,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.deepBlue700,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: CustomAppBar(
            title: StringConst.WORK,
            onLeadingPressed: () {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState!.openEndDrawer();
              } else {
                _scaffoldKey.currentState!.openDrawer();
              }
            },
            bottom: TabBar(
              tabs: _buildTabBar(experienceController.experienceData),
              indicatorColor: AppColors.complimentColor1,
              labelColor: AppColors.complimentColor1,
              labelPadding: EdgeInsets.all(Sizes.PADDING_8),
              labelStyle: theme.textTheme.headlineSmall!.copyWith(
                fontSize: Sizes.TEXT_SIZE_16,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: AppColors.accentColor,
              unselectedLabelStyle: theme.textTheme.bodyLarge!.copyWith(
                fontSize: Sizes.TEXT_SIZE_16,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [],
          ),
        ),
        drawer: AppDrawer(
          menuList: Data.menuList,
          selectedItemRouteName: ExperiencePage.experiencePageRoute,
        ),
        body: TabBarView(
          children: _buildTabContent(experienceController.experienceData),
        ),
      ),
    );
  }

  List<Widget> _buildTabBar(List<ExperienceData> experienceData) {
    List<Widget> tabBarItems = [];
    for (var index = 0; index < experienceData.length; index++) {
      tabBarItems.add(
        Text(experienceData[index].company!),
      );
    }
    return tabBarItems;
  }

  List<Widget> _buildTabContent(List<ExperienceData> experienceData) {
    List<Widget> tabContent = [];
    for (var index = 0; index < experienceData.length; index++) {
      tabContent.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_12,
            vertical: Sizes.PADDING_16,
          ),
          child: ExperienceSection(
            position: experienceData[index].position,
            company: experienceData[index].company,
            duration: experienceData[index].duration,
            location: experienceData[index].location,
            roles: experienceData[index].roles,
            companyUrl: experienceData[index].companyUrl,
          ),
        ),
      );
    }
    return tabContent;
  }
}

//      body: Container(
//        padding: EdgeInsets.symmetric(
//          horizontal: Sizes.PADDING_16,
//          vertical: Sizes.PADDING_16,
//        ),
//        child: ListView.separated(
//          itemCount: Data.experienceData.length,
//          separatorBuilder: (BuildContext context, int index) {
//            return SpaceH30();
//          },
//          itemBuilder: (BuildContext context, int index) {
//            return ExperienceColumn(
//              duration: Data.experienceData[index].duration,
//              position: Data.experienceData[index].position,
//              company: Data.experienceData[index].company,
//              location: Data.experienceData[index].location,
//              role: Data.experienceData[index].role,
//              onTap: () {
//                Functions.launchUrl(Data.experienceData[index].companyUrl);
//              },
//            );
//          },
//        ),
//      )
