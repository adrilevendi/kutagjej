import '/flutter_flow/flutter_flow_util.dart';
import 'view_media_widget.dart' show ViewMediaWidget;
import 'package:flutter/material.dart';

class ViewMediaModel extends FlutterFlowModel<ViewMediaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
