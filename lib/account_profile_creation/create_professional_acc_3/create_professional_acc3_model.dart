import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_professional_acc3_widget.dart' show CreateProfessionalAcc3Widget;
import 'package:flutter/material.dart';

class CreateProfessionalAcc3Model
    extends FlutterFlowModel<CreateProfessionalAcc3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EMRI widget.
  FocusNode? emriFocusNode;
  TextEditingController? emriTextController;
  String? Function(BuildContext, String?)? emriTextControllerValidator;
  // State field(s) for emailAddressoprof widget.
  FocusNode? emailAddressoprofFocusNode;
  TextEditingController? emailAddressoprofTextController;
  String? Function(BuildContext, String?)?
      emailAddressoprofTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  CategoryRecord? selectedLocation;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode1;
  TextEditingController? emailAddressTextController1;
  String? Function(BuildContext, String?)? emailAddressTextController1Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode2;
  TextEditingController? emailAddressTextController2;
  String? Function(BuildContext, String?)? emailAddressTextController2Validator;

FocusNode? professionFocusNode;
  TextEditingController? professionController;
  String? Function(BuildContext, String?)? professionValidator;
  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emriFocusNode?.dispose();
    emriTextController?.dispose();

    emailAddressoprofFocusNode?.dispose();
    emailAddressoprofTextController?.dispose();

    emailAddressFocusNode1?.dispose();
    emailAddressTextController1?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    emailAddressFocusNode2?.dispose();
    emailAddressTextController2?.dispose();
  }
}
