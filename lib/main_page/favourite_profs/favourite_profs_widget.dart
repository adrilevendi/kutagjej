import 'package:ku_ta_gjej/login1/login1_widget.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/prof_page_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'favourite_profs_model.dart';
import '/components/njoftim_tease_widget.dart';
export 'favourite_profs_model.dart';

class FavouriteProfsWidget extends StatefulWidget {
  const FavouriteProfsWidget({
    super.key,
    this.favourites,
    this.perdorus,
  });

  final UsersRecord? favourites;
  final DocumentReference? perdorus;

  @override
  State<FavouriteProfsWidget> createState() => _FavouriteProfsWidgetState();
}

class _FavouriteProfsWidgetState extends State<FavouriteProfsWidget> {
  late FavouriteProfsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavouriteProfsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!loggedIn) {
      return const Login1Widget();
    } else {
      return GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              // leading: FlutterFlowIconButton(
              //   borderColor: Colors.transparent,
              //   borderRadius: 30.0,
              //   borderWidth: 1.0,
              //   buttonSize: 60.0,
              //   icon: Icon(
              //     Icons.arrow_back_rounded,
              //     color: Colors.white,
              //     size: 30.0,
              //   ),
              //   onPressed: () async {
              //     context.pop();
              //   },
              // ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'w39t4lm1' /* Favourites */,
                ),
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Noto Sans',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Expanded(
                      //   width: MediaQuery.sizeOf(context).width,
                      //   height: 200,
                      // padding: EdgeInsetsDirectional.fromSTEB(25.0, 10.0, 0.0, 0.0),
                      child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        25.0, 10.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord.whereIn(
                              'uid',
                              currentUserDocument?.favorites
                                  .toList()
                                  .map((e) => e.id)
                                  .toList()),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> listViewUsersRecordList = snapshot
                              .data!
                              .where((u) => u.role == 'prof')
                              .toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewUsersRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewUsersRecord =
                                  listViewUsersRecordList[listViewIndex];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: ProfPageSmallWidget(
                                  key: Key(
                                      'Key5zo_${listViewIndex}_of_${listViewUsersRecordList.length}'),
                                  userRef: listViewUsersRecord.reference,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        19.0, 30.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => StreamBuilder<List<PostRecord>>(
                        stream: queryPostRecord(queryBuilder: (postRecord) {
                          return postRecord
                              .where(
                                'featured',
                                isEqualTo: true,
                              )
                              .orderBy('endTime');
                        }),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PostRecord> listViewPostRecordList =
                              snapshot.data!;
                          listViewPostRecordList.map((e) => e).toList();
                          return ListView.builder(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              50.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewPostRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewPostRecord =
                                  listViewPostRecordList[listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'NjoftimSingle',
                                    queryParameters: {
                                      'postRef': serializeParam(
                                        listViewPostRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: StaffPostWidget(
                                  key: Key(
                                    'Key52w_${listViewPostRecord.reference.id}',
                                  ),
                                  post: listViewPostRecord,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
      );
    }
  }
}
