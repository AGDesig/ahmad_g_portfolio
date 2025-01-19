import 'package:agportfolio/values/values.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateSkillDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController skillName = TextEditingController();
  final TextEditingController skillLevel = TextEditingController();
 

  Future<void> addSkillData() async {
    try {
      await _firestore.collection('skill_data').add({
        'skillName': skillName.text,
        'skillLevel': double.parse(skillLevel.text),
      
      });
      Get.snackbar('Success', 'Skill data added successfully.');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> deleteSkillData(String documentId) async {
    try {
      await _firestore.collection('skill_data').doc(documentId).delete();
      Get.snackbar('Success', 'Skill data deleted successfully.');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Stream<QuerySnapshot> fetchSkillData() {
    return _firestore.collection('skill_data').snapshots();
  }
}
