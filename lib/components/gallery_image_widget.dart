import 'package:cached_network_image/cached_network_image.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'gallery_image_model.dart';
export 'gallery_image_model.dart';

class GalleryImageWidget extends StatefulWidget {
  const GalleryImageWidget({super.key});

  @override
  State<GalleryImageWidget> createState() => _GalleryImageWidgetState();
}

class _GalleryImageWidgetState extends State<GalleryImageWidget> {
  late GalleryImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GalleryImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: 'https://picsum.photos/seed/480/600',
        width: 300.0,
        height: 200.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
