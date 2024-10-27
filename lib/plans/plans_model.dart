import '/flutter_flow/flutter_flow_util.dart';
import 'plans_widget.dart' show PlansWidget;
import 'package:flutter/material.dart';

class PlansModel extends FlutterFlowModel<PlansWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  bool? selectedPlan = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
