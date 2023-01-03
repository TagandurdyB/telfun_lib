import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import 'package:telfun/Views/widgets/ReadyInput/ReadyInput.dart';
import '/Models/Public.dart';
import 'imgBtn.dart';

class SearchBtn extends StatelessWidget {
  final bool isFilter;
  final String tag;
  SearchBtn({this.isFilter=false, this.tag});
  //const SearchBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, PageName.pageSearch);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: SWi * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImgBtn(
                width: SWi * 0.8,
                height: SWi * 0.12,
                shape: SWi * 0.02,
                boxShadow: ThemeProvided().shadowSearch,
                color: ThemeProvided().colorCanvas,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SWi * 0.05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text("Gözle... ",style: TextStyle(fontSize: SWi*0.045,color: Colors.grey),),
                      Expanded(
                        child: ReadyInput(
                          onChange: (String _value, String _tag) {
                            //print(_value);
                            Provider.of<UsesVar>(context, listen: false)
                                .changeSearch(_value);
                          },
                          reightWidget: SizedBox(),
                          tag: tag,
                          // hidden: "Gözle...",
                          label: "Gözle...",
                        ),
                      ),
                      Icon(
                        Icons.search,
                        size: SWi * 0.1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isFilter,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageName.pageFilter);
                  },
                  child: Icon(
                    Icons.wrap_text,
                    color: ThemeProvided().colorText,
                    size: SWi * 0.08,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
