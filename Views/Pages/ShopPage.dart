import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/Providers/EventProvider.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';
import 'package:telfun/ViewModels/Providers/ShopProvider.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/ViewModels/Providers/UserProvider.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import 'package:telfun/Views/widgets/Search.dart';
import 'package:telfun/Views/widgets/ShopPlitca.dart';
import '/Models/Public.dart';
import '/Views/widgets/Model.dart';
import '/Views/widgets/SortBtn.dart';
import '/ViewModels/ApiDebuging.dart';

class ShopPage extends StatelessWidget {
  //const ModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return API_Get(
        URL: "$IP/api/shops",
        ApiName: ApiTags.shops,
        Return: ShopView());
  }
}

class ShopView extends StatefulWidget {
  const ShopView({
    Key key,
  }) : super(key: key);

  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ShopProvider>(context,listen: false).reLoad();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ShopProvider>(context);
    final String searchText=Provider.of<UsesVar>(context).getSearch;
    final List _list = provider.searchName(searchText);
    return ScaffoldAll(
      isSliver: true,
      appBarBottom: SearchBtn(tag: RITags.rISearchShop),
      topBarHeight: 0.3,
      ////////////////////////////////////////////////
      sliverBody: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ////////////////////////////////////////////////
            Container(
              //color: Colors.red,
                padding: EdgeInsets.symmetric(
                    horizontal: SWi * 0.06, vertical: SWi * 0.05),
                child: Text("Dükanlar",
                    style: TextStyle(
                        fontSize: SWi * 0.05, fontWeight: FontWeight.w800))),
          ],
        ),
      ),
      ////////////////////////////////////////////////
      sliverList: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          final _obj=_list[index];
          return ShopPlitca(
            obj: _obj,
          );
        },
            childCount: _list.length
        ),
      ),
      ////////////////////////////////////////////////
    );
  }
}
