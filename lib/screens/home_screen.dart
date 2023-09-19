import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker picker = ImagePicker();
  final ImageCropper cropper = ImageCropper();
  String? resultImage;

  pickImageToCrop() async{

    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image==null){

    }else{

      CropImage(image);
    }
  }
  CropImage(XFile selectedImage) async{
    final  _cropedImage=await cropper.cropImage(sourcePath: selectedImage.path,aspectRatioPresets: [
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio5x3,
      CropAspectRatioPreset.ratio7x5,
      CropAspectRatioPreset.ratio5x4,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio16x9,
    ],
      uiSettings: [
        IOSUiSettings(
          title: 'Cropper',

          showCancelConfirmationDialog: true,
          rotateClockwiseButtonHidden: true,


        ),
      ]

    );
    if(_cropedImage==null){

    }else{
      setState(() {
        resultImage = _cropedImage.path;
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title:const  Text("Image Cropper"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               resultImage==null?Container(
                 height: 200,
                 width: double.infinity,
                 color: Colors.grey.shade400,
               ):Container(
                 height: 200,
                 width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(resultImage!)),fit: BoxFit.cover
                  )
                ),
               ),
             const   SizedBox(height: 20,),
               ElevatedButton(onPressed: ()async{
                 pickImageToCrop();
               }, child:const  Text("Pick Image"))
             ],
          ),
        ),
      ),
    );
  }
}
