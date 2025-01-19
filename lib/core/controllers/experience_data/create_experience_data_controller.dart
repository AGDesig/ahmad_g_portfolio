import 'package:agportfolio/values/values.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateExperienceDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController position = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController duration = TextEditingController();
  final TextEditingController company = TextEditingController();
  final TextEditingController companyUrl = TextEditingController();

  Future<void> addExperienceData() async {
    try {
      await _firestore.collection('experience_data').add({
        'position': position.text,
        'location': location.text,
        'duration': duration.text,
        'company': company.text,
        'companyUrl': companyUrl.text,
      });
      Get.snackbar('Success', 'Portfolio data added successfully.');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> deleteExperienceData(String documentId) async {
    try {
      await _firestore.collection('experience_data').doc(documentId).delete();
      Get.snackbar('Success', 'Portfolio data deleted successfully.');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Stream<QuerySnapshot> fetchExperienceData() {
    return _firestore.collection('experience_data').snapshots();
  }
}
