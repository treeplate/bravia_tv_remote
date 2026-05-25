import 'dart:io';

late Socket socket;

Future<void> connect(InternetAddress address) async {
  socket = await Socket.connect(address, 20060);
}

void sendIIRC(int code) {
  String codeStr = code.toString().padLeft(16, '0');
  socket.add('*SCIRCC$codeStr\n'.codeUnits);
}

Future<void> close(InternetAddress address) async {
  socket.close();
}