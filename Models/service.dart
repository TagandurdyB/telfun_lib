import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:telfun/ViewModels/ApiDebuging.dart';

class Service {
  Future<bool> addImage(Map<String, String> body, List<String> filepath) async {
    if(filepath[0]=="")
      return false;
    print("I am hear 1");
    String addimageUrl = '$IP/api/add';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl));
    request.headers.addAll(headers);
      request.fields.addAll(body);
      request.files.add(await http.MultipartFile.fromPath('image', filepath[0]));
      if(filepath[1]!="")
      request.files.add(await http.MultipartFile.fromPath('image1', filepath[1]));
    print("I am hear 2  ${filepath.toString()}");
    var response = await request.send();
    print("+*+${response.statusCode}");



    if (response.statusCode == 200) {
      print("${response.statusCode}");
      print("${response.stream.bytesToString()}");
      return true;
    } else {
      print("${response.statusCode}");
      print("${body.toString()}");

      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

      return false;
    }
  }
}