import 'package:image_picker/image_picker.dart';

class UtilsHelper {
  Future<List<String>> pickImages() async {
    try {
      final _imagePicker = ImagePicker();
      final List<XFile>? images = await _imagePicker.pickMultiImage();

      if (images != null && images.isNotEmpty) {
        return images.map((image) => image.path).toList();
      } else {
        print('No Images Selected');
        return [];
      }
    } catch (e) {
      print('Error picking images: $e');
      return [];
    }
  }
}
