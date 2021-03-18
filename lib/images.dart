import 'package:flutter/material.dart';
class Images extends StatefulWidget {
  Images({this.image});
  final String image;
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Container(
         height: 50,
        width: 50,
        child: Image.asset(widget.image),
      ),
        Text("Image Saved"
            )
      ],
    );
  }
}
