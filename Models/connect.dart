import 'dart:io';

Future<bool> isConnected() async {
  bool _answer;
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      _answer = true;
    }
  } on SocketException catch (_e) {
    print('not connected. ERROR:$_e');
    _answer = false;
  }
  return _answer;
}
