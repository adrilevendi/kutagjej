import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'njoftim_single_widget.dart' show NjoftimSingleWidget;
import 'package:flutter/material.dart';

class NjoftimSingleModel extends FlutterFlowModel<NjoftimSingleWidget> {
  ///  State fields for stateful widgets in this page.
// Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? existingChat;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? createdChat;
  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
