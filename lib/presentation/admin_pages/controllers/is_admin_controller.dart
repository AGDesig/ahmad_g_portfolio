
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class IsAdminController extends GetxController{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  RxBool _isAdmin = false.obs;
  RxBool get isAdmin => _isAdmin;

  @override
  void onInit() {
    fetchIsAdmin();
    super.onInit();
  }



  void fetchIsAdmin() async{
    CollectionReference aifood=  adminCollection();

    DocumentSnapshot snapshot = await  aifood.doc( await adminDocId()).get();

    if (snapshot.exists) {

      Map<String, dynamic>? data = await snapshot.data() as Map<String, dynamic>?;
      bool value = data!["is_admin"];
      print("value = ${value}");
      _isAdmin.value = value;
    } else {
      print("No such document!");
    }
  }


  CollectionReference adminCollection(){
    return  firebaseFirestore.collection("enable_admin");
  }
  Future<String> adminDocId() async {
    QuerySnapshot imagesGet = await adminCollection().get();
    return imagesGet.docs.first.id;
  }

}