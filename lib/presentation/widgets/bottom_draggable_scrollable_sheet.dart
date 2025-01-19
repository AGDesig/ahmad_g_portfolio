import 'package:agportfolio/core/controllers/skills_data/skill_controller.dart';
import 'package:flutter/material.dart';
import 'package:agportfolio/core/layout/adaptive.dart';
import 'package:agportfolio/presentation/widgets/skill_level.dart';
import 'package:agportfolio/presentation/widgets/spaces.dart';
import 'package:agportfolio/values/values.dart';
import 'package:get/get.dart';

import 'horizontal_bar.dart';

class BottomDraggableScrollableSheet extends StatefulWidget {
  BottomDraggableScrollableSheet({
    this.initialChildSize = 0.08,
    this.maxChildSize = 0.6,
    this.minChildSize = 0.08,
    this.backgroundColor = AppColors.primaryColor,
  });

  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final Color backgroundColor;
  @override
  _BottomDraggableScrollableSheetState createState() =>
      _BottomDraggableScrollableSheetState();
}

class _BottomDraggableScrollableSheetState
    extends State<BottomDraggableScrollableSheet> {
  bool isEducationSelected = true;

  bool isKeySkillsSelected = false;
  SkillController _skillController = Get.find<SkillController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle selectedItem = theme.textTheme.bodySmall!.copyWith(
      color: AppColors.secondaryColor,
    );
    TextStyle unselectedItem = theme.textTheme.bodySmall!.copyWith(
      color: AppColors.deepBlue200,
    );
    return DraggableScrollableSheet(
      initialChildSize: widget.initialChildSize,
      minChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return Container(
          color: widget.backgroundColor,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SpaceH8(),
                HorizontalBar(
                  color: AppColors.secondaryColor,
                  margin: EdgeInsets.only(right: 8),
                  width: 40,
                  height: 2,
                ),
                SpaceH8(),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap:()=> switchTabs(),
                        child: Text(
                          StringConst.KEY_SKILLS,
                          style: isKeySkillsSelected
                              ? selectedItem
                              : unselectedItem,
                        ),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        width: 24,
                        color: AppColors.secondaryColor,
                      ),
                      InkWell(
                        onTap: ()=> switchTabs(),
                        child: Text(
                          StringConst.EDUCATION,
                          style: isEducationSelected
                              ? selectedItem
                              : unselectedItem,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.PADDING_16,
                    vertical: Sizes.PADDING_16,
                  ),
                  child: Column(
                    children: [
                     if(isKeySkillsSelected)
                      _buildSkillsSection(skills: _skillController.skillData),

                     if(isEducationSelected)
                      Text(
                        StringConst.ABOUT_DEV_TEXT,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: AppColors.secondaryColor,
                          fontSize: Sizes.TEXT_SIZE_16,
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void switchTabs() {
    setState(() {
      print("is this switching?");
      isKeySkillsSelected = !isKeySkillsSelected;
      isEducationSelected = !isEducationSelected;
    });
    print("is key bool conidition ${isKeySkillsSelected}");
    print("is edu bool conidition ${isEducationSelected}");
  }

  Widget _buildSkillsSection({required List<SkillData> skills}) {
    List<Widget> skillWidgets = [];
    ThemeData theme = Theme.of(context);
    for (var index = 0; index < skills.length; index++) {
      skillWidgets.add(
        SkillLevel(
          width: assignWidth(context: context, fraction: 0.4),
          skillLevel: skills[index].skillLevel,
          skillName: skills[index].skillName,
          progressColor: AppColors.secondaryColor,
          baseColor: AppColors.deepBlue200,
          textStyle: theme.textTheme.bodyLarge!
              .copyWith(color: AppColors.secondaryColor),
          skillNameTextStyle: theme.textTheme.bodyLarge!
              .copyWith(color: AppColors.secondaryColor),
        ),
      );
    }
    return Wrap(
//      spacing: 8,
      runSpacing: 8,
      children: [
        ...skillWidgets,
      ],
    );
  }
}
