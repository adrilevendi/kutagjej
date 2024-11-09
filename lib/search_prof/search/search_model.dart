import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_page/prof_featured_tease/prof_featured_tease_widget.dart';
import '/components/prof_page_small_widget.dart';
import 'search_widget.dart' show SearchProfessionalScreen;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchProfessionalScreen> {
  ///  Local state fields for this page.

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

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Models for profFeaturedTease dynamic component.
  late FlutterFlowDynamicModels<ProfFeaturedTeaseModel> profFeaturedTeaseModels;
  // Models for ProfPageSmall dynamic component.
  late FlutterFlowDynamicModels<ProfPageSmallModel> profPageSmallModels;

  @override
  void initState(BuildContext context) {
    profFeaturedTeaseModels =
        FlutterFlowDynamicModels(() => ProfFeaturedTeaseModel());
    profPageSmallModels = FlutterFlowDynamicModels(() => ProfPageSmallModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    profFeaturedTeaseModels.dispose();
    profPageSmallModels.dispose();
  }
}
