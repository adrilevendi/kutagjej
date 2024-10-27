import '/flutter_flow/flutter_flow_util.dart';
import 'favourite_profs_widget.dart' show FavouriteProfsWidget;
import 'package:flutter/material.dart';

class FavouriteProfsModel extends FlutterFlowModel<FavouriteProfsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
