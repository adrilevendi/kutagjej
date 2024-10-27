// Automatic FlutterFlow imports
import '/backend/backend.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    super.key,
    this.width,
    this.height,
    required this.gallery,
  });

  final double? width;
  final double? height;
  final List<MediaRecord> gallery;

  @override
  State<NewCustomWidget> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: widget.gallery
            .map((item) => Image(image: NetworkImage(item.mediaUrl)))
            .toList()
        // .add(Image(image: NetworkImage('https://cdn-icons-png.freepik.com/512/61/61112.png')))
        );
  }
}
