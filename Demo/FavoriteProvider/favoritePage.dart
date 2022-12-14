import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Demo/FavoriteProvider/favoriteProvider.dart';

class FavoriteDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final List words = provider.words;
    print("list:${words}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Favorite Page"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[800],
        child: ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) {
              final Elem word = words[index];
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
                        : Icon(Icons.favorite_border),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
