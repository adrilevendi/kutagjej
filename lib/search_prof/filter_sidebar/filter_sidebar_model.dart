import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_sidebar_widget.dart' show FilterSidebarWidget;
import 'package:flutter/material.dart';

class FilterSidebarModel extends FlutterFlowModel<FilterSidebarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  List<DocumentReference>? dropDownValue1;
  FormFieldController<List<DocumentReference>>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<LocationsRecord>? selectedLocations;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<List<String>>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<LocationsRecord>? selectedLocations2;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue3;
  FormFieldController<List<String>>? dropDownValueController3;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<CategoryRecord>? selectedProfs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
