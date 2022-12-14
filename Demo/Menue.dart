import 'package:flutter/material.dart';

import 'FavoriteProvider/homePage.dart';
import 'Provider update API/screen/home_Page.dart';
import 'Sliver/DemoSliver.dart';

class DemoMenue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Demo Menue"),
      ),
      body: Container(
        color: Colors.grey[800],
        child: ListView(
          children: [
            MenueItem(DemoSliverPage(),"Slivews"),
            MenueItem(FavoriteHome(),"Favorite Provider"),
            MenueItem(ProviderAPI(),"Provider Update API"),
          ],
        ),
      ),
    );
  }

  Widget MenueItem(Widget page,String name){
    return  Builder(
      builder: (context)=> Card(
        color: Colors.black,
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
          },
          title: Text(name,style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center),
        ),
      ),
    );
  }

}
