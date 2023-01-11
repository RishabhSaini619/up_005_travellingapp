// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as system_path;

class ImageGetterWidget extends StatefulWidget {
  const ImageGetterWidget({super.key});

  @override
  State<ImageGetterWidget> createState() => _ImageGetterWidgetState();
}

class _ImageGetterWidgetState extends State<ImageGetterWidget> {
  File? storedImage;
  Future<void> pickImageFromCamera() async {
    final imageFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxHeight: 195, maxWidth: 345);
    setState(() {
      storedImage = File(imageFile!.path);
    });
    final appDirectory = await system_path.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    final savedImage = await imageFile.saveTo('${appDirectory.path}/$fileName');
  }

  Future<void> pickImageFromGallery() async {
    final imageFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 195, maxWidth: 345);
    setState(() {
      storedImage = File(imageFile!.path);
    });
    final appDirectory = await system_path.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    final savedImage = await imageFile.saveTo('${appDirectory.path}/$fileName');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
            height: 200,
            width: 350,
            alignment: Alignment.center,
            duration: const Duration(seconds: 5),
            curve: Curves.elasticOut,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              // color: Colors.amberAccent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  color: Theme.of(context).colorScheme.secondary, width: 1),
            ),
            child: storedImage != null
                ? Container(
                    margin: const EdgeInsets.all(5),
                    child: Image.file(
                      storedImage!,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Text('No Image Taken')),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pick Image',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              IconButton(
                onPressed: pickImageFromCamera,
                icon: Icon(
                  Icons.camera,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              IconButton(
                onPressed: pickImageFromGallery,
                icon: Icon(
                  Icons.image,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
