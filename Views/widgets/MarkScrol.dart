import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';

class MarkScrol extends StatefulWidget {
  @override
  State<MarkScrol> createState() => _MarkScrolState();
}

class _MarkScrolState extends State<MarkScrol> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SWi,
      height: SWi * 0.25,
      //  color: Colors.red,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(
            Get_Lists(listTag:ApiTags.mark).getList().length ?? 0,
            (index) => Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SWi * 0.01, horizontal: SWi * 0.02),
                  child: ImgBtn(
                      boxShadow: [
                        BoxShadow(
                            color: Provider.of<UsesVar>(context).getMark()[1] ==
                                    index
                                ? Colors.purpleAccent
                                : Colors.grey[300],
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: Offset(0, 3))
                      ],
                      color: Provider.of<UsesVar>(context).getMark()[1] == index
                          ? Color(0xff9747FF)
                          : Colors.grey,
                      shape: SWi * 0.03,
                      width: SWi * 0.21,
                      child: Padding(
                        padding: EdgeInsets.all(SWi * 0.005),
                        child: ImgBtn(
                          color: Colors.white,
                          shape: SWi * 0.027,
                          width: SWi * 0.21,
                          onTap: () {
                            print("i am working");
                            Provider.of<UsesVar>(context, listen: false)
                                .changeMark(
                                Get_Lists(listTag:ApiTags.mark).getList()[index].id,
                                    index);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(SWi * 0.01),
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
                                  "$IP/storage/${Get_Lists(listTag:ApiTags.mark).getList()[index].image}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
                )),
      ),
    );
  }
}
