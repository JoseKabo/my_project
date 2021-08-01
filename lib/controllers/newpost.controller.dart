import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/postings.controller.dart';
import 'package:my_project/core/datasource/local.data.dart';
import 'package:my_project/core/models/postinentry.model.dart';
import 'package:my_project/core/models/signInResponse.model.dart';

class NewPostController extends GetxController{

  final GlobalKey<FormState> postingFormKey = GlobalKey<FormState>();
  // PostingController postingsController = Get.put(PostingController());
  PostingController postingsController = Get.find<PostingController>();

  LocalData localData = new LocalData();
  Rx<UserInfo> user = UserInfo().obs;

  late TextEditingController descriptionController;
  var description = '';

  @override
  void onInit() {
    getMyBasicInfo();
    super.onInit();
    descriptionController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    descriptionController.dispose();
    super.onClose();
  }

  void getMyBasicInfo() async {
    await localData.getUser().then((value) => {
      if( value!.name!.length > 0)
        user(value)
    });
  }

  String? validateDescription(String value){
    if (value.length < 5) {
      return "Texto demasiado corto";
    }
    return null;
  }

  void checkForm()async{
    final isValid = postingFormKey.currentState!.validate();
    if(!isValid)
      return;
    postingFormKey.currentState!.save();
    postingsController.addPosting(body: new AddPostModel(
      description: description,
      idUser: user.value.id
    ));
    descriptionController.clear();
  }

}