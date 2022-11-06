import 'dart:io';
import 'package:flutter/material.dart';
import '/Models/Public.dart';
import 'package:image_picker/image_picker.dart';

File image, image1;
List<File> images = [];
bool imageOk = false;

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
        imageOk = true;
        if (index + 1 > images.length) {
          images.add(File(pickedFile.path));
        } else {
          images[index] = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = null;
    images = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Wrap(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          runSpacing: SWi * 0.05,
          spacing: SWi * 0.05,
          children: List.generate(
            images.length + 1,
            (index) => GestureDetector(
              onTap: () {
                getImage(index);
              },
              child: _buildImage(
                  index > images.length - 1 ? image : images[index]),
            ),
          ) /* [

       */ /*   GestureDetector(
            onTap: () {
              getImage(1);
            },
            child: _buildImage(image1),
          ),*/ /*
        ],*/
          ),
    );
  }

  Widget _buildImage(_image) {
    String imageStr = "Surat Goş!";
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Colors.blue, size: SWi * 0.1),
            Text(
              "$imageStr",
              style: TextStyle(color: Colors.grey),
            ),
          ],
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
