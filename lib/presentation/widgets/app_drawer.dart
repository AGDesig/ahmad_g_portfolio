import 'package:agportfolio/core/controllers/resume_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:agportfolio/core/layout/adaptive.dart';
import 'package:agportfolio/core/utils/functions.dart';
import 'package:agportfolio/presentation/widgets/circular_container.dart';
import 'package:agportfolio/presentation/widgets/socials.dart';
import 'package:agportfolio/presentation/widgets/spaces.dart';
import 'package:agportfolio/values/values.dart';
import 'package:get/get.dart';

import 'menu_item.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    required this.menuList,
    this.color = AppColors.secondaryColor,
    this.width,
    this.selectedItemRouteName,
    this.onClose,
  });

  final Color color;
  final double? width;
  final String? selectedItemRouteName;
  final List<MenuData> menuList;
  final GestureTapCallback? onClose;


  ResumeController resumeController = Get.find<ResumeController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      color: color,
      width: width ??
          assignWidth(
            context: context,
            fraction: 0.65,
          ), //widthOfScreen(context),
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Sizes.PADDING_16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: onClose ??
                            () {
                          Navigator.pop(context);
                        },
                    child: CircularContainer(
                      color: AppColors.accentColor2,
                      width: Sizes.WIDTH_30,
                      height: Sizes.HEIGHT_30,
                      child: Icon(
                        Icons.close,
                        size: Sizes.ICON_SIZE_20,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ..._buildMenuList(menuList: menuList, context: context),
          ],
        ),
            Spacer(flex: 1),
            Socials(
              isHorizontal: true,
              color: AppColors.accentColor2,
              alignment: Alignment.center,
              barColor: AppColors.accentColor2,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            SpaceH16(),
            Row(

              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringConst.BUILT_BY,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: AppColors.accentColor2,
                    fontSize: Sizes.TEXT_SIZE_10,
                  ),
                ),
                SpaceW4(),
                Icon(
                  FontAwesomeIcons.solidHeart,
                  color: Colors.red,
                  size: Sizes.ICON_SIZE_10,
                )
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       StringConst.BUILT_BY + ", " + StringConst.DESIGNED_BY,
            //       style: theme.textTheme.bodySmall!.copyWith(
            //         color: AppColors.accentColor2,
            //         fontSize: Sizes.TEXT_SIZE_10,
            //       ),
            //     ),
            //   ],
            // ),
            SpaceH16(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<MenuData> menuList,
  }) {
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        MenuItem(
          onTap: () {
            if (menuList[i].title == StringConst.RESUME) {
              Functions.launchUrl(resumeController.resumeUrl.value);
            } else if (menuList[i].title == StringConst.CONTACT) {
              Functions.launchUrl(StringConst.EMAIL_URL);
            } else {
              Navigator.of(context).pushNamed(menuList[i].routeName);
            }
          },
          title: menuList[i].title,
          isMobile: true,
          selected:
          selectedItemRouteName == menuList[i].routeName ? true : false,
        ),
      );
      menuItems.add(SpaceH16());
    }
    return menuItems;
  }
}
