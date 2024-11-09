import 'package:cached_network_image/cached_network_image.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

import 'prof_page_small_model.dart';
export 'prof_page_small_model.dart';

class ProfPageSmallWidget extends StatefulWidget {
  const ProfPageSmallWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<ProfPageSmallWidget> createState() => _ProfPageSmallWidgetState();
}

class _ProfPageSmallWidgetState extends State<ProfPageSmallWidget> {
  late ProfPageSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfPageSmallModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          // width: 355,

          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(
                  0,
                  2,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(widget.userRef!),
            builder: (context, AsyncSnapshot<UsersRecord> snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final UsersRecord rowUsersRecord = snapshot.data!;
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
                        widget.userRef,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(0),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: valueOrDefault<String>(
                                      rowUsersRecord.photoUrl,
                                      'https://images.unsplash.com/photo-1567784177951-6fa58317e16b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNnx8bWFufGVufDB8fHx8MTcxODA1NTgzM3ww&ixlib=rb-4.0.3&q=80&w=1080',
                                    ),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 5, 0, 0),
                                    child: Container(
                                      width: 40,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius: BorderRadius.circular(27),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 3, 1),
                                            child: StreamBuilder<
                                                List<ReviewRecord>>(
                                              stream: queryReviewRecord(
                                                queryBuilder: (reviewRecord) {
                                                  return reviewRecord.where(
                                                    'reviewedRef',
                                                    isEqualTo: widget.userRef,
                                                  );
                                                },
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 10,
                                                      height: 10,
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
                                                  valueOrDefault<String>(
                                                    (textReviewRecordList
                                                            .isNotEmpty
                                                        ? formatNumber(
                                                            functions.getAvgRating(
                                                                textReviewRecordList
                                                                    .toList()),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '###.#',
                                                            locale: '',
                                                          )
                                                            .toString()
                                                            .padRight(2, '.0')
                                                        : ''),
                                                    '5.0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                      ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(15),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                rowUsersRecord.category,
                                                'E pergjithshme ',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        fontSize: 14,
                                                        letterSpacing: 0,
                                                      ),
                                            ),

                                            // },
                                            if (rowUsersRecord.verified == true)
                                              const Flexible(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.4, 0),
                                                  child: Icon(
                                                    Icons.verified_user,
                                                    color: Color(0xFFF6BD00),
                                                    size: 18,
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 5, 0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    FlutterFlowIconButton(
                                                        borderRadius: 10,
                                                        borderWidth: 1,
                                                        buttonSize: 30,
                                                        icon: Icon(
                                                          (currentUserDocument
                                                                          ?.favorites
                                                                          .toList() ??
                                                                      [])
                                                                  .contains(
                                                                      rowUsersRecord
                                                                          .reference)
                                                              ? Icons
                                                                  .bookmark_sharp
                                                              : Icons
                                                                  .bookmark_border,
                                                          color: (currentUserDocument?.favorites
                                                                          .toList() ??
                                                                      [])
                                                                  .contains(
                                                                      rowUsersRecord
                                                                          .reference)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .alternate
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                          size: 14,
                                                        ),
                                                        onPressed: () async {
                                                          if (!loggedIn) {
                                                            context.pushNamed(
                                                                'Login1');
                                                          } else {
                                                            if (functions.isFavoriteProf(
                                                                    widget
                                                                        .userRef,
                                                                    (currentUserDocument?.favorites.toList() ??
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
                                                                          .userRef
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
                                                                          .userRef
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                            }
                                                          }
                                                        }),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 24)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            StreamBuilder<LocationsRecord>(
                                              stream:
                                                  LocationsRecord.getDocument(
                                                      rowUsersRecord.location!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
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
                                                final textLocationsRecord =
                                                    snapshot.data!;
                                                return Text(
                                                  valueOrDefault<String>(
                                                    textLocationsRecord
                                                        .locationName,
                                                    'Shqiperi',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 5, 0),
                                              child: Icon(
                                                Icons.location_pin,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 5, 0, 0),
                                        child: Container(
                                          width: 222,
                                          height: 30,
                                          decoration: const BoxDecoration(),
                                          child: Text(
                                            valueOrDefault<String>(
                                              rowUsersRecord.shortDescription,
                                              '',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Noto Sans',
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
