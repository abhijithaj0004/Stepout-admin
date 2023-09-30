import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DbFunctions {
  final firestore = FirebaseFirestore.instance.collection('brand_list');
  final referenceRoot = FirebaseStorage.instance.ref();
  String imageUrl = '';
  final String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();
  addData(nameController) async {
    final brandName = nameController.text.trim();
    Map<String, String> dataToadd = {'name': brandName, 'image': imageUrl};
    await firestore.add(dataToadd);
  }

  // fetchdata() async {
  //   final response = await firestore;
  // }

  addDataToDb(file, nameController) async {
    if (file == null) return;
    //get a reference to storage root
    final referenceDirimages = referenceRoot.child('image');
    //create a reference for the image to be stored
    final referenceImageTobeUpload = referenceDirimages.child(uniqueName);

    try {
      //store the file
      await referenceImageTobeUpload.putFile(file);
      //success : get the downloaded url
      imageUrl = await referenceImageTobeUpload.getDownloadURL();
      final brandName = nameController.text.trim();
      Map<String, String> dataToadd = {'name': brandName, 'image': imageUrl};
      await firestore.add(dataToadd);
    } catch (e) {
      log(e.toString());
    }
  }
}
