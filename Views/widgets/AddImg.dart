import 'dart:io';
import 'package:flutter/material.dart';
import '/Models/Public.dart';
import 'package:image_picker/image_picker.dart';


File image, image1;
bool imageOk=false;

class AddImages extends StatefulWidget {
  @override
  _AddImagesState createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  _AddImagesState();

  final picker = ImagePicker();

  Future getImage(int index) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        if (index == 0) {
          imageOk=true;
          image = File(pickedFile.path);
        }
        else
          image1 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image=null;image1=null;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            getImage(0);
          },
          child: _buildImage(image),
        ),
        GestureDetector(
          onTap: () {
            getImage(1);
          },
          child: _buildImage(image1),
        ),
        /*  Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.blue,
                    blurRadius: 1,
                    spreadRadius: 0)
              ]),
          width: SWi * 0.45,
          height: SWi * 0.45,
          child: Text(
            "Surat sayla!",
            style: TextStyle(color: Colors.grey),
          ),
        ),*/
      ],
    );
  }

  Widget _buildImage(File _image) {
    String imageStr = "Surat saýlaň!";
    if (_image == null) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.blue, blurRadius: 1, spreadRadius: 0)
            ]),
        width: SWi * 0.45,
        height: SWi * 0.45,
        child: Text(
          "$imageStr",
          style: TextStyle(color: Colors.grey),
        ),
      );
    } else {
      return Container(
          width: SWi * 0.45,
          height: SWi * 0.45,
          child: Image.file(File(_image.path))); //Text(_image!.path);
    }
  }
}
