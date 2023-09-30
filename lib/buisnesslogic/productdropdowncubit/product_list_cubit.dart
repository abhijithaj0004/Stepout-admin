import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepoutadminapp/pages/productpage/product_size_list.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit() : super(ProductListInitial(null, null, []));
  void dropDownSelect(value) {
    state.value = value;
    emit(ProductListState(state.value, state.selectedImg, state.selecteditems));
  }

  Future<void> getImageFromGallery() async {
    final returedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returedImg == null) {
      return;
    }
    state.selectedImg = returedImg;
    emit(ProductListState(state.value, state.selectedImg, state.selecteditems));
  }

  showMultiselect(context) async {
    final List<String> availableSizes = [
      'US 6',
      'US 6.5',
      'US 7',
      'US 7.5',
      'US 8',
      'US 8.5',
      'US 9',
      'US 9.5',
      'US 10',
      'US 10.5',
      'US 11',
      'US 11.5',
      'US 12',
    ];

    final List<String> results = await showDialog(
      context: context,
      builder: (context) {
        return ProductSizeList(
          items: availableSizes,
        );
      },
    );

    state.selecteditems = results;
    emit(ProductListState(state.value, state.selectedImg, state.selecteditems));
  }
}
