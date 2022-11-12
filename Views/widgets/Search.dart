import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/Routes.dart';
import '/Models/Public.dart';
import 'imgBtn.dart';

class SearchBtn extends StatelessWidget {
  //const SearchBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, PageName.pageSearch);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: SWi*0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImgBtn(
                width: SWi*0.8,
                height: SWi*0.12,
                shape: SWi*0.02,
                boxShadow: [
                  BoxShadow(blurRadius: 3,spreadRadius: 2,color: Colors.grey[200],offset: Offset(0,5))
                ],
                color: Colors.white,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  SWi*0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gözle... ",style: TextStyle(fontSize: SWi*0.045,color: Colors.grey),),
                      Icon(Icons.search,size: SWi*0.1,color: Colors.grey,)
                    ],),
                ),),
            ),
            GestureDetector(onTap: (){
              Navigator.pushNamed(context, PageName.pageSearch);
            }, child: Icon(Icons.wrap_text,size: SWi*0.08,))
          ],
        ),
      ),
    );
  }
}
