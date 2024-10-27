import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detailed_profile_widget.dart' show DetailedProfileWidget;
import 'package:flutter/material.dart';

class DetailedProfileModel extends FlutterFlowModel<DetailedProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? existingChat;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? createdChat;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MediaRecord? uploadedMedia;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
