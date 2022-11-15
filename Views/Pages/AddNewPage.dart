import 'package:flutter/material.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/AddBtn.dart';
import '/Views/widgets/DropDownBtn.dart';
import '/Views/widgets/ReadyInput.dart';
import '/Views/widgets/imgBtn.dart';

class AddNewPage extends StatelessWidget {
  //const AddNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SWi*0.08),
      //color: Colors.blue,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImgBtn(
                    width: SWi * 0.1,
                    height: SWi * 0.1,
                    shape: 10,
                    color: Color(0xff5408BF),
                    child: Icon(Icons.category,color: Colors.white,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdawnChangeOnly(
                        index: 6,
                        itims: List.generate(
                            Get_Lists().getList(Get_Lists.categori).length ?? 0,
                                (index) {
                              var getlist =
                              Get_Lists().getList(Get_Lists.categori)[index];
                              return DropDBid(
                                  value: getlist["tm"], id: getlist["id"]);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImgBtn(
                    width: SWi * 0.1,
                    height: SWi * 0.1,
                    shape: 10,
                    color: Color(0xff5408BF),
                    child: Icon(Icons.bookmark,color: Colors.white,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdawnChangeOnly(
                        index: 5,
                        itims: List.generate(
                            Get_Lists().getList(Get_Lists.mark).length ?? 0,
                                (index) {
                              var getlist =
                              Get_Lists().getList(Get_Lists.mark)[index];
                              return DropDBid(
                                  value: getlist["name"], id: getlist["id"]);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImgBtn(
                    width: SWi * 0.1,
                    height: SWi * 0.1,
                    shape: 10,
                    color: Color(0xff5408BF),
                    child: Icon(Icons.view_in_ar_sharp,color: Colors.white,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdawnChangeOnly(
                        index: 5,
                        itims: List.generate(
                            Get_Lists().getList(Get_Lists.model).length ?? 0,
                                (index) {
                              var getlist =
                              Get_Lists().getList(Get_Lists.model)[index];
                              return DropDBid(
                                  value: getlist["name"], id: getlist["id"]);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImgBtn(
                    width: SWi * 0.1,
                    height: SWi * 0.1,
                    shape: 10,
                    color: Color(0xff5408BF),
                    child: Icon(Icons.palette_outlined,color: Colors.white,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdawnChange(
                        index: 4,
                        itims: [
                          DropDBid(value: "API taýýar däl!", id: 0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImgBtn(
                    width: SWi * 0.1,
                    height: SWi * 0.1,
                    shape: 10,
                    color: Color(0xff5408BF),
                    child: Icon(Icons.location_on_outlined,color: Colors.white,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdawnChange(
                        index: 4,
                        itims: [
                          DropDBid(value: "Aşgabat", id: 0),
                          DropDBid(value: "Ahal", id: 1),
                          DropDBid(value: "Balkan", id: 2),
                          DropDBid(value: "Mary", id: 3),
                          DropDBid(value: "Lebap", id: 4),
                          DropDBid(value: "Daşoguz", id: 5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImgBtn(
                    width: SWi * 0.1,
                    height: SWi * 0.1,
                    shape: 10,
                    color: Color(0xff5408BF),
                    child: Icon(Icons.money_sharp,color: Colors.white,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:MyInput(
                        shape: true,
                        index: 1,
                        type: Type.num,
                       // borderRad: 60,
                        hidden: "Bildirişiň bahasyny ýazyň...",
                        label: "Bahasy",
                        onControl: (val, index) {
                         // inputValues[index] = controls[index].text;
                         // canOpenAddBtn(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImgBtn(
                    width: SWi * 0.1,
                    height: SWi * 0.1,
                    shape: 10,
                    color: Color(0xff5408BF),
                    child: Icon(Icons.app_registration_rounded,color: Colors.white,),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Text("Barada",style: TextStyle(fontSize: 18),),
                    ),
                  ),
                ],
              ),
              MyInput(
                shape: true,
                index: 2,
                maxline: 3,
                borderRad: 30,
                hidden: "Bildirişiňiz barada maglumat ýazyň...",
                label: "Bildiriş barada...",
                onControl: (val, index) {
                  //inputValues[index] = controls[index].text;
                 // canOpenAddBtn(context);
                },
              ),
              AddBtn()
            ],
          ),
        ));
  }
}
