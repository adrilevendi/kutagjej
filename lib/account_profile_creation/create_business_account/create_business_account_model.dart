import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'create_business_account_widget.dart' show CreateBusinessAccountWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
