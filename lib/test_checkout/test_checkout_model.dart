import '/flutter_flow/flutter_flow_util.dart';
import 'test_checkout_widget.dart' show TestCheckoutWidget;
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_credit_card_form.dart';

class TestCheckoutModel extends FlutterFlowModel<TestCheckoutWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
