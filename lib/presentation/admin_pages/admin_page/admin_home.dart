import 'package:agportfolio/presentation/admin_pages/experience_data_entry.dart';
import 'package:agportfolio/presentation/admin_pages/portfolio_data_entry.dart';
import 'package:agportfolio/presentation/admin_pages/skill_data_entry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust this to control number of columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 10, // Number of grid items
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      switch(index){
                        case 0: 
                          Get.to(()=> PortfolioScreen());
                        case 1:
                          Get.to(()=> ExperienceScreen());
                        case 2:
                          Get.to(()=> SkillScreen());
                      }
                      
                      },
                    child: Container(
                      color: Colors.blueAccent,
                      alignment: Alignment.center,
                      child: Text(
                        'Title $index',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
