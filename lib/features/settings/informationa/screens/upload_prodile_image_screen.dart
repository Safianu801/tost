import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utilities/custom_back_navigator.dart';
import '../../../../utilities/custom_button_one.dart';
import 'about_you_screen.dart';

class UploadProfileImageScreen extends StatefulWidget {
  final String userGender;
  final String userAge;
  final List<String> hobbies;
  final String locationRange;
  final String latitude;
  final String longitude;

  const UploadProfileImageScreen({
    super.key,
    required this.userGender,
    required this.userAge,
    required this.hobbies,
    required this.locationRange,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<UploadProfileImageScreen> createState() => _UploadProfileImageScreenState();
}

class _UploadProfileImageScreenState extends State<UploadProfileImageScreen> {
  bool _isLoading = false;
  List<File> _selectedImages = [];

  Future<void> _getImages() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final List<XFile>? images = await _picker.pickMultiImage();
      if (images != null) {
        setState(() {
          _selectedImages = images.map((image) => File(image.path)).toList();
        });
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackNavigator(onPress: () {
          Navigator.pop(context);
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Upload Photos",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            const Center(
              child: Text(
                "Select preferred photos that you want \nothers to see",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: _getImages,
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: _selectedImages.isEmpty ? 3 : 0,
                    color: const Color(0xFFE94057),
                  ),
                  shape: BoxShape.circle,
                  color: const Color(0xFFFFD8E0),
                ),
                child: _selectedImages.isEmpty
                    ? Center(
                  child: Image.asset("assets/images/camera.on.rectangle.fill.png"),
                )
                    : Stack(
                  children: _selectedImages.map((image) {
                    return Positioned(
                      // This will position the images one on top of the other
                      child: ClipOval(
                        child: Image.file(
                          image,
                          fit: BoxFit.cover,
                          width: 300, // Adjust as necessary
                          height: 300, // Adjust as necessary
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _selectedImages.isEmpty
                ? const SizedBox.shrink()
                : CustomButtonOne(
              title: "Add More",
              onPress: _getImages,
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Selected Images",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                _selectedImages.isEmpty
                    ? const SizedBox.shrink()
                    : const Text(
                  "(long press on the image to remove it)",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: _selectedImages.isEmpty ? 0 : 100,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: _selectedImages.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              _selectedImages.removeAt(index);
                            });
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.file(
                              _selectedImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 55),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 8.0),
              child: CustomButtonOne(
                title: "Upload",
                onPress: () {
                  if (_selectedImages.isNotEmpty) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AboutYouScreen(
                        userGender: widget.userGender,
                        userAge: widget.userAge,
                        hobbies: widget.hobbies,
                        locationRange: widget.locationRange,
                        selectedImages: _selectedImages,
                        latitude: widget.latitude,
                        longitude: widget.longitude,
                      ),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Upload at least one image of yourself")),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
