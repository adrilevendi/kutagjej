
import '/backend/backend.dart';
import '/components/njoftim_tease_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'njoftime_pune2_model.dart';
export 'njoftime_pune2_model.dart';
import '/search_prof/filter_sidebar/filter_sidebar_widget.dart';

import 'package:text_search/text_search.dart';
import 'package:easy_debounce/easy_debounce.dart';

class NjoftimePune2Widget extends StatefulWidget {
  const NjoftimePune2Widget({super.key});

  @override
  State<NjoftimePune2Widget> createState() => _NjoftimePune2WidgetState();
}

class _NjoftimePune2WidgetState extends State<NjoftimePune2Widget> {
  late NjoftimePune2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NjoftimePune2Model());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              // width: 450.0,
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
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
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          size: 21.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onChanged: (_) =>  EasyDebounce.debounce(
                                  '_model.textController',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    await queryPostRecordOnce(
                                      queryBuilder: (query) {
                                        var pr = query
                                        // .where(
                                        //   'title', 
                                        //   isNull: false,
                                        // )
                                        // .limit(100)
                                        .where('endTime', isGreaterThan: getCurrentTimestamp)
                                        // .where('category', isNull: false)
                                        ;
                                         if (FFAppState().SearchFilterLocations.isNotEmpty ) {
                                          pr.whereIn('location',  FFAppState().SearchFilterLocations )
                                        ;
                                        }
                                        pr.orderBy('startTime', descending: true);
                                        return pr;
                                      }
                                    )
                                        .then(
                                          (records) => _model
                                              .simpleSearchResults = TextSearch(
                                            records
                                                .map(
                                                  (record) =>
                                                      TextSearchItem.fromTerms(
                                                          record, [
                                                    // record.title!,
                                                    record.company,
                                                    record.position!,
                                                    record.description
                                                  ]),
                                                )
                                                .toList(),
                                          )
                                              .search(
                                                  _model.textController.text)
                                              .map((r) => r.object)
                                              .take(30)
                                              .toList(),
                                        )
                                        .onError((_, __) =>
                                            _model.simpleSearchResults = [])
                                        .whenComplete(() => setState(() {}));
                                  },
                                ),

                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.fromLTRB(21, 21, 21, 0),

                            labelText: FFLocalizations.of(context).getText(
                              'n1ogo7bu' /* Search... */,
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
                                color: Color(0x4D96EE89),
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
                            fillColor: const Color(0x31F8F6F6),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('NewNjoftim');
                          },
                          child: Container(
                            width: 80.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: const Color(0x1EF6F9F7),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 2.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'avzsynyu' /* Posto */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Noto Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'jdqapd1l' /* Results */,
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
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
                                                
                                              },
                                            ),
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
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
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
                          ),                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<List<PostRecord>>(
                stream: queryPostRecord(
                   queryBuilder: (postRecord) { 
                   var pr = postRecord;
                   
                    var sl = FFAppState().SearchFilterLocations;
                        if (sl.isNotEmpty ) {
                          print("SEARCH STATE LOC not empty");
                          
                                          pr.where('location', whereIn:  sl );
                          print("Query PAram location:");

                                          print(pr.parameters);
                                        }
                   pr.where(
                          'paid',
                          isEqualTo: true,
                        ).orderBy('endTime');

                       
                       print("DEBUG APPSTATE SL===========");
                       print(FFAppState().SearchFilterLocations);
                                        return pr;
                   }
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
                  List<PostRecord> listViewPostRecordList = snapshot.data!;
                   if(_model.textController != null  ) {
                                  if(_model.textController!.value
                                  
                                  .text == ''){
                                _model.simpleSearchResults = listViewPostRecordList;
                              print("Search bar is empty");

                                } 
                          }
                                 final searchResultPost = _model.simpleSearchResults
                                .map((e) => e)
                                .toList();
                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      50.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: searchResultPost.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewPostRecord =
                          searchResultPost[listViewIndex];
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
                        child: wrapWithModel(
                          model: _model.njoftimTeaseModels.getModel(
                             _model
                                                .simpleSearchResults[ 
                                                    listViewIndex]
                                                .reference
                                                .id,
                                            listViewIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          child: NjoftimTeaseWidget(
                            key: Key(
                              'Key52w_${listViewPostRecord.reference.id}',
                            ),
                            post: listViewPostRecord,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
