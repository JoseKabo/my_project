
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/profile.controller.dart';
import 'package:my_project/core/datasource/local.data.dart';
import 'package:my_project/core/models/newuserInfo.model.dart';
import 'package:my_project/core/models/signInResponse.model.dart';
import 'package:progress_state_button/progress_button.dart';

class UpdateFormController extends GetxController{

  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  ProfileController _profileController = Get.find<ProfileController>();
  
  final LocalData localData = new LocalData();
  Rx<UserInfo> user = UserInfo().obs;

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
    getMyBasicInfo();
    super.onInit();
    usernameController = TextEditingController( text: _profileController.user.value.username ?? 'posthinks...' );
    emailController = TextEditingController( text: _profileController.user.value.email ?? 'posthinks...' );
    birthdayController = TextEditingController( text: _profileController.user.value.birthday!.toLocal().toString().split(' ')[0] );
    biographyController = TextEditingController( text: _profileController.user.value.biography ?? 'Aun no agregas algo de ti...' );
    // usernameController.text = _profileController.basicInfo.username!;
    // emailController.text = _profileController.basicInfo.email!;
    // birthdayController.text = _profileController.basicInfo.birthday!;
    // biographyController.text = _profileController.basicInfo.biography!;
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

  void getMyBasicInfo() async {
    await localData.getUser().then((value) => {
      if( value!.name!.length > 0)
        user(value)
    });
    print(user.value.name);
    // var infoResponse = await ProfileService.getMyBasicInfo(id: '6ba7b810-9dad-11d1-80b4-00c04fd430c8');
    // if ( infoResponse!.status == 200 && infoResponse.message!.response!.length > 0 ){
    //   this.basicInfo = new Rx(infoResponse.message!.response![0]);
    //   print('Username is: ' + basicInfo.value.username!);
    // }
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
        id: _profileController.user.value.id
      )
    ))){
      buttonState = ButtonState.success;
    }else{
      buttonState = ButtonState.fail;
    }
    
  }

}