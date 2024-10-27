import 'package:ku_ta_gjej/login1/login1_widget.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import 'dart:async';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'chat_model.dart';
import '/components/show_phone_number_widget.dart';
// import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:jiffy/jiffy.dart';

export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.chat,
  });

  final ChatsRecord? chat;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;
  late final ScrollController _controller;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
        _controller = ScrollController(
          keepScrollOffset: true,
        );

    super.initState();
    _model = createModel(context, () => ChatModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

  }

  @override
  void dispose() {
    _model.dispose();
    // _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
       if (!loggedIn){
                return const Login1Widget();
              } else {
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(
                      widget.chat?.recipient == currentUserReference
                          ? widget.chat!.sender!
                          : widget.chat!.recipient!),
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
                    final containerUsersRecord = snapshot.data!;
                    // print(containerUsersRecord);
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 10.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      FFIcons.kchevronLeft,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'DetailedProfile',
                                      queryParameters: {
                                        'userRef': serializeParam(
                                          containerUsersRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 35.0,
                                          height: 35.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image(
                                            image: NetworkImage(
                                             containerUsersRecord.photoUrl.isNotEmpty ? containerUsersRecord.photoUrl : 'https://st4.depositphotos.com/9998432/25177/v/450/depositphotos_251778046-stock-illustration-person-gray-photo-placeholder-man.jpg',
                                          ),fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            7.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          containerUsersRecord.displayName,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Noto Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    return FutureBuilder<int>(
                                        future: queryMessageRecordCount(
                                          parent: widget.chat?.reference,
                                          queryBuilder: (messageRecord) =>
                                              messageRecord
                                                  .where(
                                                    'sender',
                                                    isNotEqualTo:
                                                        currentUserReference,
                                                  )
                                                  
                                        ),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        165.0, 0.0, 0.0, 0.0)
                                            );
                                          } else {
                                            if (snapshot.data! > 2 && containerUsersRecord.hasPhoneNumber()) {
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        165.0, 0.0, 0.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    FFIcons.kphone,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 22.0,
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
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.4,
                                                child: ShowPhoneNumberWidget(
                                                  number: containerUsersRecord
                                                      .phoneNumber,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                                ),
                                              );
                                            } else {
                                              return const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        165.0, 0.0, 0.0, 0.0)
                                              );
                                            }
                                          }
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height:  MediaQuery.sizeOf(context).height * 0.8,
                            padding: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                              // border: Border.all(color: const Color.fromARGB(255, 146, 57, 57), width: 3)
                            ),
                            // child: SingleChildScrollView(
                              child: 
                                  StreamBuilder<List<MessageRecord>>(
                                    stream: queryMessageRecord(
                                      parent: widget.chat?.reference,
                                      queryBuilder: (messageRecord) =>
                                          messageRecord.orderBy('time'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
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
                                      // if (_controller.hasClients) {
                                        // print("========================= DEBUG SCROLLER --------------");
                                        Future.delayed(const Duration(milliseconds: 50), () {
                                        _controller.jumpTo(_controller.position.maxScrollExtent);
                                      //  _controller.animateTo(_controller.position.maxScrollExtent, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);

                                      });
                                      // }
                                      // _controller = ScrollController(initialScrollOffset: _controller.position.maxScrollExtent);


                                      List<MessageRecord>
                                          listViewMessageRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: const EdgeInsets.only(top: 10),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        
                                        // physics: const NeverScrollableScrollPhysics(),
                                                physics: const AlwaysScrollableScrollPhysics(), // new

                                         controller: _controller,

                                        itemCount:
                                            listViewMessageRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewMessageRecord =
                                              listViewMessageRecordList[
                                                  listViewIndex];
                                          return  Align(
                                            alignment:
                                                const AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 35),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: Container(
                                                      width: 250,
                                                      height: valueOrDefault<
                                                          double>(
                                                        listViewMessageRecord
                                                                        .media
                                                                        ?.id !=
                                                                    null &&
                                                                listViewMessageRecord
                                                                        .media
                                                                        ?.id !=
                                                                    ''
                                                            ? 280.0
                                                            : 60.0,
                                                        280.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: listViewMessageRecord
                                                                    .sender
                                                                    ?.id ==
                                                                currentUserReference
                                                                    ?.id
                                                            ? FlutterFlowTheme
                                                                    .of(context).chat
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            (listViewMessageRecord
                                                                            .sender
                                                                            ?.id ==
                                                                        currentUserReference
                                                                            ?.id
                                                                    ? 15
                                                                    : 1)
                                                                .toDouble(),
                                                            0.0,
                                                          )),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            (listViewMessageRecord
                                                                            .sender
                                                                            ?.id ==
                                                                        currentUserReference
                                                                            ?.id
                                                                    ? 1
                                                                    : 15)
                                                                .toDouble(),
                                                            1.0,
                                                          )),
                                                          topLeft:
                                                              const Radius.circular(
                                                                  15),
                                                          topRight:
                                                              const Radius.circular(
                                                                  15),
                                                        ),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (listViewMessageRecord
                                                                              .media
                                                                              ?.id !=
                                                                          null &&
                                                                      listViewMessageRecord
                                                                              .media
                                                                              ?.id !=
                                                                          '')
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              3,
                                                                              3,
                                                                              3,
                                                                              0),
                                                                      child: StreamBuilder<
                                                                          MediaRecord>(
                                                                        stream:
                                                                            MediaRecord.getDocument(listViewMessageRecord.media!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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

                                                                          final imageMediaRecord =
                                                                              snapshot.data!;

                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  child: FlutterFlowExpandedImageView(
                                                                                    image: Image.network(
                                                                                      imageMediaRecord.mediaUrl,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                    allowRotation: true,
                                                                                    tag: imageMediaRecord.mediaUrl,
                                                                                    useHeroAnimation: true,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Hero(
                                                                              tag: imageMediaRecord.mediaUrl,
                                                                              transitionOnUserGestures: true,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(12),
                                                                                child: Image.network(
                                                                                  imageMediaRecord.mediaUrl,
                                                                                  width: 250,
                                                                                  height: 222,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            8,
                                                                            60,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            listViewMessageRecord.text,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans',
                                                                                  letterSpacing: 0,
                                                                                  fontWeight: FontWeight.w500
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            10,
                                                                            2),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              2),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              listViewMessageRecord.hasTime() ? Jiffy.parseFromDateTime(listViewMessageRecord.time!).fromNow():'',
                                                                              '9:41',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Noto Sans',
                                                                                  color: listViewMessageRecord
                                                                            .sender
                                                                            ?.id ==
                                                                        currentUserReference
                                                                            ?.id
                                                                    ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).accent2,
                                                                                  letterSpacing: 0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ].addToStart(SizedBox(
                                                    width: (listViewMessageRecord
                                                                    .sender
                                                                    ?.id ==
                                                                currentUserReference
                                                                    ?.id
                                                            ? 130
                                                            : 10)
                                                        .toDouble())),
                                              ),
                                            ),
                                          );                                           },
                                      );
                                    },
                                  ),
                                
                                    // .divide(SizedBox(height: 7.0))
                                    // .around(SizedBox(height: 7.0)),
                              
                            // ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 7.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                FFIcons.kattach,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }

                                context.pushNamed(
                                  'SendMedia',
                                  queryParameters: {
                                    'media': serializeParam(
                                      _model.uploadedLocalFile,
                                      ParamType.FFUploadedFile,
                                    ),
                                    'chat': serializeParam(
                                      widget.chat?.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 10.0, 5.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Noto Sans',
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
                                      color: Color(0x9696EE89),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x891D813E),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 7.0, 8.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 45.0,
                              icon: Icon(
                                Icons.send_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                if (_model.textController.text != '') {
                                  await MessageRecord.createDoc(
                                          widget.chat!.reference)
                                      .set({
                                    ...createMessageRecordData(
                                      text: _model.textController.text,
                                      sender: currentUserReference,
                                      read: false
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'time': FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  }).then((val) => FocusManager.instance.primaryFocus?.unfocus());// close keyboard
                                  setState(() {
                                    _model.textController?.clear();
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Write something..',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  
    }
  }
}