// TODO Implement this library.

import 'dart:io';

import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String title;
  final IconData icon;

  Colors? color;

  File? selectedImage;

  VoidCallback onPressed;

  Options({
    required this.onPressed,
    this.color,
    this.selectedImage,
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color: selectedImage == null ? Colors.grey.shade800 : Colors.red,

          onPressed: onPressed,
          icon: Icon(icon),
        ),
        Text(
          title,
          style: TextStyle(
            color: selectedImage == null ? Colors.grey.shade800 : Colors.red,
          ),
        ),
      ],
    );
  }
}
