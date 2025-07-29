import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/server_gate.dart';
import '../../../models/code_model.dart';
import '../../../models/info_model.dart';
import 'event.dart';
import 'state.dart';

class CodeBloc extends Bloc<CodeEvent, CodeState> {
  CodeBloc() : super(CodeState()) {
    on<GetCodeEvent>(_fun);
    on<SocketQrEvent>(socketQr);
  }

  final price = TextEditingController();
  CodeModel? model;
  InfoModel? infoModel;

  Future<void> _fun(GetCodeEvent event, Emitter<CodeState> emit) async {
    emit(LoadingCodeState());

    final response = await ServerGate.i.sendToServer(
      url: 'Purchasing/scan_qr_code',
      body: {
        "qr_code": event.qr,
        "brand_id": 2,
        "branch_id": 1,
        "invoice_amount": price.text,
      },
    );
    if (response.success) {
      emit(DoneCodeState(response.data['message']));
    } else {
      emit(FailedCodeState(response.data['message']));
    }
  }

  Future<void> socketQr(SocketQrEvent event, Emitter<CodeState> emit) async {
    emit(LoadingSocketQrState());

    final response = await ServerGate.i.sendToServer(
      url: 'Purchasing/transaction_details',
      body: {
        "qr_code": event.qrCode,
      },
    );
    if (response.success) {
      infoModel = InfoModel.fromJson(response.data['data']);
      emit(DoneSocketQrState(response.msg));
    } else {
      emit(FailedSocketQrState(response.msg));
    }
  }
}
