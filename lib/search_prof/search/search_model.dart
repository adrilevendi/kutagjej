import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_page/prof_featured_tease/prof_featured_tease_widget.dart';
import '/components/prof_page_small_widget.dart';
import '/search_prof/filter_sidebar/filter_sidebar_widget.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
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
