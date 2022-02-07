import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  bool _isScaffoldBlack = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isScaffoldBlack ? Colors.black : Colors.white,
      appBar: AppBar(
          leading:
              BackButton(color: _isScaffoldBlack ? Colors.white : Colors.black),
          backgroundColor: _isScaffoldBlack ? Colors.black : Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false),
      body: GestureDetector(
        onTap: () => _toggleScaffoldColor(),
        child: SizedBox.expand(
          child: Center(
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(widget.imageUrl),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleScaffoldColor() {
    setState(() {
      _isScaffoldBlack = !_isScaffoldBlack;
    });
  }
}
