import '/flutter_flow/flutter_flow_util.dart';
import 'create_business_account_widget.dart' show CreateBusinessAccountWidget;
import 'package:flutter/material.dart';

class CreateBusinessAccountModel
    extends FlutterFlowModel<CreateBusinessAccountWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmriBiznesit widget.
  FocusNode? emriBiznesitFocusNode;
  TextEditingController? emriBiznesitTextController;
  String? Function(BuildContext, String?)? emriBiznesitTextControllerValidator;
  // State field(s) for emailAddressofBiz widget.
  FocusNode? emailAddressofBizFocusNode;
  TextEditingController? emailAddressofBizTextController;
  String? Function(BuildContext, String?)?
      emailAddressofBizTextControllerValidator;
  // State field(s) for bizPhone widget.
  FocusNode? bizPhoneFocusNode;
  TextEditingController? bizPhoneTextController;
  String? Function(BuildContext, String?)? bizPhoneTextControllerValidator;
  // State field(s) for passwordBiz widget.
  FocusNode? passwordBizFocusNode;
  TextEditingController? passwordBizTextController;
  late bool passwordBizVisibility;
  String? Function(BuildContext, String?)? passwordBizTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordBizVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emriBiznesitFocusNode?.dispose();
    emriBiznesitTextController?.dispose();

    emailAddressofBizFocusNode?.dispose();
    emailAddressofBizTextController?.dispose();

    bizPhoneFocusNode?.dispose();
    bizPhoneTextController?.dispose();

    passwordBizFocusNode?.dispose();
    passwordBizTextController?.dispose();
  }
}
