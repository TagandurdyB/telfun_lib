import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Demo/FavoriteProvider/favoritePage.dart';

import 'favoriteProvider.dart';

class FavoriteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
        child: MaterialApp(home: HomePage()));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  /*  Elem a1=Elem(name:"123",id: 1);
    Elem a2=Elem(name:"123",id: 1);
    if(listEquals([a1],[a2]))
    print("OK!");
    else
      print("NO!");*/

    final List<Elem> words = [
      Elem(id: 1, name: "salam"),
      Elem(id: 2, name: "goodbye")
    ];
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  final routeFa = MaterialPageRoute(
                      builder: (context) => FavoriteDemoPage());
                  Navigator.push(context, routeFa);
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.green,
                )),
          ],
          backgroundColor: Colors.grey[900],
          title: Text("Home Page"),
          centerTitle: true),
      body: Container(
        color: Colors.grey[800],
        child: ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) {
              final Elem word = words[index];
              print("WORD:${word.name}");
              return Card(
                color: Colors.grey[700],
                child: ListTile(
                  title: Text("${word.name}"),
                  trailing: IconButton(
                      onPressed: () {
                        provider.tongleFavorite(word);
                      },
                      icon: provider.isExist(word)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(Icons.favorite_border)),
                ),
              );
            }),
      ),
    );
  }
}
