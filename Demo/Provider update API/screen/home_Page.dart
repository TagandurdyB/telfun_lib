import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Demo/Provider%20update%20API/provider/todo_provider.dart';

class ProviderAPI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderAPIHomePage();
  }
}

class ProviderAPIHomePage extends StatefulWidget {
  @override
  _ProviderAPIHomePageState createState() => _ProviderAPIHomePageState();
}

class _ProviderAPIHomePageState extends State<ProviderAPIHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ToDoProvider>(context,listen: false).getAllTodos();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Provider API"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[800],
        width: double.infinity,
        height: double.infinity,
        child: Consumer<ToDoProvider>(
          builder: (context,value,child){
            final _todos=value.todos;
            return ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context,index){
                final _todo=_todos[index];
                return ListTile(
                  title: Text("${_todo.name}",style: TextStyle(color: Colors.white)),
                  leading: CircleAvatar(child: Text("${_todo.id}")),
                  subtitle: Text("${_todo.place}",style: TextStyle(color: Colors.grey[500])),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
