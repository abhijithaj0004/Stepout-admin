import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepoutadminapp/buisnesslogic/productdropdowncubit/product_list_cubit.dart';
import 'package:stepoutadminapp/constants/constant.dart';
import 'package:stepoutadminapp/constants/constantswdget/constant_container.dart';
import 'package:stepoutadminapp/constants/constantswdget/constants_button.dart';
import 'package:stepoutadminapp/functions/dbfun/db_fn.dart';

class AddProductsPage extends StatelessWidget {
  AddProductsPage({super.key});

  final List<String> selecteditems = [];

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final amountController = TextEditingController();

  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Add Products',
          style: GoogleFonts.itim(
              textStyle: TextStyle(color: Colors.black, fontSize: 25)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: BlocBuilder<ProductListCubit, ProductListState>(
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<ProductListCubit>().getImageFromGallery();
                      },
                      child: MainContainer(
                        width: double.infinity,
                        height: size * 0.5,
                        child: state.selectedImg != null
                            ? Image.file(
                                File(state.selectedImg!.path),
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Icon(
                                Icons.add_a_photo,
                                size: size * 0.15,
                              )),
                      ),
                    ),
                    kheight30,
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ProductName Required';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter ProductName',
                        hintStyle: GoogleFonts.itim(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 152, 151, 151),
                                fontSize: 25)),
                      ),
                    ),
                    kheight20,
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Amount Required';
                        }
                        return null;
                      },
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter Amount',
                        hintStyle: GoogleFonts.itim(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 152, 151, 151),
                                fontSize: 25)),
                      ),
                    ),
                    kheight20,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: StreamBuilder<Object>(
                            stream: FirebaseFirestore.instance
                                .collection('brand_list')
                                .snapshots(),
                            builder: (context, AsyncSnapshot snapshot) {
                              List<DropdownMenuItem<String>> items = [];
                              if (snapshot.hasError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('No Brand added')));
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: const CircularProgressIndicator(),
                                );
                              } else {
                                QuerySnapshot querySnapshot = snapshot.data;
                                List<QueryDocumentSnapshot> document =
                                    querySnapshot.docs.reversed.toList();
                                for (var branditems in document) {
                                  items.add(DropdownMenuItem(
                                      value: branditems.id,
                                      child: Text(branditems['name'])));
                                }
                              }
                              return DropdownButton<String>(
                                hint: Text(
                                  'Select Brand',
                                  style: GoogleFonts.itim(
                                      textStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 152, 151, 151),
                                          fontSize: 25)),
                                ),
                                isExpanded: true,
                                iconSize: 30,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Color.fromARGB(255, 134, 133, 133),
                                ),
                                value: state.value,
                                onChanged: (value) {
                                  context
                                      .read<ProductListCubit>()
                                      .dropDownSelect(value);
                                },
                                items: items,
                              );
                            }),
                      ),
                    ),
                    kheight20,
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<ProductListCubit>()
                              .showMultiselect(context);
                        },
                        child: const Text('Select Sizes')),
                    Wrap(
                      children: state.selecteditems
                          .map((e) => Chip(label: Text(e)))
                          .toList(),
                    ),
                    kheight20,
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description Required';
                        }
                        return null;
                      },
                      controller: descriptionController,
                      maxLines: 7,
                      maxLength: 300,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Description',
                        hintStyle: GoogleFonts.itim(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 152, 151, 151),
                                fontSize: 25)),
                      ),
                    ),
                    kheight30,
                    KButton(
                        onClick: () {
                          if (formKey.currentState!.validate()) {
                            DbFunctions().addProductDataToDb(
                                File(state.selectedImg!.path),
                                nameController.text.trim(),
                                amountController.text.trim(),
                                state.selecteditems.toList(),
                                state.value,
                                descriptionController.text.trim());
                            state.selectedImg = null;
                            Navigator.pop(context);
                          }
                        },
                        label: Center(
                            child: Text(
                          'Add Product',
                          style: GoogleFonts.itim(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 25)),
                        )))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
