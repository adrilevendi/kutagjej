import '/flutter_flow/flutter_flow_util.dart';
import 'profile1_widget.dart' show Profile1Widget;
import 'package:flutter/material.dart';

class Profile1Model extends FlutterFlowModel<Profile1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
