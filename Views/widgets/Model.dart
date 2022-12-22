import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/EventProvider.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import 'package:telfun/Views/Pages/InModelPage.dart';
import 'package:telfun/Views/Pages/ProductPage.dart';

import '/Models/Public.dart';
import 'imgBtn.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';

class Model extends StatefulWidget {
  final String image, name;
  final int mark_id;

  Model({@required this.image, this.name, this.mark_id});
  // const Model({Key? key}) : super(key: key);

  @override
  _ModelState createState() => _ModelState();
}


class _ModelState extends State<Model> {

  Widget cacheImg(){
    return  CachedNetworkImage(
      cacheManager: CacheManager(Config("marks",
          stalePeriod: Duration(days: 15), maxNrOfCacheObjects: 200)),
      key: UniqueKey(),
      placeholder: (context, url) =>
          Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Center(
          child: FittedBox(
              fit: BoxFit.fill,
              child: Icon(
                Icons.photo,
                color: Colors.grey,
              ))),
      imageUrl: "$IP/storage/${widget.image}",
      fit: BoxFit.contain,
    );
  }


  @override
  Widget build(BuildContext context) {
    final eventProvid=Provider.of<EventsProvid>(context);
    final providerVar=Provider.of<UsesVar>(context);
    return ImgBtn(
      onTap: ()
      {
        //Provider.of<UsesVar>(context,listen: false).changeMark(widget.mark_id,-1);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InModelPage(
                      img: cacheImg(),
                      title: widget.name,
                      mark_id: widget.mark_id,
                    )));
      },
      boxShadow: ThemeProvided().shadowModel,
      shape: SWi * 0.03,
      width: SWi * 0.35,
      height: SWi * 0.38,
      color: ThemeProvided().colorModel,
      child: Column(
        children: [
          Container(
            width: SWi*0.3,
            height: SWi*0.3,
            padding: EdgeInsets.all(SWi*0.02),
            child:cacheImg(),
          ),
          Container(child: Text("${widget.name}",style: TextStyle(fontSize: SWi*0.03,fontWeight: FontWeight.w600),textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}
