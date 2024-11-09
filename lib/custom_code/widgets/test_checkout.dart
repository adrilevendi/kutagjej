// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
//
//  main.dart
//  com.twocheckout.twocheckout_flutter_example
//
//  Copyright © 2023 DevCrew I/O
//
import 'dart:developer';

import 'dart:async';
import 'package:twocheckout_flutter/model/payment_form_result.dart';
import 'package:twocheckout_flutter/model/payment_method_type.dart';
import 'package:twocheckout_flutter/model/token_result.dart';
import 'package:twocheckout_flutter/twocheckout_flutter.dart';
// import 'package:twocheckout_flutter_example/payment_flow_done.dart';

class TestCheckout extends StatefulWidget {
  const TestCheckout(
      {super.key,
      this.width,
      this.height,
      required this.post,
      required this.amount});

  final double? width;
  final double? height;
  final Map post;
  final double? amount;
  @override
  State<TestCheckout> createState() => _TestCheckoutState();
}

class _TestCheckoutState extends State<TestCheckout>
     {
  late final _twoCheckoutFlutterPlugin;
  late final _paymentComplete;

  @override
  void initState() {
    super.initState();

    _paymentComplete = false;

 

    /// Set 2Checkout credentials
    _twoCheckoutFlutterPlugin.setTwoCheckoutCredentials(
        secretKey: "t)[5w(c?RG=&O^4vk8~y", merchantCode: "255244469173");
  }

  void showPaymentMethods() {
    /// Show payment methods using the TwoCheckoutFlutter plugin
    _twoCheckoutFlutterPlugin.showPaymentMethods(
        price: widget.amount, currency: "ALL");
  }

  createCardTokenWithoutUI() async {
    /// Method to get card token without ui.
    showProgressBar();
    TokenResult result = await _twoCheckoutFlutterPlugin.createToken(
        name: "Najam",
        creditNumber: "4111111111111111",
        cvv: "123",
        expiryDate: "12/25");

    dismissProgressBar();
    showMyDialog(
        result.token == null ? "Error" : "Success",
        result.token == null
            ? result.error ?? ""
            : "Generated Token: ${result.token ?? ""}");
  }

  /// Dialog for showing Alert messages sent from the Native side
  Future<void> showMyDialog(String title, String detail) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(detail),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// Progress Bar for waiting for a response

  progressDialogue(BuildContext context) {
    AlertDialog alert = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(),
      ),
    );
    showDialog(
      //prevent outside touch
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        //prevent Back button press
        return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }

  void showProgressBar() {
    progressDialogue(context);
  }

  dismissProgressBar() {
    log('Dismiss Progress bar in Flutter');
    Navigator.of(context, rootNavigator: true).pop();
  }

  gotoThankYou() {
    log('going to success payment');
    context.pushNamed('paymentConfirm');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            title: const Align(
              alignment: AlignmentDirectional(0.2, 0.0),
              child: Text('Zgjidhni menyren e pageses'),
            )),
        body: Center(
          child: Container(
            width: 420,
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
            ),
            child: Column(
              children: [
                // Image.asset("assets/images/shirt.jpg"),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 30.0, 0.0, 30.0),
                  child: Text(
                    widget.post['title'],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),

                Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 10.0, 20.0, 30.0),
                    child: Column(
                      children: [
                        //   Text(widget.post.minPay.toString() + " Euro",
                        //  style: const TextStyle(
                        //   fontSize: 14,
                        //  ),
                        //   ),
                        Text(
                          widget.post['description'],
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )),

                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'ALL  ${widget.amount.toString()}',
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 30.0, 0.0, 30.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      showPaymentMethods();
                    },
                    text: FFLocalizations.of(context).getText(
                      'b8pbibzh' /* Button */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Noto Sans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                // ElevatedButton(

                //     onPressed: () {
                //       createCardTokenWithoutUI();
                //     },
                //     child: const Text("Create Card Token"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onPaymentFormComplete(PaymentFormResult paymentFormResult) {
    /// Call 2Checkout create/post order api and fetch response.
    /// Check either need to authorized payment then call the bellow method 'authorizePaymentWithOrderResponse' in the following key contain in order create api response
    /// Credit Card: response -> PaymentDetails -> PaymentMethod -> Authorize3DS exist
    /// Paypal: response -> PaymentDetails -> PaymentMethod -> RedirectURL exist
    ///
    /// @param url The Redirect URL for payment authorization. --> Credit Card: Authorize3DS.getString("Href"),  Paypal: PaymentMethod.getString("RedirectURL")
    /// @param parameters --> Credit Card: ['avng8apitoken' : 'Authorize3DS -> Params -> avng8apitoken'],  Paypal: [:] none optional
    /// @param successReturnUrl The URL to redirect to on successful payment (default is an empty string).
    /// @param cancelReturnUrl The URL to redirect to if the payment is canceled (default is an empty string).
    ///
    // _twoCheckoutFlutterPlugin.authorizePaymentWithOrderResponse(
    //     "https://www.google.com", {});
    // context.pushNamed('paymentConfirm',
    //                 queryParameters: {
    //                   'amount': 1950.00
    //                 }

    //                 );
    print(paymentFormResult.token);
    gotoThankYou();
    final snackBar = SnackBar(
      content: const Text('Payment form submitted!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // PostRecord.collection.doc(widget.post.reference.id).update({
    //   'paid': true,
    // });
  }

  @override
  void authorizePaymentDidCancel() {
    print("Payment is cancelled");
    showMyDialog("Alert", "Payment process is cancelled by user");
  }

  @override
  void authorizePaymentDidCompleteAuthorizing(Map<dynamic, dynamic> result) {
    /// Use 2Checkout order status api to check the payment status before navigate to next screen.
    print("Dart: authorizePaymentDidCompleteAuthorizing $result");
    final snackBar = SnackBar(
      content: const Text('Checking payment status!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

    }