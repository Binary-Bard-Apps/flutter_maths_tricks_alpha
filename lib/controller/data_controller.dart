import 'package:get/get.dart';


class DataController extends GetxController{
  RxBool isLoading = true.obs;
  int refId = 1;
  DataController(this.refId);

  @override
  void onInit() {

    fetchData(refId);
    super.onInit();
  }

  void fetchData(int refId) async {
    isLoading(true);


      // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      //     .collection(FirebaseData.quizList)
      //     .where('ref_id', isEqualTo: refId)
      //     .get();
      //
      //
      // if (querySnapshot.size > 0) {
      //
      //   if (querySnapshot.docs.length > 0) {
      //     List<DocumentSnapshot> list1 = querySnapshot.docs;
      //
      //     if(list1.length > 0){
      //       list = list1;
      //       isLoading(false);
      //     }
      //
      //   }
      //
      //
      //
      // }


  }
}