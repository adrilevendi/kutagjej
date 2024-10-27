import '/flutter_flow/flutter_flow_util.dart';
import 'incoming_call_widget.dart' show IncomingCallWidget;
import 'package:flutter/material.dart';

class IncomingCallModel extends FlutterFlowModel<IncomingCallWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
