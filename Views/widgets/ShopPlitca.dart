import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';

class ShopPlitca extends StatelessWidget {
  final obj;
  ShopPlitca({Key key, this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: SWi * 0.02, vertical: SWi * 0.017),
      alignment: Alignment.center,
      child: ImgBtn(
        width: SWi * 0.9,
        height: SWi * 0.25,
        borderWidth: 2,
        color: Colors.transparent,
        borderColor: Color(0xff6A00FF),
        //child: Text("${obj.name}"),
        child: Row(
          children: [
            Expanded(
              child: Container(
                // color: Colors.grey,
                child: CachedNetworkImage(
                  cacheManager: CacheManager(Config("events",
                      stalePeriod: Duration(days: 15),
                      maxNrOfCacheObjects: 200)),
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
                  imageUrl: "$IP/storage/${obj.images[0].image}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                // color: Colors.blue,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                            "${obj.name}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: SWi * 0.035),
                          )),
                          SizedBox(height: SWi * 0.01),
                          Container(
                              child: Text(
                            "${obj.shortAbout()}",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: SWi * 0.03),
                          )),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: SWi * 0.01,
                        left: SWi * 0.02,
                        child: Container(
                          child: Text(
                            "Aşgabat",
                            style: TextStyle(fontSize: SWi * 0.03),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
