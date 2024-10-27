import '/backend/backend.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_njoftim_widget.dart' show NewNjoftimWidget;

import 'package:flutter/material.dart';

class NewNjoftimModel extends FlutterFlowModel<NewNjoftimWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MediaRecord? uploadedMediaNewNjoftim;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

   FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for DropDown widget.
  CategoryRecord? selectedPosition;
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  LocationsRecord? selectedLocation;
  // State field(s) for DropDown widget.
  int? dropDownValue3;
  FormFieldController<int>? dropDownValueController3;
  // State field(s) for DropDown widget.
  int? dropDownValue4;
  FormFieldController<int>? dropDownValueController4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for DropDown widget.
  num? dropDownValue5;
  FormFieldController<num>? dropDownValueController5;
  // State field(s) for DropDown widget.
  num? dropDownValue6;
  FormFieldController<num>? dropDownValueController6;
  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  PostRecord? newPost;

  double? priceWeekTotal;
  double? priceDayTotal;
  double? priceTotal;

  double? pricePerWeek;
  double? pricePerWeekAdditionalDay;

  Map? durationList(String? text, int length) {
      
      var flist = List.filled(length,'');
      var vlist = List.filled(length, 0);
      for(var i=0; i< length; i++) {
        // print(i);
        vlist[i] = i+1;
        flist[i] = "${(i+1).toString()} $text";
      }
      return {"labels": flist, "values": vlist};

    }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
