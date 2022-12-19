import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/ChatElement.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/ViewModels/ChatProvider.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/Views/widgets/ReadyInput/RIBase.dart';
import 'package:telfun/Views/widgets/ReadyInput/ReadyInput.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import '/Models/Public.dart';
import '/Views/widgets/ScaffoldParts/ScaffoldAll.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SMSProvider>(context, listen: false).reload();
    });
  }

  void addSMS(var _sms) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SMSProvider>(context, listen: false).addMessage(_sms);
    });
  }

  void goBottom() async {
    await SchedulerBinding.instance?.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    final smsProvider = Provider.of<SMSProvider>(context);
    return ScaffoldAll(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: SWi * 0.06),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              itemCount: smsProvider.megades.length,
              itemBuilder: (context, index) {
                final _elem = smsProvider.megades[index];
                return smsTextBox(
                  _elem.isSend,
                  "${_elem.message}",
                  _elem.date,
                );
              },
            ),
          ),
          Divider(color: Colors.purple, height: 10),
          buildInput(),
        ],
      ),
    ));
  }

  Widget smsTextBox(bool isSended, String smsText, DateTime date) {
    final now = DateTime.now();
    final _today = DateTime(now.year, now.month, now.day);
    final _date = DateTime(date.year, date.month, date.day);
    return Container(
      padding: EdgeInsets.symmetric(vertical: SWi * 0.02),
      alignment: isSended ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        // color: Colors.red,
        width: SWi * 0.68,
        alignment: isSended ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Visibility(
                    visible: !isSended,
                    child: ImgBtn(
                      colors: [Color(0xff6E0EFD), Color(0xffDE7A90)],
                      shape: SWi * 0.08,
                      width: SWi * 0.08,
                      height: SWi * 0.08,
                      child: Text(
                        "TF",
                        style: TextStyle(
                            color: Colors.white, fontSize: SWi * 0.05),
                      ),
                    )),
                Container(
                  // color: Colors.blue,
                  width: SWi * 0.6,
                  alignment:
                      isSended ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: SWi * 0.01),
                    decoration: BoxDecoration(
                      color: isSended ? Colors.purple[100] : Color(0xff3C3F41),
                      borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(SWi * 0.04)),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: SWi * 0.04, vertical: SWi * 0.02),
                    child: Column(
                      crossAxisAlignment: isSended
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            _date == _today
                                ? "${date.hour}:${date.minute}"
                                : "${date.day}.${date.month}.${date.year}ý - ${date.hour}:${date.minute}",
                            style: TextStyle(
                                color:
                                    isSended ? Colors.grey[600] : Colors.grey),
                          ),
                        ),
                        Container(
                          child: Text(
                            '''$smsText''',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: SWi * 0.04,
                                color: isSended ? Colors.black : Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // ),
      ),
    );
  }

  Row buildInput() {
    return Row(
      children: [
        Container(
          width: SWi * 0.73,
          child: ReadyInput(
            shape: true,
            //index: 7,
            tag: RITags.rIChat,
            borderRad: SWi * 0.04,
            hidden: "Habar ýaz...",
            label: "Habarlaş",
            //onControl: (val, index) {},
          ),
        ),
        Container(
          //color: Colors.red,
          padding: EdgeInsets.all(SWi * 0.03),
          child: ImgBtn(
            width: null,
            height: null,
            color: Colors.transparent,
            onTap: () async{
                addSMS(ElemChat(
                  isSend: true,
                  id: 1,
                  date: DateTime.now(),
                  message: "${RIBase.getText(RITags.rIChat)/*controls[7].text*/}"));
                API_Post(URL: "$IP/api/sendmsg").sendSMS(RIBase.getText(RITags.rIChat));
                RIBase.eraseDate(RITags.rIChat);
             Future.delayed(Duration(milliseconds: 50)).then((value) => goBottom());
            },
            child: Icon(
              Icons.send,
              color: Color(0xff9E2CFE),
              size: SWi * 0.065,
            ),
          ),
        ),
      ],
    );
  }
}
