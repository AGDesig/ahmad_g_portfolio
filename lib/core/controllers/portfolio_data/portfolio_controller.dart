

import 'package:agportfolio/values/values.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PortfolioController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxBool _isLoading = false.obs;
  RxList<PortfolioData> _portfolioData = <PortfolioData>[].obs;

  RxList<PortfolioData> get portfolioData => _portfolioData;

  RxBool get isLoading => _isLoading;

  @override
  void onInit() {
    fetchPortfolioData();
    super.onInit();
  }


  fetchPortfolioData() async{
    CollectionReference portfolioData=  portfolioDataCollection();


    QuerySnapshot snapshot = await  portfolioData.get();

    if (snapshot.docs.isNotEmpty) {
      _portfolioData.addAll(  snapshot.docs.map((doc) => PortfolioData.fromFirestore(doc)).toList());

    } else {
      print("No such document!");
    }
  }

 CollectionReference portfolioDataCollection(){
   return  firebaseFirestore.collection("portfolio_data");
  }
  // Future<String> imagesID() async {
  //   QuerySnapshot imagesGet = await imagesCollection().get();
  //   return imagesGet.docs.first.id;
  // }
}