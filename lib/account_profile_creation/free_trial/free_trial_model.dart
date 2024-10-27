import '/flutter_flow/flutter_flow_util.dart';
import 'free_trial_widget.dart' show FreeTrialWidget;
import 'package:flutter/material.dart';

class FreeTrialModel extends FlutterFlowModel<FreeTrialWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
