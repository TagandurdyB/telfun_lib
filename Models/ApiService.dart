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

  Register(List list) async {
    Map<String, dynamic> map;
    await http.post(Uri.parse(URL), body: {
      "name": list[0],
      "phone": list[1],
      "password": list[2],
    }).then((response) {
      if (response.statusCode == 200) {
        map = json.decode(response.body);
      } else {
        print("ERROR! you can't regiseter. Bicause you alrady sing up  :(");
        map = {"status": false};
      }
    });
    return map;
  }

  Login(List list) async {
    Map<String, dynamic> map;
    print(list[0]);
    print(list[1]);
    await http.post(Uri.parse(URL), body: {
      "phone": list[0],
      "password": list[1],
    }).then((response) {
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


