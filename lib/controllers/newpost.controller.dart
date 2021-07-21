import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/postings.controller.dart';
import 'package:my_project/core/models/postinentry.model.dart';

class NewPostController extends GetxController{

  final GlobalKey<FormState> postingFormKey = GlobalKey<FormState>();
  PostingController postingsController = Get.put(PostingController());
  late TextEditingController descriptionController;
  var description = '';

  @override
  void onInit() {
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
      idUser: "6ba7b810-9dad-11d1-80b4-00c04fd430c8"
    ));
    descriptionController.clear();
  }

}