import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:ku_ta_gjej/auth/firebase_auth/auth_util.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

import '/backend/backend.dart';
import '/components/prof_page_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_page/prof_featured_tease/prof_featured_tease_widget.dart';
import '/search_prof/filter_sidebar/filter_sidebar_widget.dart';
import 'search_model.dart';

export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;
  late List profToShow;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  searchForProf() async {
    print("DEBUG SEARCH PROF -------------=========");

    await queryUsersRecordOnce(queryBuilder: (query) {
      var qry = query
              .where(
                'role',
                isEqualTo: 'prof',
              )
              .where('uid', isNotEqualTo: currentUserUid)
          // .orderBy('category')
          ;

      print("At Query =========");

      if (FFAppState().SearchFilterLocations.isNotEmpty) {
        print("search locations prof is not empty =========");
        qry.where('location', whereIn: FFAppState().SearchFilterLocations);
      }
      // qry.orderBy('displayName', descending: true);

      return qry;
    })
        .then(
          (records) => _model.simpleSearchResults = TextSearch(
            records
                .map(
                  (record) => TextSearchItem.fromTerms(record, [
                    // record.title!,
                    record.displayName,
                    record.category!,
                    record.shortDescription,
                    record.email
                  ]),
                )
                .toList(),
          )
              .search(_model.textController.text)
              .map((r) => r.object)
              .take(30)
              .toList(),
        )
        .onError((_, __) => _model.simpleSearchResults = [])
        .whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CategoryRecord>>(
      stream: queryCategoryRecord(
        queryBuilder: (categoryRecord) =>
            categoryRecord.whereIn('qualification', FFAppState().f),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CategoryRecord> searchCategoryRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).secondary
                        ],
                        stops: const [0.0, 1.0],
                        begin: const AlignmentDirectional(1.0, 0.98),
                        end: const AlignmentDirectional(-1.0, -0.98),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 20.0, 0.0, 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Home');
                              },
                              child: Icon(
                                FFIcons.kchevronLeft,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    searchForProf();
                                  },
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(21, 21, 21, 0),
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'f8ppmmr2' /* Search... */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Noto Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Noto Sans',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x3FF4F7F4),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0x34FFFFFF),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  // if (!loggedIn)
                                  context.pushNamed('freeTrial');
                                  // else context.pushNamed('EditProfile--2--');
                                },
                                child: Container(
                                  width: 42.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x35FFFFFF),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  alignment:
                                      const AlignmentDirectional(1.0, 0.0),
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.person_add_alt_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'x5bwgg87' /* Results */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.65,
                                            child: FilterSidebarWidget(
                                                atUpdate: () {
                                              print("filtSidWig update 369");
                                              searchForProf();
                                            }),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      width: 2.0,
                                    ),
                                  ),
                                  alignment:
                                      const AlignmentDirectional(1.0, 0.0),
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.kfilter,
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                          size: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder<List<LocationsRecord>>(
                    stream: queryLocationsRecord(
                      queryBuilder: (locationsRecord) =>
                          locationsRecord.whereIn(
                              'id',
                              List.generate(
                                  FFAppState().SearchFilterLocations.length,
                                  (index) => FFAppState()
                                      .SearchFilterLocations[index]
                                      .id)),
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
                      List<LocationsRecord> containerLocationsRecordList =
                          snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 2,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord
                                  .where('role', isEqualTo: 'prof')
                                  // .whereIn(
                                  //     'location',
                                  //     containerLocationsRecordList
                                  //         .map((e) => e.reference)
                                  //         .toList()),
                                  .whereIn('location',
                                      FFAppState().SearchFilterLocations),
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
                              List<UsersRecord> listViewUsersRecordList =
                                  snapshot.data!;
                              if (_model.textController != null) {
                                if (_model.textController!.value.text == '') {
                                  _model.simpleSearchResults =
                                      listViewUsersRecordList;
                                }
                              }

                              _model.simpleSearchResults.map((e) => e).toList();
                              return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: _model.simpleSearchResults.length,
                                  itemBuilder:
                                      (context, searchResultProfIndex) {
                                    final searchResultProfItem =
                                        _model.simpleSearchResults[
                                            searchResultProfIndex];
                                    return Builder(
                                      builder: (context) {
                                        if (searchResultProfItem.verified ==
                                            true) {
                                          return Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(15, 0, 15, 15),
                                            child: wrapWithModel(
                                                model: _model
                                                    .profFeaturedTeaseModels
                                                    .getModel(
                                                  _model
                                                      .simpleSearchResults[
                                                          searchResultProfIndex]
                                                      .reference
                                                      .id,
                                                  searchResultProfIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child:
                                                      ProfFeaturedTeaseWidget(
                                                    key: Key(
                                                      'Keyn7e_${_model.simpleSearchResults[searchResultProfIndex].reference.id}',
                                                    ),
                                                    prof: searchResultProfItem,
                                                    isFavorite: false,
                                                  ),
                                                )),
                                          );
                                        } else {
                                          return Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(10, 0, 0, 0),
                                            child: wrapWithModel(
                                              model: _model.profPageSmallModels
                                                  .getModel(
                                                searchResultProfItem
                                                    .reference.id,
                                                searchResultProfIndex,
                                              ),
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 10),
                                                child: ProfPageSmallWidget(
                                                  key: Key(
                                                    'Keyeef_${searchResultProfItem.reference.id}',
                                                  ),
                                                  userRef: searchResultProfItem
                                                      .reference,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
