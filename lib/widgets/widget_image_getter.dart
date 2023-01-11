import 'dart:io';
import 'package:flutter/material.dart';

class ImageGetterWidget extends StatefulWidget {
  const ImageGetterWidget({super.key});

  @override
  State<ImageGetterWidget> createState() => _ImageGetterWidgetState();
}

class _ImageGetterWidgetState extends State<ImageGetterWidget> {
  // File _storedImage ;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          // child: _storedImage
          //     ? Image.file(
          //         _storedImage,
          //         fit: BoxFit.cover,
          //         width: double.infinity,
          //       )
          //     : const Text('No Image Taken'),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.image_sharp,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
