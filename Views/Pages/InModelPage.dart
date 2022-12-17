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

class InModelPage extends StatelessWidget {
  final String title;
  final Widget img;
  final int mark_id;

  const InModelPage({Key key, this.title, this.img, this.mark_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        EnableBotomMenu: true,
        body: InModelView(
          title: title,
          img: img,
          mark_id: mark_id,
        ));
  }
}

class InModelView extends StatelessWidget {
  final String title;
  final Widget img;
  final int mark_id;

  const InModelView({Key key, this.title, this.img, this.mark_id})
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
                itemCount: eventProvider
                    .sortWithMarks(mark_id,markProvider.sortNum)
                    .length
                ,
                itemBuilder: (context, index) {
                  final int _sort_num = markProvider.sortNum;
                  final obj=eventProvider
                      .sortWithMarks(mark_id,_sort_num)[index];
                  return Container(
                      child: InCategory(
                        obj: obj,
                        isFavorite: provider.isExist(obj),
                      ));
                }),
          ),
        ),
      ],
    );
  }
}
