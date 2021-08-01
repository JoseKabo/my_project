

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:my_project/core/datasource/local.data.dart';
import 'package:my_project/core/models/signIn.model.dart';
import 'package:my_project/core/models/signInResponse.model.dart';
import 'package:my_project/core/services/auth/signin.service.dart';
import 'package:progress_state_button/progress_button.dart';

class SignInFormController extends GetxController{

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  LocalData _localData = LocalData();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  ButtonState? btnState = ButtonState.idle;


  var email = '';
  var password = '';
  final emailvalidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateEmail(String value){
    if(emailvalidator.hasMatch(value)){
      return null;
    }else{
      return 'Email invalido';
    }
  }

  String? validatePassword(String value){
    if (value.length >= 6 ) {
      return null;
    }
    return "Deben ser por lo menos 6 carácteres";
  }

  Future<bool> signInRequest() async {
      var response = await SignInService.signIn(
        model: new SignInModel(
          email: this.email,
          password: this.password
        )
      );
      if(response != null && response.error == false && response.userInfo != null){
        this.btnState = ButtonState.success;
        this._localData.saveUser(response.userInfo ?? new UserInfo());
        return true;
      }
      print(response);
      this.btnState = ButtonState.fail;
      return false;
    
  }

  bool checkForm() {
    final isValid = signInFormKey.currentState!.validate();
    if(!isValid){
      return false;
    }else{
      email = emailController.text;
      password = passwordController.text;
      return true;
    }
  }

  



}
