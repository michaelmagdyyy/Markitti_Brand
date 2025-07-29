import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/routes/app_routes_fun.dart';
import '../../core/routes/routes.dart';
import '../../core/services/server_gate.dart';
import '../../core/widgets/flash_helper.dart';
import '../../models/user.dart';

part 'logout_event.dart';

part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvents, LogoutStates> {
  LogoutBloc() : super(LogoutStates()) {
    on<LogoutEvent>(_logout);
  }

  Future<void> _logout(LogoutEvent event, Emitter<LogoutStates> emit) async {
    emit(LogoutLoadingState());
    final response = await ServerGate.i.sendToServer(url: "client/logout", body: {
      "type": Platform.isAndroid ? 'android' : 'ios',
      "device_token": "await GlobalNotification.getFcmToken()",
    });
    if (response.success) {
      UserModel.i.clear();
      pushAndRemoveUntil(NamedRoutes.login);
      emit(LogoutSuccessState(msg: response.msg));
    } else {
      emit(LogoutFailedState(msg: response.msg));
    }
  }
}
