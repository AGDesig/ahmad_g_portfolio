

import 'package:agportfolio/values/values.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ResumeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxBool _isLoading = false.obs;
  RxList<ExperienceData> _experienceData = <ExperienceData>[].obs;
  RxString _resumeUrl = "".obs;
  RxList<ExperienceData> get experienceData => _experienceData;

  RxBool get isLoading => _isLoading;
  RxString get resumeUrl => _resumeUrl;

  @override
  void onInit() {
    fetchResumeData();
    super.onInit();
  }


  fetchResumeData() async{
    CollectionReference resumeData=  resumeDataCollection();


    QuerySnapshot snapshot = await  resumeData.get();

    if (snapshot.docs.isNotEmpty) {
      print("what i am getting here after that?");
     List<Map<String,dynamic>> value = snapshot.docs.map((e) {
       return e.data() as Map<String, dynamic>;
      },).toList();
     for(var resume in value){
       _resumeUrl.value =  resume["resume"];
     }
    } else {
      print("No such document!");
    }
  }

  CollectionReference resumeDataCollection(){
    return  firebaseFirestore.collection("resume");
  }
// Future<String> imagesID() async {
//   QuerySnapshot imagesGet = await imagesCollection().get();
//   return imagesGet.docs.first.id;
// }
}