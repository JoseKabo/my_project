
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/profile.controller.dart';
import 'package:my_project/core/models/newuserInfo.model.dart';
import 'package:progress_state_button/progress_button.dart';

class UpdateFormController extends GetxController{

  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  ProfileController _profileController = Get.put(ProfileController());
  
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController birthdayController;
  late TextEditingController biographyController;
  
  var username = '';
  final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
  var email = '';
  final emailvalidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var birthday = '';
  var biography = '';

  late ButtonState buttonState = ButtonState.idle;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    birthdayController = TextEditingController();
    biographyController = TextEditingController();
    usernameController.text = _profileController.basicInfo.username!;
    emailController.text = _profileController.basicInfo.email!;
    birthdayController.text = _profileController.basicInfo.birthday!;
    biographyController.text = _profileController.basicInfo.biography!;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    usernameController.dispose();
    emailController.dispose();
    birthdayController.dispose();
    biographyController.dispose();
    super.onClose();
  }

  String? validateUsername(String value){
    if (alphanumeric.hasMatch(value)) {
      return null;
    }
    return "Debe contener letras y numeros";
  }

  String? validateEmail(String value){
    if(emailvalidator.hasMatch(value)){
      return null;
    }else{
      return 'Email invalido';
    }
  }

  void checkForm() async {
    final isValid = updateFormKey.currentState!.validate();
    if (!isValid){
      buttonState = ButtonState.fail;
      return;
    }
    buttonState = ButtonState.loading;
    updateFormKey.currentState!.save();
    if (await (_profileController.updateMyInfo(
      infoModel: new NewUserInfoModel(
        biography: this.biography,
        birthday: DateTime.parse(this.birthday).toLocal().toString().split(' ')[0],
        email: this.email,
        id: "6ba7b810-9dad-11d1-80b4-00c04fd430c8"
      )
    ))){
      buttonState = ButtonState.success;
    }else{
      buttonState = ButtonState.fail;
    }
    
  }

}