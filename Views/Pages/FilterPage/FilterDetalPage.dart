import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';

import '../ProductPage.dart';

class FilterDetalPage extends StatelessWidget {
  final Map body;

   FilterDetalPage({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return API_PostBuilder(
      URL: "$IP/api/filter",
      ApiName: ApiTags.filter,
      Body: body,
      Return: FilterView(),
    );
  }
}

class FilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List _objs=Get_Lists(listTag: ApiTags.filter).getList();
    _objs.forEach((element) {
      print("name:=${element.name}");
    });
    print("Filter length:=${_objs.length}");
    return ProductPage(
      title: "Filter",
      objs: _objs,
    );
  }
}
