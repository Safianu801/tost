import 'package:flutter/material.dart';

import '../../../../utilities/custom_back_navigator.dart';

class EditProfilePhotos extends StatefulWidget {
  const EditProfilePhotos({super.key});

  @override
  State<EditProfilePhotos> createState() => _EditProfilePhotosState();
}

class _EditProfilePhotosState extends State<EditProfilePhotos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: () {
          Navigator.pop(context);
        }),
      ),
    );
  }
}
