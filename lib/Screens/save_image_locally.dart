import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/// save image on cache using shared_preferences throw image's path

File? imgFile;
String? imgPath;
class SaveImageLocallyView extends StatefulWidget {
  const SaveImageLocallyView({Key? key}) : super(key: key);

  @override
  State<SaveImageLocallyView> createState() => _SaveImageLocallyViewState();
}

class _SaveImageLocallyViewState extends State<SaveImageLocallyView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          toolbarHeight: 80,
          iconTheme: const IconThemeData(color: Colors.brown),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.grey.shade200,
          title: const Padding(
          padding: EdgeInsets.only(top:0),
          child: Text('Upload Your Profile Picture',
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 27,
          color: Colors.brown
        ),
      ),
    ),
        ),


      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            if( imgPath != null )
              Expanded(
                child: Image.file(File(imgPath!)),
              ),
            TextButton(
                onPressed: ()
                {
                  getImg();
                },
                child: const Text("Get Image",)
            ),
            const SizedBox(height: 5,),
            TextButton(
                onPressed: (){
                  deleteData();
                },
                child: const Text("Delete Image")
            ),
          ],
        ),
      ),
    );
  }


  // get image from gallery
  void getImg() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if( pickedImage != null )
    {
      saveData(pickedImage.path.toString());   // path cache
      setState(()
      {
        imgFile = File(pickedImage.path);
      });
    }
  }

  void saveData(String val) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('path', val);
    getData();
  }

  void getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(()
    {
      imgPath = sharedPref.getString('path');
    });
  }

  void deleteData() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('path');
    getData();
  }
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
