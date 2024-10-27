import '/flutter_flow/flutter_flow_util.dart';
import 'call_widget.dart' show CallWidget;
import 'package:flutter/material.dart';

class CallModel extends FlutterFlowModel<CallWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
