import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:path/path.dart';

import '/ViewModels/ApiDebuging.dart';

class Service {
  final String Url;
  Service({this.Url});
  Future<bool> addImage(Map<String, String> body, List<File> filepath) async {
    if (filepath[0] == null) return false;
    print("I am hear 1  :=${body}");
    //String addimageUrl = '$IP/api/add';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(Url));
    request.headers.addAll(headers);
    request.fields.addAll(body);

    List<MultipartFile> newList = new List<MultipartFile>();

    for (int i = 0; i < filepath.length; i++) {
      var multipartFile =  await http.MultipartFile.fromPath('image[]', filepath[i].path);
      newList.add(multipartFile);
    }

    request.files.addAll(newList);

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

/*      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });*/

      return false;
    }
  }


  Future<bool> addNewEvent(Map map) async {
    bool check;
    await http.post(Uri.parse(Url), body:map /*{
      "user_id": list[0],
      "place": list[1],
      "price": list[2],
      "color_id": list[3],
      "products_id": list[4],
    }*/).then((response) {
      if (response.statusCode == 200) {
        map = json.decode(response.body);
       // print("+++++AddNaw_true:${map}");
        check=true;
      } else {
        print("${response.statusCode}");
        print("${json.decode(response.body)}");
        print("ERROR! :(");
        check=false;
       // map = {"status": false};
      }
    });
    return check;
  }

}
