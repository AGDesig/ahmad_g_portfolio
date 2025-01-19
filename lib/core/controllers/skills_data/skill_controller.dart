

import 'package:agportfolio/values/values.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SkillController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxBool _isLoading = false.obs;
  RxList<SkillData> _skillData = <SkillData>[].obs;

  RxList<SkillData> get skillData => _skillData;

  RxBool get isLoading => _isLoading;

  @override
  void onInit() {
    fetchSkillData();
    super.onInit();
  }


  fetchSkillData() async{
    CollectionReference skillData=  skillDataCollection();


    QuerySnapshot snapshot = await  skillData.get();

    if (snapshot.docs.isNotEmpty) {
      _skillData.addAll(  snapshot.docs.map((doc) => SkillData.fromFirestore(doc)).toList());

    } else {
      print("No such document!");
    }
  }

  CollectionReference skillDataCollection(){
    return  firebaseFirestore.collection("skill_data");
  }
// Future<String> imagesID() async {
//   QuerySnapshot imagesGet = await imagesCollection().get();
//   return imagesGet.docs.first.id;
// }
}