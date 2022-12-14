import 'package:flutter/material.dart';
import 'package:telfun/Demo/Provider%20update%20API/services/todo_service.dart';
import '/Demo/Provider%20update%20API/model/todo.dart';

class ToDoProvider extends ChangeNotifier{
  ToDOService service=ToDOService();
  bool isLoading=false;
List<ToDo> _todos=[];
List<ToDo> get todos =>_todos;
Future<void>  getAllTodos() async {
  isLoading=true;
  notifyListeners();
  final response=await service.getAll();
  _todos=response;
  isLoading=false;
  notifyListeners();
}
}