part of 'product_list_cubit.dart';

class ProductListState {
  String? value;
  XFile? selectedImg;
  List<String> selecteditems;
  ProductListState(this.value, this.selectedImg, this.selecteditems);
}

class ProductListInitial extends ProductListState {
  ProductListInitial(super.value, super.selectedImg, super.selecteditems);
}
