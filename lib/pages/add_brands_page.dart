import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepoutadminapp/buisnesslogic/pickimagecubit/pick_image_cubit.dart';
import 'package:stepoutadminapp/constants/constant.dart';
import 'package:stepoutadminapp/constants/constantswdget/constant_container.dart';
import 'package:stepoutadminapp/constants/constantswdget/constants_button.dart';
import 'package:stepoutadminapp/functions/dbfun/db_fn.dart';

final db = DbFunctions();

class AddBrandPage extends StatelessWidget {
  AddBrandPage({super.key});

  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Add Brand',
            style: GoogleFonts.itim(
                textStyle: TextStyle(color: Colors.black, fontSize: 25)),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: BlocBuilder<PickImageCubit, PickImageState>(
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<PickImageCubit>().getImageFromGallery();
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
                          return 'BrandName is required';
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
                        hintText: 'Enter Brand Name',
                        hintStyle: GoogleFonts.itim(
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 152, 151, 151),
                                fontSize: 25)),
                      ),
                    ),
                    kheight30,
                    KButton(
                        onClick: () {
                          if (state.selectedImg != null) {
                            if (formKey.currentState!.validate()) {
                              // db.addData(nameController);
                              db.addDataToDb(File(state.selectedImg!.path),
                                  nameController);
                              state.selectedImg = null;
                              Navigator.pop(context);
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please add an Image')));
                          }
                        },
                        label: Center(
                            child: Text('Add Brand',
                                style: GoogleFonts.itim(
                                  textStyle: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ))))
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
