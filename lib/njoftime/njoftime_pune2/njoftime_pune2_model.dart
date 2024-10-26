import '/backend/backend.dart';
import '/components/njoftim_tease_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'njoftime_pune2_widget.dart' show NjoftimePune2Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NjoftimePune2Model extends FlutterFlowModel<NjoftimePune2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for NjoftimTease dynamic component.
   List<DocumentReference> locations = [];
  void addToLocations(DocumentReference item) => locations.add(item);
  void removeFromLocations(DocumentReference item) => locations.remove(item);
  void removeAtIndexFromLocations(int index) => locations.removeAt(index);
  void insertAtIndexInLocations(int index, DocumentReference item) =>
      locations.insert(index, item);
  void updateLocationsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      locations[index] = updateFn(locations[index]);

  ///  State fields for stateful widgets in this page.


  List<PostRecord> simpleSearchResults = [];
  // Models for profFeaturedTease dynamic component.
  late FlutterFlowDynamicModels<NjoftimTeaseModel> njoftimTeaseModels;

  @override
  void initState(BuildContext context) {
    njoftimTeaseModels = FlutterFlowDynamicModels(() => NjoftimTeaseModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    njoftimTeaseModels.dispose();
  }
}
