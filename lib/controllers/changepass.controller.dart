

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/datasource/local.data.dart';
import 'package:my_project/core/models/SingUpResponse.model.dart';
import 'package:my_project/core/models/updatePassword.model.dart';
import 'package:my_project/core/services/myprofile.service.dart';
import 'package:progress_state_button/progress_button.dart';

class ChangePassController extends GetxController{

  LocalData _localData = new LocalData();
  String id = '';

  final GlobalKey<FormState> changePassKey = GlobalKey<FormState>();
  RxString messageResponse = ''.obs;

  late TextEditingController lastPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController repeatPasswordController;

  var lastPassword = '';
  var newPassword = '';
  var repeatPassword = '';
  final passValidator = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

  late ButtonState buttonState = ButtonState.idle;

  @override
  void onInit() {
    // TODO: implement onInit
    getLocalId();
    super.onInit();
    lastPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    repeatPasswordController = TextEditingController();
  }
  
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    lastPasswordController.dispose();
    newPasswordController.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }

  void getLocalId(){
    _localData.getUser()
      .then((value) => {
        this.id = value!.id!
      });
  }

  String? validateLastPassword(String value){
    if(passValidator.hasMatch(value)){
      return null;
    }else{
      return 'Última contraseña de la cuenta inválida';
    }
  }

  String? validateNewPassword(String value){
    if(passValidator.hasMatch(value) && value != lastPasswordController.value.text){
      return null;
    }else{
      return 'Contraseña inválida o es la misma 😃';
    }
  }

  String? validateRepeatPassword(String value){
    if( value == newPasswordController.value.text){
      return null;
    }else{
      return 'No se parecen, amigo. Revisa de nuevo 🙄';
    }
  }

  void cleanFields(){
    lastPasswordController.clear();
    newPasswordController.clear();
    repeatPasswordController.clear();
  }

  bool checkForm() {
    final isValid = changePassKey.currentState!.validate();
    if (!isValid){
      buttonState = ButtonState.fail;
      return false;
    }
    buttonState = ButtonState.loading;
    changePassKey.currentState!.save();
    return true;
  }

  Future<bool> changePassword() async {
    if(checkForm()){
      SharedModelReponse? response = await ProfileService.updatePassword(
        model: new UpdatePassword(id: id, lastPassword: lastPassword, newPassword: repeatPassword)
      );
      if(response != null && response.error == false && response.message.endsWith('actualizada')){
        this.messageResponse.value = response.message;
        this.buttonState = ButtonState.success;
        return true;
      }
      this.messageResponse.value = response!.message;
      this.buttonState = ButtonState.fail;
      return false;
    }else {
      return false;
    }
  }



}
