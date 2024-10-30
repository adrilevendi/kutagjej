import 'dart:developer';

import 'package:ku_ta_gjej/login1/login1_widget.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_folder/delete_chats_prompt/delete_chats_prompt_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'list11_messages_model.dart';
export 'list11_messages_model.dart';

class List11MessagesWidget extends StatefulWidget {
  const List11MessagesWidget({super.key});

  @override
  State<List11MessagesWidget> createState() => _List11MessagesWidgetState();
}

class _List11MessagesWidgetState extends State<List11MessagesWidget> {
  late List11MessagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => List11MessagesModel());
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
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              actions: const [],
              centerTitle: false,
              elevation: 0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'g725sjit' /* My Messages */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Noto Sans',
                                  letterSpacing: 0,
                                ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.selectedChats.isNotEmpty)
                            FlutterFlowIconButton(
                              borderRadius: 10,
                              borderWidth: 1,
                              buttonSize: 40,
                              icon: Icon(
                                Icons.close_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () async {
                                _model.selectedChats = [];
                                setState(() {});
                              },
                            ),
                          if (_model.selectedChats.isNotEmpty)
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 10,
                              borderWidth: 1,
                              buttonSize: 40,
                              icon: FaIcon(
                                FontAwesomeIcons.trashAlt,
                                color: FlutterFlowTheme.of(context).error,
                                size: 24,
                              ),
                              onPressed: () async {
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
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: 300,
                                          child: DeleteChatsPromptWidget(
                                            chatsToDelete: _model.selectedChats,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.selectedChats = [];
                                setState(() {});
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'oqmpl6wx' /* Below are messages with others... */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Noto Sans',
                          letterSpacing: 0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<ChatsRecord>>(
                        stream: queryChatsRecord(
                          queryBuilder: (chatsRecord) =>
                              chatsRecord.where(Filter.or(
                            Filter(
                              'recipient',
                              isEqualTo: currentUserReference,
                            ),
                            Filter(
                              'sender',
                              isEqualTo: currentUserReference,
                            ),
                          )),
                        ),
                        builder: (context, snapshot) {
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
                          List<ChatsRecord> listViewChatsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewChatsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewChatsRecord =
                                  listViewChatsRecordList[listViewIndex];
                              // print( listViewChatsRecordList[listViewIndex]);
                              // print( listViewChatsRecord);

                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 1, 0, 0),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      listViewChatsRecord.recipient ==
                                              currentUserReference
                                          ? listViewChatsRecord.sender!
                                          : listViewChatsRecord.recipient!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final containerUsersRecord = snapshot.data!;
                                    // print( containerUsersRecord) ;

                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        queryMessageRecord(
                                            parent:
                                                listViewChatsRecord.reference,
                                            queryBuilder: (messageRecord) {
                                              print(
                                                  "================================debug+++++++++++++++++++++++++++++++++++++++++++++++++++");
                                              // .get().then((val) => val.docs.forEach(((message) => message.reference.update({'read': true}))))
                                              return messageRecord
                                                  .where(
                                                    'sender',
                                                    isNotEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .where(
                                                    'read',
                                                    isEqualTo: false,
                                                  );
                                            });
                                        // .forEach((list) => list.forEach((message) => message.reference.update(createMessageRecordData(read: true))));

                                        await context.pushNamed(
                                          'CHAT',
                                          queryParameters: {
                                            'chat': serializeParam(
                                              listViewChatsRecordList[
                                                  listViewIndex],
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'chat': listViewChatsRecord,
                                          },
                                        );

                                        setState(() {});

                                        // await listViewChatsRecord.messages.last
                                        //     .update(createMessageRecordData(
                                        //   read: true,
                                        //   delivered: true,
                                        // ));
                                      },
                                      onLongPress: () async {
                                        _model.addToSelectedChats(
                                            listViewChatsRecord.reference);
                                        setState(() {});
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            12, 0, 12, 12),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 44,
                                                          height: 44,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(2),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  FadeInImage(
                                                                image: NetworkImage(containerUsersRecord
                                                                        .photoUrl
                                                                        .isNotEmpty
                                                                    ? containerUsersRecord
                                                                        .photoUrl
                                                                    : 'https://st4.depositphotos.com/9998432/25177/v/450/depositphotos_251778046-stock-illustration-person-gray-photo-placeholder-man.jpg'),
                                                                placeholder:
                                                                    const AssetImage(
                                                                        'assets/images/profile_placeholder.jpg'),
                                                                width: 44,
                                                                height: 44,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    8, 0, 0, 0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    MessageRecord>>(
                                                              stream:
                                                                  queryMessageRecord(
                                                                parent:
                                                                    listViewChatsRecord
                                                                        .reference,
                                                                queryBuilder: (messageRecord) =>
                                                                    messageRecord.orderBy(
                                                                        'time',
                                                                        descending:
                                                                            true),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<MessageRecord>
                                                                    columnMessageRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final columnMessageRecord =
                                                                    columnMessageRecordList
                                                                            .isNotEmpty
                                                                        ? columnMessageRecordList
                                                                            .first
                                                                        : null;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        containerUsersRecord
                                                                            .displayName,
                                                                        'Test Name',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto Sans',
                                                                            letterSpacing:
                                                                                0,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          columnMessageRecord
                                                                              ?.text,
                                                                          'This was really great, i\'m so glad that we could  catchup this weekend.',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans',
                                                                              letterSpacing: 0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              columnMessageRecord?.time?.toString(),
                                                                              'Mon. July 3rd - 4:12pm',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'Noto Sans',
                                                                                  letterSpacing: 0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Builder(
                                                                                  builder: (context) {
                                                                                    if (columnMessageRecord?.sender == currentUserReference) {
                                                                                      return Stack(
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                                                                            child: Icon(
                                                                                              Icons.check,
                                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                                              size: 21,
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: const AlignmentDirectional(0, 0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                                                                                              child: Icon(
                                                                                                Icons.check,
                                                                                                color: valueOrDefault<Color>(
                                                                                                  columnMessageRecord!.read ? FlutterFlowTheme.of(context).success : FlutterFlowTheme.of(context).secondaryText,
                                                                                                  FlutterFlowTheme.of(context).success,
                                                                                                ),
                                                                                                size: 21,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    } else {
                                                                                      log('Chat Reference : ${listViewChatsRecord.reference.path}');

                                                                                      listViewChatsRecord.reference;

                                                                                      // now
                                                                                      // print(listViewChatsRecord.reference);
                                                                                      return FutureBuilder<int>(
                                                                                          // stream: getUnreadMessageCountStream(reference: listViewChatsRecord.reference, userId: currentUserUid),
                                                                                          future: queryMessageRecordCount(
                                                                                            parent: listViewChatsRecord.reference,
                                                                                            queryBuilder: (Query<Object?> messageRecord) {
                                                                                              return messageRecord
                                                                                                  .where(
                                                                                                    'sender',
                                                                                                    isNotEqualTo: currentUserReference,
                                                                                                  )
                                                                                                  .where(
                                                                                                    'read',
                                                                                                    isEqualTo: false,
                                                                                                  );
                                                                                            },
                                                                                          ),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 20,
                                                                                                  height: 20,
                                                                                                  child: CircularProgressIndicator(
                                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            int textFieldCount = snapshot.data!;

                                                                                            return Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 5),
                                                                                              child: badges.Badge(
                                                                                                badgeContent: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    textFieldCount.toString(),
                                                                                                    '2',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: 'Noto Sans',
                                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                        letterSpacing: 0,
                                                                                                        fontWeight: FontWeight.w800,
                                                                                                      ),
                                                                                                ),
                                                                                                showBadge: true,
                                                                                                shape: badges.BadgeShape.circle,
                                                                                                badgeColor: FlutterFlowTheme.of(context).primary,
                                                                                                elevation: 0,
                                                                                                padding: const EdgeInsets.all(6),
                                                                                                position: badges.BadgePosition.topEnd(),
                                                                                                animationType: badges.BadgeAnimationType.scale,
                                                                                                toAnimate: true,
                                                                                                child: Container(
                                                                                                  width: 12,
                                                                                                  height: 12,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          });
                                                                                    }
                                                                                  },
                                                                                ),
                                                                                Icon(
                                                                                  Icons.chevron_right_rounded,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 24,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Opacity(
                                                    opacity:
                                                        valueOrDefault<double>(
                                                      _model.selectedChats.contains(
                                                                  listViewChatsRecord
                                                                      .reference) ==
                                                              true
                                                          ? 0.2
                                                          : 0.0,
                                                      0.0,
                                                    ),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                              context)
                                                          .width,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
