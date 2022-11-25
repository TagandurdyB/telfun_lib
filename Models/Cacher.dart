import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class Cacher{
  static Future<File> getDirectory(String fileName) async {
    var dir = await getTemporaryDirectory();
    print("${dir.path}/$fileName.json");
    File file = new File("${dir.path}/$fileName.json");
    return file;
  }

  static writeJson(String fileName,  body) async {
    File file = await getDirectory(fileName);
    // print("+++++++++++++******$fileName Json--:$body}");
    //print("salkfasdlk: ${json.decode(body.toString())}");
    file.writeAsStringSync(body.toString(), flush: true, mode: FileMode.write);
  }

  static Future<List> readJson(String fileName) async {
    print("i am hear 1");
    File file = await getDirectory(fileName);
    print("i am hear 2");
    String jsonDate;
    print("i am hear 3");
    if (file.existsSync()) {
      print("i am hear 4");
      jsonDate = file.readAsStringSync();
      print("i am hearasdasd 1 :${jsonDate}");
      print("i am hearasdasd 2**:${json.decode(jsonDate).toString()}");
      return json.decode(jsonDate);
    } else {
      return null;
    }
  }
}

