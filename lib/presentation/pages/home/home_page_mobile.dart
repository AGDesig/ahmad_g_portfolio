import 'package:agportfolio/core/controllers/portfolio_data/portfolio_controller.dart';
import 'package:flutter/material.dart';
import 'package:agportfolio/core/layout/adaptive.dart';
import 'package:agportfolio/core/utils/functions.dart';
import 'package:agportfolio/presentation/pages/portfolio/portfolio_page.dart';
import 'package:agportfolio/presentation/widgets/app_drawer.dart';
import 'package:agportfolio/presentation/widgets/circular_container.dart';
import 'package:agportfolio/presentation/widgets/content_wrapper.dart';
import 'package:agportfolio/presentation/widgets/socials.dart';
import 'package:agportfolio/presentation/widgets/spaces.dart';
import 'package:agportfolio/values/values.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class HomePageMobile extends StatefulWidget {
  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  PortfolioController controller = Get.find<PortfolioController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: HomePage.homePageRoute,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      ContentWrapper(
                        width: assignWidth(context: context, fraction: 0.8),
                        color: AppColors.primaryColor,
        //                        gradient: Gradients.primaryGradient,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: assignHeight(
                                  context: context,
                                  fraction: 0.2,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: ListBody(
                                  children: [
                                    Text(
                                      StringConst.DEV_NAME,
                                      style: theme.textTheme.headlineLarge!.copyWith(
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                    SpaceH8(),
                                    Text(
                                      StringConst.SPECIALITY,
                                      style: theme.textTheme.headlineMedium!.copyWith(
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(flex: 1),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    PortfolioPage.portfolioPageRoute,
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: Column(
                                    children: [
                                      RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(
                                          StringConst.VIEW_PORTFOLIO,
                                          textAlign: TextAlign.end,
                                          style:
                                              theme.textTheme.bodyLarge!.copyWith(
                                            color: AppColors.secondaryColor,
                                            fontSize: Sizes.TEXT_SIZE_18,
                                          ),
                                        ),
                                      ),
                                      SpaceH12(),
                                      CircularContainer(
                                        width: Sizes.WIDTH_24,
                                        height: Sizes.HEIGHT_24,
                                        color: AppColors.secondaryColor,
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: assignHeight(
                                  context: context,
                                  fraction: 0.05,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ContentWrapper(
                        width: assignWidth(context: context, fraction: 0.2),
                        color: AppColors.secondaryColor,
                        child: Container(),
                      ),
                    ],
                  )
                ],
              ),
              _buildAppBar(),
              _buildDevImage(),
              _buildSocials(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_16,
        vertical: Sizes.PADDING_16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState!.openEndDrawer();
              } else {
                _scaffoldKey.currentState!.openDrawer();
              }
            },
            icon: Icon(Icons.menu),
          ),
          CircularContainer(
            color: AppColors.primaryColor,
            child: InkWell(
              onTap: () {
                Functions.launchUrl(StringConst.EMAIL_URL);
//                Navigator.pushNamed(
//                  context,
//                  ContactPage.contactPageRoute,
//                );
              },
              child: Icon(
                Icons.email,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDevImage() {
    return Positioned(
      top:assignHeight(context: context, fraction: 0.4),
      // right: -assignWidth(context: context, fraction: 0.42),
      left: assignWidth(context: context, fraction: 0.15),
      child: Container(

        child: Image.asset(
          // ImagePath.DEV,
          ImagePath.DEV,
          height: assignHeight(context: context, fraction: 0.4),
          width: assignHeight(context: context, fraction: 0.4),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildSocials() {
    return Positioned(
      right: Sizes.SIZE_16,
      bottom: Sizes.SIZE_30,
      child: Socials(
        isVertical: true,
        alignment: Alignment.centerRight,
        color: AppColors.primaryColor,
        barColor: AppColors.primaryColor,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }
}
