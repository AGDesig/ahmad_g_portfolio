import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioControllerCreate extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController coverImageController = TextEditingController();
  final TextEditingController imageSizeController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController portfolioDescriptionController = TextEditingController();
  final TextEditingController technologyUsedController = TextEditingController();
  final TextEditingController gitHubUrlController = TextEditingController();
  final TextEditingController playStoreUrlController = TextEditingController();
  final TextEditingController webUrlController = TextEditingController();
  final RxBool isPublic = false.obs;
  final RxBool isOnPlayStore = false.obs;
  final RxBool isLive = false.obs;
  final RxBool hasBeenReleased = true.obs;

  Future<void> addPortfolioData() async {
    try {
      await _firestore.collection('portfolio_data').add({
        'title': titleController.text,
        'image': imageController.text,
        'coverImage': coverImageController.text,
        'imageSize': double.tryParse(imageSizeController.text) ?? 0.0,
        'subtitle': subtitleController.text,
        'portfolioDescription': portfolioDescriptionController.text,
        'technologyUsed': technologyUsedController.text,
        'isPublic': isPublic.value,
        'isOnPlayStore': isOnPlayStore.value,
        'isLive': isLive.value,
        'gitHubUrl': gitHubUrlController.text,
        'playStoreUrl': playStoreUrlController.text,
        'webUrl': webUrlController.text,
        'hasBeenReleased': hasBeenReleased.value,
      });
      Get.snackbar('Success', 'Portfolio data added successfully.');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> deletePortfolioData(String documentId) async {
    try {
      await _firestore.collection('portfolio_data').doc(documentId).delete();
      Get.snackbar('Success', 'Portfolio data deleted successfully.');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Stream<QuerySnapshot> fetchPortfolioData() {
    return _firestore.collection('portfolio_data').snapshots();
  }
}
