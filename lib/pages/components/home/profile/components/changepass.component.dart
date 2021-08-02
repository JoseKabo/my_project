import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/changepass.controller.dart';
import 'package:my_project/pages/shared/simpleElements/topheadersheet.widget.dart';
import 'package:my_project/shared/colors.dart';
import 'package:progress_state_button/progress_button.dart';

class ChangePasswordComponent extends StatefulWidget {
  ChangePasswordComponent({Key? key, ScrollController? scrollController}) : super(key: key);

  @override
  _ChangePasswordComponentState createState() => _ChangePasswordComponentState();
}

class _ChangePasswordComponentState extends State<ChangePasswordComponent> {
  get scrollController => null;

  ChangePassController _changePassController = Get.put(ChangePassController());
  bool isVisible = false;
  
  ButtonState currentState = ButtonState.idle;
  RxBool awaitResponse = false.obs;

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(25.0),
            topLeft: const Radius.circular(25.0)
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF2C061F),
              Color(0xFF060930),
            ]
          ),
        ),
        padding: EdgeInsets.all(15),
        child: ListView(
          controller: scrollController,
          children: [
            topSheetElement(size),
            topTitleSheetElement(title: 'Cambiar contraseña', size: size),
            SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                    child: Container(
                      width: size.width * 0.99,
                      // margin: EdgeInsets.symmetric(vertical: 30.0),
                      padding: EdgeInsets.only(
                        top: 20.0
                      ),
                      child: Form(
                        key: _changePassController.changePassKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 12,
                                right: 12,
                                bottom: 15
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Mostrar',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Switch(
                                    value: isVisible,
                                    onChanged: (bool value) {
                                      setState(() {
                                        isVisible = value;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            _lastPasswordInput(),
                            _newPasswordInput(),
                            _repeatPasswordInput(),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 25,
                                      bottom: 15
                                    ),
                                    child: ProgressButton(
                                      stateWidgets: {
                                        ButtonState.idle: Text("REGISTRARSE AHORA",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                                        ButtonState.loading: Text("Por favor espere",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                                        ButtonState.fail: Text("Algo salio mal",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                                        ButtonState.success: Text("Excelente :D",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
                                      },
                                      stateColors: {
                                        ButtonState.idle: ApplicationColors.kSignInPrimaryButtonColor,
                                        ButtonState.loading: Colors.blue.shade300,
                                        ButtonState.fail: Colors.red.shade300,
                                        ButtonState.success: Colors.green.shade400,
                                      },
                                      onPressed: () async {
                                        if(!_changePassController.checkForm() ||  awaitResponse.value ){
                                          setState(() {
                                            (awaitResponse.value) 
                                              ? this.currentState = ButtonState.loading
                                              : this.currentState = ButtonState.fail;
                                            if(awaitResponse.value){
                                                Fluttertoast.showToast(
                                                  msg: "Petición en curso...",
                                                  toastLength: Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 5
                                              );
                                            }
                                          });
                                          return;
                                        }
                                        awaitResponse.value = true;
                                        setState(() {
                                          this.currentState = ButtonState.loading;
                                        });
                                        bool booleanResponse = await _changePassController.changePassword();
                                        Future.delayed(Duration(milliseconds: 3500), () {
                                          setState(()  {
                                            this.currentState =  booleanResponse
                                                ? ButtonState.success
                                                : ButtonState.fail;
                                            Fluttertoast.showToast(
                                                msg: _changePassController.messageResponse.value,
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 3
                                            );
                                          });
                                          if(this.currentState == ButtonState.success){
                                            _changePassController.cleanFields();
                                            Navigator.pop(context);
                                          }
                                          awaitResponse.value = false;
                                        });
                                      },
                                      
                                      state: currentState,
                                    )
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * .40,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _lastPasswordInput(
  ){
    return Container(
      padding: EdgeInsets.all(8.00),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Última contraseña',
                  style: TextStyle(
                    color: Colors.white70
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            decoration: new InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              hintText: 'ej. JuanPo6*',
              hintStyle: TextStyle(
                color: Colors.white70,
                fontSize: 14
              ),
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.white70,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                  style: BorderStyle.none
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              errorStyle: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              counterStyle: TextStyle(
                color: Colors.white70
              )
            ),
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            obscureText: !isVisible,
            obscuringCharacter: '⊙',
            cursorColor: Colors.white,
            cursorRadius: Radius.circular(12),
            cursorHeight: 24,
            cursorWidth: 2.5,
            maxLength: 8,
            controller: _changePassController.lastPasswordController,
            onSaved: (value) => _changePassController.lastPassword = value!,
            validator: (value) => _changePassController.validateLastPassword(value!),
          ),
        ],
      ),
    );
  }

  Widget _newPasswordInput(
  ){
    return Container(
      padding: EdgeInsets.all(8.00),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nueva contraseña',
                  style: TextStyle(
                    color: Colors.white70
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            decoration: new InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              hintText: 'ej. JuanPo6*',
              hintStyle: TextStyle(
                color: Colors.white70,
                fontSize: 14
              ),
              prefixIcon: Icon(
                Icons.password,
                color: Colors.white70,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                  style: BorderStyle.none
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              errorStyle: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              counterStyle: TextStyle(
                color: Colors.white70
              )
            ),
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            obscureText: !isVisible,
            obscuringCharacter: '⊙',
            cursorColor: Colors.white,
            cursorRadius: Radius.circular(12),
            cursorHeight: 24,
            cursorWidth: 2.5,
            maxLength: 8,
            controller: _changePassController.newPasswordController,
            onSaved: (value) => _changePassController.newPassword = value!,
            validator: (value) => _changePassController.validateNewPassword(value!),
          ),
        ],
      ),
    );
  }

  Widget _repeatPasswordInput(
  ){
    return Container(
      padding: EdgeInsets.all(8.00),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Repite la nueva contraseña',
                  style: TextStyle(
                    color: Colors.white70
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            decoration: new InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              hintText: 'ej. JuanPo6*',
              hintStyle: TextStyle(
                color: Colors.white70,
                fontSize: 14
              ),
              prefixIcon: Icon(
                Icons.password,
                color: Colors.white70,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                  style: BorderStyle.none
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              errorStyle: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2.0,
                  style: BorderStyle.solid
                )
              ),
              counterStyle: TextStyle(
                color: Colors.white70
              )
            ),
            keyboardType: TextInputType.text,
            style: new TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            obscureText: !isVisible,
            obscuringCharacter: '⊙',
            cursorColor: Colors.white,
            cursorRadius: Radius.circular(12),
            cursorHeight: 24,
            cursorWidth: 2.5,
            maxLength: 8,
            controller: _changePassController.repeatPasswordController,
            onSaved: (value) => _changePassController.repeatPassword = value!,
            validator: (value) => _changePassController.validateRepeatPassword(value!),
          ),
        ],
      ),
    );
  }


}