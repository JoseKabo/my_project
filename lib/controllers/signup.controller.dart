

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_project/core/models/SingUpResponse.model.dart';
import 'package:my_project/core/models/signUp.mode.dart';
import 'package:my_project/core/services/auth/signUp.service.dart';
import 'package:progress_state_button/progress_button.dart';

class SignUpController extends GetxController {

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  RxString messageResponse = ''.obs;

  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController birthdayController;
  late TextEditingController passwordController;
  late TextEditingController biographyController;

  var username = '';
  var name = '';
  final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
  var email = '';
  final emailvalidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var birthday = '';
  var biography = '';
  var password = '';
  final passValidator = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

  late ButtonState buttonState = ButtonState.idle;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    birthdayController = TextEditingController();
    biographyController = TextEditingController();
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
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateUsername(String value){
    if (alphanumeric.hasMatch(value) && value.length>=4 ) {
      return null;
    }
    return "Por favor guiate del ejemplo";
  }

  String? validateEmail(String value){
    if(emailvalidator.hasMatch(value)){
      return null;
    }else{
      return 'Email invalido';
    }
  }

  String? validatePassword(String value){
    if(passValidator.hasMatch(value)){
      return null;
    }else{
      return 'Deben ser 8 carácteres basado en el ejemplo';
    }
  }

  String? validateBirthday({String value='1999-01-01'}){
    var year = DateTime.now().year;
    var userYear = DateTime.parse(value).year;
    if ((year - userYear) < 16){
      return 'Deben tener más de 16 años 🤔';
    }
    return null;
  }

  bool checkForm() {
    final isValid = signUpFormKey.currentState!.validate();
    if (!isValid){
      buttonState = ButtonState.fail;
      return false;
    }
    buttonState = ButtonState.loading;
    signUpFormKey.currentState!.save();
    return true;
  }

  void cleanFields(){
    nameController.clear();
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    birthdayController.clear();
  }

  Future<bool> signUpRequest() async {

    if(checkForm() ){
      SharedModelReponse response = await SignUpService.signUp(
        model: new SignUpModel(name: name, username: username, email: email, birthday: DateTime.parse(birthday), password: password)
      );
      if(response != null && response.error == false && response.message.endsWith('correcatamente')){
        this.messageResponse.value = response.message;
        this.buttonState = ButtonState.success;
        return true;
      }
      this.messageResponse.value = response.message;
      this.buttonState = ButtonState.fail;
      return false;
    }else{
      return false;
    }

  }

}
