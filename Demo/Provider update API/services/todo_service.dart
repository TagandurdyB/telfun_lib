import 'dart:convert';
import 'package:telfun/Demo/Provider%20update%20API/model/todo.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:http/http.dart' as http;

class ToDOService {
  Future<List<ToDo>> getAll() async {
    print("I am hear");
    String Url = "$IP/api/category/2";
    final uri = Uri.parse(Url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print("All OK!");
      final json = jsonDecode(response.body) as List;
      final toDos = json.map((e) => ToDo(name: e["name"], id: e["id"],place: e["welayat"])).toList();
      return toDos;
    } else {
      print("Error Api!!!");
      return[];
    }
  }
}
