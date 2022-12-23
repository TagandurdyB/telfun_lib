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
  String URL;
  final Map Post; /*, name, phone, region, district, payment;*/

  API(
      {this.URL,
      this.Post} /*, this.name, this.phone, this.region, this.district, this.payment,
      this.list,*/
      );


  Future<Map> POST(Map _map)async{
    Map<String, dynamic> map;
    await http.post(Uri.parse(URL), body: _map).then((response) {
      if (response.statusCode == 200) {
        map = json.decode(response.body);
        print("request:${map}");
      } else {
        print("ERROR! you can't regiseter. Bicause you alrady sing up  :(");
        map = {"status": false};
      }
    });
    return map;
  }


  Register(Map map) async {
    Map<String, dynamic> map;
    await http.post(Uri.parse(URL), body: map).then((response) {
      if (response.statusCode == 200) {
        map = json.decode(response.body);
        print("request:${map}");
      } else {
        print("ERROR! you can't regiseter. Bicause you alrady sing up  :(");
        map = {"status": false};
      }
    });
    return map;
  }

  Login(Map _map) async {
    Map<String, dynamic> map;
    await http.post(Uri.parse(URL), body: _map/*body: {
      "phone": list[0],
      "password": list[1],
    }*/).then((response) {
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
      final response = await http.get(Uri.parse(URL));
      if (response.statusCode == 200) {
        print("Loading from API...");
        // writeJson(fileName, response.body);
        return json.decode(response.body);
      }
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

/*   void getDateStream()  async{
     final response = await http.get(Uri.parse(URL));
     var apiList=json.decode(response.body).toString();
     print(apiList);
     myStreamControler.sink.add(apiList);
     //return json.decode(response.body);
   }*/

  Stream getDateStream() async* {
    yield* Stream.periodic(Duration(minutes: 1), (_) async {
      final response = await http.get(Uri.parse(URL));
      print(json.decode(response.body).toString());
      return json.decode(response.body);
    }).asyncMap((event) async => await event);
  }

  getBerarer(String token) async {
    final response = await http.get(Uri.parse(URL), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // print(json.decode(response.body).toString());
    return json.decode(response.body);
  }
}


