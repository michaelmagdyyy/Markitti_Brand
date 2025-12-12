import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/server_gate.dart';
import '../../../../models/user.dart';
import 'event.dart';
import 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<StartLoginEvent>(_fun);
  }

  final formKey = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  final phone = TextEditingController(text: kDebugMode ? '01002532024' : '');
  final password = TextEditingController(text: 'www123oooo');
  late UserModel userModel;

  Future<void> _fun(StartLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoadingLoginState());

    final deviceToken = "await FirebaseMessaging.instance.getToken()";
    final response = await ServerGate.i.sendToServer(
      url: 'Authentication/sign_in',
      body: {
        "mobile_number": phone.text,
        "pass": password.text,
        "operating_system": Platform.operatingSystem,
        "device_token": deviceToken
      },
    );
    if (response.success) {
      // if (response.data["data"]["is_active"] == false) {
      //   // push(VerifyCodeScreen(fromRegister: true, phone: phone.text, phoneCode: event.phoneCode));
      //   emit(FailedLoginState(response.msg));
      // } else {
      //   // userModel = UserModel.fromJson(response.data);
      //   // saveData(model: userModel);
      //   // pushAndRemoveUntil(const NavBar());
      //   emit(DoneLoginState(response.msg));
      // }
      emit(DoneLoginState(response.msg));
    } else {
      emit(FailedLoginState(response.msg));
    }
  }
}
