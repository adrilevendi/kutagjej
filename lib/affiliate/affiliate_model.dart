import '/flutter_flow/flutter_flow_util.dart';
import 'affiliate_widget.dart' show AffiliateWidget;
import 'package:flutter/material.dart';

class AffiliateModel extends FlutterFlowModel<AffiliateWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
