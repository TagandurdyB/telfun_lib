import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';

import '/ViewModels/ShPBDebug.dart';
import 'Cacher.dart';
import 'Public.dart';
import 'connect.dart';

class API {
  final String url;
  final Map headers;
  Map body;

  API({
    this.headers,
    this.url,
    this.body,
  });

  Future post(Map _body) async {
    print("BODY:   $_body");
    print("URL:    $url");
    Map<String, dynamic> map;
    print("I am hear 1");
    await http.post(Uri.parse(url), body: _body).then((response) {
      print("I am hear 2");
      if (response.statusCode == 200) {
        map = json.decode(response.body);
        print("request:${map}");
      } else {
        print(
            "ERROR! Code:${response.statusCode}! Be some errors in post method :!(");
        print("ERROR!: ${response.body}");
        map = {"status": false};
      }
    });
    return map;
  }

  Future<Map> get() async {
    Map<String, dynamic> map;
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      map = json.decode(response.body);
      print("request:${map}");
    } else {
      print(
          "ERROR! Code:${response.statusCode} Be some errors in get method  :(");
      print("ERROR!: ${response.body}");
      map = {"status": false};
    }
    return map;
  }

  Register(Map map) async {
    Map<String, dynamic> map;
    await http.post(Uri.parse(url), body: map).then((response) {
      if (response.statusCode == 200) {
        map = json.decode(response.body);
        print("request:${map}");
      } else {
        print("ERROR! you can't regiseter. Bicause you alrady sing up  :(");
        print("ERROR! you can't regiseter. Bicause you alrady sing up  :(");
        map = {"status": false};
      }
    });
    return map;
  }

  Login(Map _map) async {
    Map<String, dynamic> map;
    await http.post(Uri.parse(url), body: _map).then((response) {
      if (response.statusCode == 200) {
        map = json.decode(response.body);
      } else {
        print("${response.statusCode}");
        print("${json.decode(response.body)}");
        print("ERROR! you can't Login. Bicause you not sign up  :(");
        map = {"status": false};
      }
    });
    return map;
  }

  Future<List> getDate(String fileName) async {
    bool _isConnect = await isConnected();

    if (_isConnect) {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print("Loading from API...");
        Cacher.writeJson(fileName, response.body);
        return json.decode(response.body);
      } else
        print("Error Code:${response.statusCode}");
    } else {
      print('not connected');
      File file = await Cacher.getDirectory(fileName);
      if (file.existsSync()) {
        print("Loading from local...");
        print("cach map:${await Cacher.readJson(fileName)}");
        return Cacher.readJson(fileName);
      }
    }
  }

  Future<List> getDatePost(String fileName) async {
   // body={"mark_id":json.encode([2,3])};
    print("builder body:${body}");
    print("builder URL :${url}");
    List _listData=[];
    bool _isConnect = await isConnected();
    if (_isConnect) {
      await http.post(Uri.parse(url), body: (body)).then((response) {
        if (response.statusCode == 200) {
          print("Loading from API... ${response.body}");
          Cacher.writeJson(fileName, response.body);
          _listData= json.decode(response.body);
        } else
          print("Error Code:${response.statusCode}");
      });
    } else {
      print('not connected');
      File file = await Cacher.getDirectory(fileName);
      if (file.existsSync()) {
        print("Loading from local...");
        print("cach map:${await Cacher.readJson(fileName)}");
        _listData=Cacher.readJson(fileName)as List;
      }
    }
    return _listData;
  }

/*   void getDateStream()  async{
     final response = await http.get(Uri.parse(URL));
     var apiList=json.decode(response.body).toString();
     print(apiList);
     myStreamControler.sink.add(apiList);
     //return json.decode(response.body);
   }*/

  Stream getDateStream() async* {
    yield* Stream.periodic(Duration(minutes: 1), (_) async {
      final response = await http.get(Uri.parse(url));
      print(json.decode(response.body).toString());
      return json.decode(response.body);
    }).asyncMap((event) async => await event);
  }

  getBerarer(String token) async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // print(json.decode(response.body).toString());
    return json.decode(response.body);
  }
}
