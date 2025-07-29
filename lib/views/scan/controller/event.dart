class CodeEvent {}

class GetCodeEvent extends CodeEvent {
  final String qr;

  GetCodeEvent({required this.qr});
}

class SocketQrEvent extends CodeEvent {
  final String qrCode;

  SocketQrEvent({required this.qrCode});
}


