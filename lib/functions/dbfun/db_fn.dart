import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DbFunctions {
  final firestore = FirebaseFirestore.instance.collection('brand_list');
  final productFireStore =
      FirebaseFirestore.instance.collection('product_list');
  final referenceRoot = FirebaseStorage.instance.ref();
  String imageUrl = '';
  String imageUrl2 = '';
  final String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();
  // addData(nameController) async {
  //   final brandName = nameController.text.trim();
  //   Map<String, String> dataToadd = {'name': brandName, 'image': imageUrl};
  //   await firestore.add(dataToadd);
  // }

  // fetchdata() async {
  //   final response = await firestore;
  // }

  addBrandDataToDb(file, nameController) async {
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
      final brandName = nameController;
      Map<String, String> dataToadd = {'name': brandName, 'image': imageUrl};
      await firestore.add(dataToadd);
    } catch (e) {
      log(e.toString());
    }
  }

  addProductDataToDb(file, nameController, amountController, sizeList,
      brandnameList, descriptionController) async {
    if (file == null) return;
    //get a reference to storage root
    final referenceDirimages = referenceRoot.child('image');
    //create a reference for the image to be stored
    final referenceImageTobeUpload = referenceDirimages.child(uniqueName);

    try {
      //store the file
      await referenceImageTobeUpload.putFile(file);
      //success : get the downloaded url
      imageUrl2 = await referenceImageTobeUpload.getDownloadURL();
      final productName = nameController;
      final amount = amountController;

      final sizelist = sizeList;
      final brandlist = brandnameList;
      final description = descriptionController;
      Map<String, dynamic> dataToadd = {
        'name': productName,
        'amount': amount,
        'size': sizelist,
        'brandlist': brandlist,
        'description': description,
        'image': imageUrl2,
      };
      await productFireStore.add(dataToadd);
    } catch (e) {
      log(e.toString());
    }
  }
}
