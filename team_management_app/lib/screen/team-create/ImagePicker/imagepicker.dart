import 'dart:io';

import 'package:flutter/material.dart';
import 'package:team_management_app/function/imagepicker.dart';
import 'package:team_management_app/screen/colors.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "대표 이미지 (선택)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () async {
                File? selectedImage = await pickImageFromGallery();
                setState(() {
                  _image = selectedImage;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(ButtonColors.gray4color), width: 2),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: const Icon(Icons.add_a_photo),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            if (_image != null)
              Image.file(
                _image!,
                width: 100,
                height: 150,
              )
          ],
        ),
      ],
    );
  }
}
