import '/flutter_flow/flutter_flow_util.dart';
import 'real_estate_widget.dart' show RealEstateWidget;
import 'package:flutter/material.dart';

class RealEstateModel extends FlutterFlowModel<RealEstateWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
