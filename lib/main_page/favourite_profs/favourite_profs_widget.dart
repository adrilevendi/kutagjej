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

class _FavouriteProfsWidgetState extends State<FavouriteProfsWidget>
    with SingleTickerProviderStateMixin {
  late FavouriteProfsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavouriteProfsModel());
    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
      return DefaultTabController(
          initialIndex: 0, //optional, starts from 0, select the tab by default
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Favorites",
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                bottom: TabBar(
                    isScrollable: true,
                    labelColor: FlutterFlowTheme.of(context).primaryText,
                    unselectedLabelColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    labelPadding: const EdgeInsetsDirectional.fromSTEB(
                        32.0, 0.0, 32.0, 0.0),
                    labelStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Noto Sans',
                              letterSpacing: 0.0,
                            ),
                    unselectedLabelStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Noto Sans',
                              letterSpacing: 0.0,
                            ),
                    indicatorColor: FlutterFlowTheme.of(context).primary,
                    indicatorWeight: 3.0,
                    tabs: [
                      Tab(
                        text: "Professionals",
                      ),
                      Tab(
                        text: "Staff",
                      ),
                    ]),
              ),
              body: TabBarView(children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      25.0, 30.0, 0.0, 0.0),
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
                ),
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
                              child: NjoftimTeaseWidget(
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
              ])));
    }
  }
}
