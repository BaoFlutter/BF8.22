import 'package:flutter/material.dart';
class ImageCover extends StatelessWidget {
  final String assetImageUrl;
  const ImageCover({Key? key, required this.assetImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        assetImageUrl,
      height: MediaQuery.of(context).size.height/2.5,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
