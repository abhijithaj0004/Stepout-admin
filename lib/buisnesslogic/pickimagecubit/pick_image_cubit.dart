
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit() : super(PickImageInitial(null));
  Future<void> getImageFromGallery() async {
    final returedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returedImg == null) {
      return;
    }
    state.selectedImg = returedImg;
    emit(PickImageState(state.selectedImg));
  }
}
