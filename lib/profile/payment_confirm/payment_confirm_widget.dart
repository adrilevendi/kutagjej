import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_confirm_model.dart';
export 'payment_confirm_model.dart';

class PaymentConfirmWidget extends StatefulWidget {
  const PaymentConfirmWidget({super.key, this.amount});

  final double? amount;
  @override
  State<PaymentConfirmWidget> createState() => _PaymentConfirmWidgetState();
}

class _PaymentConfirmWidgetState extends State<PaymentConfirmWidget> {
  late PaymentConfirmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentConfirmModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: 30.0,
                    borderWidth: 2.0,
                    buttonSize: 44.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 25.0,
                    ),
                    onPressed: () async {
                                              context.pushNamed("Home");

                    },
                  ),
                ],
              ),
            ),
            Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                shape: BoxShape.circle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).secondary,
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Icon(
                  Icons.check_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 60.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'ye6ejsp1' /* Payment Confirmed! */,
                ),
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Noto Sans',
                      color: FlutterFlowTheme.of(context).secondary,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            //   child: Text(
            //     "ALL " + widget.amount.toString(),
            //     style: FlutterFlowTheme.of(context).displayLarge.override(
            //           fontFamily: 'Noto Sans',
            //           letterSpacing: 0.0,
            //         ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'v8gyntzr' /* Your payment has been confirme... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Noto Sans',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 32.0, 0.0),
            //   child: Container(
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: FlutterFlowTheme.of(context).primaryBackground,
            //       borderRadius: BorderRadius.circular(15.0),
            //       border: Border.all(
            //         color: FlutterFlowTheme.of(context).alternate,
            //         width: 2.0,
            //       ),
            //     ),
            //     child: Padding(
            //       padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         children: [
            //           Padding(
            //             padding:
            //                 EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            //             child: Image.asset(
            //               'assets/images/masterCard@2x.png',
            //               width: 40.0,
            //               height: 40.0,
            //               fit: BoxFit.fitWidth,
            //             ),
            //           ),
            //           Padding(
            //             padding:
            //                 EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            //             child: Column(
            //               mainAxisSize: MainAxisSize.max,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Padding(
            //                   padding: EdgeInsetsDirectional.fromSTEB(
            //                       0.0, 0.0, 0.0, 4.0),
            //                   child: Text(
            //                     FFLocalizations.of(context).getText(
            //                       'd7yawxn1' /* Mastercard Ending in 4021 */,
            //                     ),
            //                     style: FlutterFlowTheme.of(context)
            //                         .bodyLarge
            //                         .override(
            //                           fontFamily: 'Noto Sans',
            //                           letterSpacing: 0.0,
            //                         ),
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: EdgeInsetsDirectional.fromSTEB(
            //                       0.0, 0.0, 0.0, 4.0),
            //                   child: Text(
            //                     FFLocalizations.of(context).getText(
            //                       'lwp51gkp' /* $425.24 */,
            //                     ),
            //                     style: FlutterFlowTheme.of(context)
            //                         .labelMedium
            //                         .override(
            //                           fontFamily: 'Noto Sans',
            //                           letterSpacing: 0.0,
            //                         ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                        context.pushNamed("Home");
                      },
                      text: 'Shko ne fillim',
                      options: FFButtonOptions(
                        width: 230.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyLarge
                            .override(
                              fontFamily: 'Noto Sans',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
