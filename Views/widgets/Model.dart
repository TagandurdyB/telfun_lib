import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '/Models/Public.dart';
import 'imgBtn.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';

class Model extends StatefulWidget {
  final String image;

   Model({@required this.image}) ;
 // const Model({Key? key}) : super(key: key);

  @override
  _ModelState createState() => _ModelState();
}

class _ModelState extends State<Model> {
  @override
  Widget build(BuildContext context) {
    return  ImgBtn(
      boxShadow: [BoxShadow(spreadRadius: 0,blurRadius: 3,offset: Offset(1,3),color: Colors.grey),
        BoxShadow(spreadRadius: 0,blurRadius: 3,offset: Offset(-1,3),color: Colors.grey)],
      shape: SWi*0.03,
      width: SWi * 0.35,
      height: SWi * 0.4,
color: Color(0xffF6F2FA),
//colors: [Colors.deepPurple,Colors.blue],
      child: CachedNetworkImage(
        cacheManager: CacheManager(Config("marks",
            stalePeriod: Duration(days: 15), maxNrOfCacheObjects: 200)),
        key: UniqueKey(),
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Center(
            child: FittedBox(
                fit: BoxFit.cover,
                child: Icon(
                  Icons.photo,
                  color: Colors.grey,
                ))),
        imageUrl:
        "$IP/storage/${widget.image}",
        fit: BoxFit.cover,
      ),
    );
  }
}
