import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/EventProvider.dart';
import 'package:telfun/ViewModels/UserProvider.dart';
import 'package:telfun/Views/widgets/InPlitca.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final List objs;
  final Widget img;

  const ProductPage({Key key, this.title, this.objs, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        EnableBotomMenu: true,
        body: ProductView(title: title,objs: objs,img: img,));
  }
}

class ProductView extends StatelessWidget {
  final String title;
  final List objs;
  final Widget img;

  const ProductView({Key key, this.title, this.objs, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<UserProvider>(context);
    //final List objs = provider.allObjs;
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(SWi * 0.03),
            child: Row(
              children: [
               /* Container(
                  //  color: Colors.red,
                    width: 40,
                    height: 40,
                    child: img),*/
                Text(
                    title,//"Ähli bildirişlerim",
                  style:
                  TextStyle(fontSize: SWi * 0.06, fontWeight: FontWeight.w600),
                ),
              ],
            )),
        Expanded(
          child: Container(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: objs.length, //Get_Lists(listTag: JsonTags.favorite, isApi: false).getList().length ?? 0,
                itemBuilder: (context, index) {
                  print("i am hear 5");
                  final ElemEvents _obj = objs[index];
                  print("i am hear 6 ${_obj.name}");
                  return Container(
                      child: InCategory(
                        obj: _obj,
                        isFavorite: _obj.favorite,
                      ));
                }),
          ),
        ),
      ],
    );
  }
}
