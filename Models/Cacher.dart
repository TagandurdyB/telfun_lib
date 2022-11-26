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

  static writeJson(String fileName,String body) async {
    File file = await getDirectory(fileName);
    file.writeAsStringSync(body, flush: true, mode: FileMode.write);
  }

  static Future<List> readJson(String fileName) async {
    File file = await getDirectory(fileName);
    String jsonDate;
    if (file.existsSync()) {
      jsonDate = file.readAsStringSync();
      return json.decode(jsonDate);
    } else {
      return null;
    }
  }
}

