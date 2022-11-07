import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '/ViewModels/ShPBDebug.dart';

class API {
   String URL; /*, name, phone, region, district, payment;*/

  API(this.URL /*, this.name, this.phone, this.region, this.district, this.payment,
      this.list,*/
      );

  Register(List list) async{
    Map<String,dynamic> map;
     await http.post(Uri.parse(URL),
        body: {
      "name": list[0],
      "phone": list[1],
      "password": list[2],
    }).then((response) {
      if(response.statusCode==200){
        map= json.decode(response.body);
      }else{
        print("ERROR! you can't regiseter. Bicause you alrady sing up  :(");
        map= {"status":false};
      }
    } );
    return map;
  }

   Login(List list) async{
     Map<String,dynamic> map;
     print(list[0]);
     print(list[1]);
     await http.post(Uri.parse(URL),
         body: {
           "phone": list[0],
           "password": list[1],
         }).then((response) {
       if(response.statusCode==200){
         map= json.decode(response.body);
       }else{
         print("${response.statusCode}");
         print("${json.decode(response.body)}");
         print("ERROR! you can't Login. Bicause you not sign up  :(");
         map= {"status":false};
       }
     } );
     return map;
   }

  Future<List> getDate() async {
    final response = await http.get(Uri.parse(URL));
    print(json.decode(response.body).toString());
    return json.decode(response.body);
  }

   getBerarer(String token) async {
     final response = await http.get(Uri.parse(URL),headers: {
       'Content-Type': 'application/json',
       'Accept': 'application/json',
       'Authorization': 'Bearer $token',
     });
    // print(json.decode(response.body).toString());
     return json.decode(response.body);
   }

}

Map<String,List> ApiBase={};
