import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';

import 'prof_featured_tease_model.dart';
export 'prof_featured_tease_model.dart';

class ProfFeaturedTeaseWidget extends StatefulWidget {
  const ProfFeaturedTeaseWidget({
    super.key,
    required this.prof,
    bool? isFavorite,
  }) : isFavorite = isFavorite ?? true;

  final UsersRecord? prof;
  final bool isFavorite;

  @override
  State<ProfFeaturedTeaseWidget> createState() =>
      _ProfFeaturedTeaseWidgetState();
}

class _ProfFeaturedTeaseWidgetState extends State<ProfFeaturedTeaseWidget>
    with TickerProviderStateMixin {
  late ProfFeaturedTeaseModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfFeaturedTeaseModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.03, 1.03),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'DetailedProfile',
          queryParameters: {
            'userRef': serializeParam(
              widget.prof?.reference,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        // width: 353.0,
        height: 227.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x52F6BD00),
              offset: Offset(
                0.0,
                0.0,
              ),
              spreadRadius: 3.0,
            )
          ],
          borderRadius: BorderRadius.circular(17.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).warning,
            width: 3.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              widget.prof?.photoUrl,
                              'https://telegrafi.com/wp-content/uploads/2019/08/shutterstock_579725212_1000x0-780x439.jpg',
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.91,
                            height: 118.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Container(
                                  width: 60.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(27.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                        size: 21.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 3.0, 0.0),
                                        child:
                                            StreamBuilder<List<ReviewRecord>>(
                                          stream: queryReviewRecord(
                                            queryBuilder: (reviewRecord) =>
                                                reviewRecord.where(
                                              'reviewedRef',
                                              isEqualTo: widget.prof?.reference,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ReviewRecord>
                                                textReviewRecordList =
                                                snapshot.data!;
                                            return Text(
                                              formatNumber(
                                                functions.getAvgRating(
                                                    textReviewRecordList
                                                        .toList()),
                                                formatType: FormatType.custom,
                                                format: '###.##',
                                                locale: '',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    230.0, 10.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (!loggedIn) {
                                              context.pushNamed('Login1');
                                            } else {
                                              if (functions.isFavoriteProf(
                                                      widget.prof?.reference,
                                                      (currentUserDocument
                                                                  ?.favorites
                                                                  .toList() ??
                                                              [])
                                                          .toList()) ==
                                                  true) {
                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'favorites': FieldValue
                                                          .arrayRemove([
                                                        widget.prof?.reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                await currentUserReference!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'favorites': FieldValue
                                                          .arrayUnion([
                                                        widget.prof?.reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: 35.0,
                                            height: 35.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            child: ToggleIcon(
                                              onPressed: () async {
                                                if (!loggedIn) {
                                                  context.pushNamed('Login1');
                                                } else {
                                                  if (functions.isFavoriteProf(
                                                          widget
                                                              .prof?.reference,
                                                          (currentUserDocument
                                                                      ?.favorites
                                                                      .toList() ??
                                                                  [])
                                                              .toList()) ==
                                                      true) {
                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'favorites':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            widget
                                                                .prof?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  } else {
                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'favorites':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            widget
                                                                .prof?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  }
                                                }
                                              },
                                              value: functions.isFavoriteProf(
                                                  widget.prof?.reference,
                                                  (currentUserDocument
                                                              ?.favorites
                                                              .toList() ??
                                                          [])
                                                      .toList())!,
                                              onIcon: Icon(
                                                Icons.bookmark_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 20.0,
                                              ),
                                              offIcon: Icon(
                                                Icons.bookmark_border,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(widget.prof!.category, ''),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Noto Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        5.0, 0.0, 0.0, 0.0),
                    child: Icon(
                      Icons.verified_user,
                      color: FlutterFlowTheme.of(context).warning,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(20.0, 3.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 2.0, 0.0, 0.0),
                    child: Icon(
                      Icons.location_pin,
                      color: FlutterFlowTheme.of(context).warning,
                      size: 15.0,
                    ),
                  ),
                  Text(
                    widget.prof!.displayName,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Noto Sans',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: 310.0,
                      height: 35.0,
                      decoration: const BoxDecoration(),
                      child: Text(
                        valueOrDefault<String>(
                          widget.prof?.shortDescription,
                          'HELLO HELLO HELLO HELLO HELLO HELLO ',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Noto Sans',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
    );
  }
}
