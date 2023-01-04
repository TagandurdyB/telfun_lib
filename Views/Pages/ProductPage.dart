import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/Providers/EventProvider.dart';
import 'package:telfun/ViewModels/Providers/UserProvider.dart';
import 'package:telfun/Views/widgets/InPlitca.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final List objs;
  final Widget img;
  final int mark_id;

  const ProductPage({Key key, this.title, this.objs, this.img, this.mark_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        EnableBotomMenu: true,
        body: ProductView(
          title: title,
          objs: objs,
          img: img,
          mark_id: mark_id,
        ));
  }
}

class ProductView extends StatelessWidget {
  final String title;
  final List objs;
  final Widget img;
  final int mark_id;

  const ProductView({Key key, this.title, this.objs, this.img, this.mark_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsFavoritProvid>(context);
    final eventProvider = Provider.of<EventsProvid>(context);
    final markProvider = Provider.of<UsesVar>(context);
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
                  title,
                  style: TextStyle(
                      fontSize: SWi * 0.06, fontWeight: FontWeight.w600),
                ),
              ],
            )),
        Expanded(
          child: Container(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: objs .length /*eventProvider
                    .sortWithMarks(mark_id,markProvider.sortNum)
                    .length*/
                , //Get_Lists(listTag: JsonTags.favorite, isApi: false).getList().length ?? 0,
                itemBuilder: (context, index) {
                  // final int _mark_id = markProvider.getMark()[0];
                  final int _sort_num = markProvider.sortNum;
                  return Container(
                      child: InCategory(
                    // list: Provider.of<UsesVar>(context).getEvent(),
                    // index: index,
                    obj: objs[index], //  Get_Lists(listTag: ApiTags.events).getList()[index],
                    isFavorite: provider.isExist(objs[index]),
                    // isFavorite: true,
                  ));
                }),
          ),
        ),
      ],
    );
  }
}
