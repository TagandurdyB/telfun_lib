import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:path/path.dart';

import '/ViewModels/ApiDebuging.dart';

class Service {
  Future<bool> addImage(Map<String, String> body, List<File> filepath) async {
    if (filepath[0] == null) return false;
    print("I am hear 1");
    String addimageUrl = '$IP/api/add';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl));
    request.headers.addAll(headers);
    request.fields.addAll(body);

    List<MultipartFile> newList = new List<MultipartFile>();

   /* http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'file', filepath[]);*/

    for (int i = 0; i < filepath.length; i++) {
      var multipartFile = await http.MultipartFile.fromPath(
          'image', filepath[i].path);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);



/*    List<MultipartFile> newList = new List<MultipartFile>();
    for (int i = 0; i < filepath.length; i++) {
      File imageFile = filepath[i];
      var stream  = new http.ByteStream(imageFile.openRead());
      stream.cast();
      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile("imagefile", stream, length,
          filename: basename(imageFile.path));
      newList.add(multipartFile);
    }
    request.files.addAll(newList);*/

/*    List<MultipartFile> newList = new List<MultipartFile>();
    for (int i = 0; i < filepath.length; i++) {
      File imageFile = File(filepath[i].toString());
      var multipartFile = new http.MultipartFile("imagefile", stream, length,
          filename: basename(imageFile.path));
     */ /* var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile("imagefile", stream, length,
          filename: basename(imageFile.path));*/ /*
      newList.add(multipartFile);
    }
    request.files.addAll(newList);*/

    //request.files.add(await http.MultipartFile.fromPath('image', filepath[0]));
    /*     if(filepath[1]!="")
      request.files.add(await http.MultipartFile.fromPath('image1', filepath[1]));*/
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
