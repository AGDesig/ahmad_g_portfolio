

import 'package:agportfolio/values/values.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ExperienceController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxBool _isLoading = false.obs;
  RxList<ExperienceData> _experienceData = <ExperienceData>[].obs;

  RxList<ExperienceData> get experienceData => _experienceData;

  RxBool get isLoading => _isLoading;

  @override
  void onInit() {
    fetchExperienceData();
    super.onInit();
  }


  fetchExperienceData() async{
    CollectionReference experienceData=  experienceDataCollection();


    QuerySnapshot snapshot = await  experienceData.get();

    if (snapshot.docs.isNotEmpty) {
      _experienceData.addAll(  snapshot.docs.map((doc) => ExperienceData.fromFirestore(doc)).toList());

    } else {
      print("No such document!");
    }
  }

  CollectionReference experienceDataCollection(){
    return  firebaseFirestore.collection("experience_data");
  }
// Future<String> imagesID() async {
//   QuerySnapshot imagesGet = await imagesCollection().get();
//   return imagesGet.docs.first.id;
// }
}