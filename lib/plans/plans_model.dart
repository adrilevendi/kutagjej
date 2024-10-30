import '/flutter_flow/flutter_flow_util.dart';
import 'plans_widget.dart' show PlansWidget;
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_credit_card_form.dart';

class PlansModel extends FlutterFlowModel<PlansWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue1;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue2;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue3;
  bool? selectedPlan = false;
   // State field(s) for CreditCardForm widget.
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
