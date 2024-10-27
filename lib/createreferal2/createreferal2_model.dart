import '/flutter_flow/flutter_flow_util.dart';
import 'createreferal2_widget.dart' show Createreferal2Widget;
import 'package:flutter/material.dart';

class Createreferal2Model extends FlutterFlowModel<Createreferal2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
