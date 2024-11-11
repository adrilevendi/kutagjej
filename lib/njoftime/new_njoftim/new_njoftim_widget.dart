import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new_njoftim_model.dart';
export 'new_njoftim_model.dart';

class NewNjoftimWidget extends StatefulWidget {
  const NewNjoftimWidget({super.key});

  @override
  State<NewNjoftimWidget> createState() => _NewNjoftimWidgetState();
}

class _NewNjoftimWidgetState extends State<NewNjoftimWidget> {
  late NewNjoftimModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late final int firstPostDiscount;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewNjoftimModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();
    _model.priceDayTotal = 0;
    _model.priceWeekTotal = 0;
    if (loggedIn) {
      firstPostDiscount = currentUserDocument!.firstPost == true ? 0 : 1;
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/wowo2.png',
                              width: 45.0,
                              height: 120.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Home');
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x2FF6F9F7),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.close_rounded,
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 35.0, 20.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                maxWidth: 500.00,
                                imageQuality: 56,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }

                              var mediaRecordReference =
                                  MediaRecord.collection.doc();
                              await mediaRecordReference
                                  .set(createMediaRecordData(
                                mediaType: 'photo',
                                mediaUrl: _model.uploadedFileUrl,
                                user: currentUserReference,
                              ));
                              _model.uploadedMediaNewNjoftim =
                                  MediaRecord.getDocumentFromData(
                                      createMediaRecordData(
                                        mediaType: 'photo',
                                        mediaUrl: _model.uploadedFileUrl,
                                        user: currentUserReference,
                                      ),
                                      mediaRecordReference);

                              setState(() {});
                            },
                            child: Container(
                              width: double.infinity,
                              height: 170.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent4,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: const Color(0x65101213),
                                ),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedFileUrl.isEmpty) {
                                    //

                                    return const Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.kplus,
                                          color: Color(0xFFB8B7B7),
                                          size: 70.0,
                                        )
                                      ],
                                    );
                                  }

                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image(
                                        image: NetworkImage(
                                            _model.uploadedFileUrl),
                                        fit: BoxFit.cover,
                                        height: 168,
                                        width:
                                            MediaQuery.sizeOf(context).width -
                                                40,
                                      ));
                                },
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 35.0, 20.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'gm8ff7m2' /* Titulli i njoftimit */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .placeholderText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
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
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController2,
                                  focusNode: _model.textFieldFocusNode2,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '1bgvn3iy' /* Name Of Business */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .placeholderText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
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
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController5,
                                  focusNode: _model.textFieldFocusNode5,
                                  autofocus: false,
                                  obscureText: false,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '2ipr60bj' /* Position */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .placeholderText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
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
                                  validator: _model.textController5Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController3,
                                  focusNode: _model.textFieldFocusNode3,
                                  autofocus: false,
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'v4hfps1e' /* Salary (Euro) */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .placeholderText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
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
                                  validator: _model.textController3Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: StreamBuilder<List<LocationsRecord>>(
                                  stream: queryLocationsRecord(),
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
                                    List<LocationsRecord>
                                        dropDownLocationsRecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController2 ??=
                                              FormFieldController<String>(null),
                                      options: dropDownLocationsRecordList
                                          .map((e) => e.locationName)
                                          .toList(),
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.dropDownValue2 = val);
                                        _model.selectedLocation =
                                            await queryLocationsRecordOnce(
                                          queryBuilder: (locationsRecord) =>
                                              locationsRecord.where(
                                            'location_name',
                                            isEqualTo: _model.dropDownValue2,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);

                                        setState(() {});
                                      },
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 56.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Noto Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .placeholderText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'u6x5pkv6' /* Zgjidh qytetin */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .placeholderText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 1.0,
                                      borderRadius: 15.0,
                                      margin:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: FlutterFlowDropDown<int>(
                                  controller:
                                      _model.dropDownValueController3 ??=
                                          FormFieldController<int>(null),
                                  options: List<int>.from(
                                      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
                                  optionLabels: [
                                    FFLocalizations.of(context).getText(
                                      'ol6bm9dp' /* 1 ore */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'ndmblibi' /* 2 ore */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '2as2hwwy' /* 3 ore */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '19f60eme' /* 4 ore  */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '7r25220u' /* 5 ore */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '1kv0i49u' /* 6 ore */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'taxt61pp' /* 7 ore */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '15t2g73u' /* 8 ore */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'eiugurpe' /* 9 ore */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '91fzsoxp' /* 10 ore */,
                                    )
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue3 = val),
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 56.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .placeholderText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'bd1ayh9d' /* Shift hours */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 1.0,
                                  borderRadius: 15.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: FlutterFlowDropDown<int>(
                                  controller:
                                      _model.dropDownValueController4 ??=
                                          FormFieldController<int>(null),
                                  options: List<int>.from([1, 2, 3]),
                                  optionLabels: [
                                    FFLocalizations.of(context).getText(
                                      'ae3kkkvs' /* Turni 1 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '6q5bvlch' /* Turni 2 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'l6o5ky5f' /* Turni 3 */,
                                    )
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue4 = val),
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 56.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Noto Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .placeholderText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'y8u1jmb5' /* Shift */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 1.0,
                                  borderRadius: 15.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: TextFormField(
                                  controller: _model.textController4,
                                  focusNode: _model.textFieldFocusNode4,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '628hi321' /* Description */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: const Color(0xD9757575),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    alignLabelWithHint: true,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
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
                                  maxLines: 5,
                                  validator: _model.textController4Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StreamBuilder<List<ServiceRecord>>(
                                stream: queryServiceRecord(
                                  queryBuilder: (serviceRecord) =>
                                      serviceRecord.where(
                                    'slug',
                                    isEqualTo: 'post-pune',
                                  ),
                                  singleRecord: true,
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
                                  List<ServiceRecord>
                                      dropDownServiceRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final dropDownServiceRecord =
                                      dropDownServiceRecordList.isNotEmpty
                                          ? dropDownServiceRecordList.first
                                          : null;
                                  _model.pricePerWeek =
                                      dropDownServiceRecord!.pricePerWeek;
                                  _model.pricePerWeekAdditionalDay =
                                      dropDownServiceRecord
                                          .pricePerWeekAdditionalDay;
                                  return Column(
                                    children: [
                                      FlutterFlowDropDown<num>(
                                        controller:
                                            _model.dropDownValueController5 ??=
                                                FormFieldController<num>(null),
                                        options: _model.durationList(
                                            '', 10)!['values'],
                                        optionLabels: _model.durationList(
                                            ' javë', 10)!['labels'],
                                        onChanged: (val) async {
                                          setState(() {
                                            _model.dropDownValue5 =
                                                val! - firstPostDiscount;
                                            _model.priceWeekTotal =
                                                (val - firstPostDiscount) *
                                                    dropDownServiceRecord
                                                        .pricePerWeek;
                                          });
                                          FFAppState().price = 0;
                                          // _model.dropDownValueController6 = FormFieldController<num>(null);
                                          FFAppState().price =
                                              valueOrDefault<double>(
                                            _model.priceDayTotal! +
                                                _model.priceWeekTotal!,
                                            2.0,
                                          ).roundToDouble();
                                          setState(() {});
                                        },
                                        width: 360.0,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .placeholderText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'qd6bm0ka' /* Kohezgjatja  e njofitmit */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 1.0,
                                        borderRadius: 15.0,
                                        margin: const EdgeInsetsDirectional
                                            .fromSTEB(16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: FlutterFlowDropDown<num>(
                                          controller: _model
                                                  .dropDownValueController6 ??=
                                              FormFieldController<num>(null),
                                          options: _model.durationList(
                                              '', 6)!['values'],
                                          optionLabels: _model.durationList(
                                              ' ditë', 7)!['labels'],
                                          disabled:
                                              _model.dropDownValue5 == null
                                                  ? true
                                                  : false,
                                          onChanged: (val) async {
                                            setState(() {
                                              _model.dropDownValue6 = val;
                                              _model.priceDayTotal = (val!) *
                                                  dropDownServiceRecord
                                                      .pricePerWeekAdditionalDay;
                                            });
                                            FFAppState().price =
                                                valueOrDefault<double>(
                                              _model.priceDayTotal! +
                                                  _model.priceWeekTotal!,
                                              2.0,
                                            ).roundToDouble();
                                            setState(() {});
                                          },
                                          width: 360.0,
                                          height: 56.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .placeholderText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          hintText: "Ditë shtesë",
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 1.0,
                                          borderRadius: 15.0,
                                          margin: const EdgeInsetsDirectional
                                              .fromSTEB(16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        if (currentUserDocument?.firstPost != true)
                          Container(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              "Postimi juaj i pare eshte falas per 1 javë.",
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: Container(
                                  // width: 340.0,
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var postRecordReference =
                                          PostRecord.collection.doc();
                                      await postRecordReference.set({
                                        ...createPostRecordData(
                                          description:
                                              _model.textController4.text,
                                          userRef: currentUserReference,
                                          company: _model.textController2.text,
                                          image: _model.uploadedFileUrl,
                                          location: _model
                                              .selectedLocation?.reference,
                                          title: _model.textController1.text,
                                          minPay: double.tryParse(
                                              _model.textController3.text),
                                          shiftHours: _model.dropDownValue3,
                                          shift: _model.dropDownValue4,
                                          position: _model.textController5.text,
                                          startTime: getCurrentTimestamp,
                                          endTime: getCurrentTimestamp.add(
                                            Duration(
                                                days: (_model.dropDownValue5!
                                                            .toInt() *
                                                        7 +
                                                    (_model.dropDownValue6 !=
                                                            null
                                                        ? _model.dropDownValue6!
                                                            .toInt()
                                                        : 0))),
                                          ),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'publishedDate':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.newPost =
                                          PostRecord.getDocumentFromData({
                                        ...createPostRecordData(
                                            description:
                                                _model.textController4.text,
                                            userRef: currentUserReference,
                                            company:
                                                _model.textController2.text,
                                            image: _model.uploadedFileUrl,
                                            location: _model
                                                .selectedLocation?.reference,
                                            title: _model.textController1.text,
                                            minPay: double.tryParse(
                                                _model.textController3.text),
                                            shiftHours: _model.dropDownValue3,
                                            shift: _model.dropDownValue4,
                                            position:
                                                _model.textController5.text,
                                            endTime: getCurrentTimestamp.add(
                                                Duration(
                                                    days: (_model
                                                                .dropDownValue5!
                                                                .toInt() *
                                                            7 +
                                                        (_model.dropDownValue6 !=
                                                                null
                                                            ? _model
                                                                .dropDownValue6!
                                                                .toInt()
                                                            : 0))))),
                                        ...mapToFirestore(
                                          {
                                            'publishedDate': DateTime.now(),
                                          },
                                        ),
                                      }, postRecordReference);
                                      var firstPostDiscount = 0;
                                      if (currentUserDocument?.firstPost !=
                                          true) {
                                        await currentUserReference?.update(
                                            createUsersRecordData(
                                                firstPost: true));
                                        firstPostDiscount = 7;
                                      }
                                      var amount = ((_model.dropDownValue5!) *
                                              _model.pricePerWeek! +
                                          (_model.dropDownValue6 != null
                                              ? _model.dropDownValue6! *
                                                  _model
                                                      .pricePerWeekAdditionalDay!
                                              : 0));
                                      print(
                                          "=============================DEBUG============================");
                                      print(amount);

                                      if (!context.mounted) return;
                                      context.pushNamed(
                                        'testCheckout',
                                        queryParameters: {
                                          'post': serializeParam(
                                            {_model.newPost},
                                            ParamType.JSON,
                                          ),
                                          'amount': serializeParam(
                                              amount, ParamType.double),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'post': _model.newPost,
                                        },
                                      );

                                      setState(() {});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '7kxmfq6z' /* POSTO NJOFTIMIN -  */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Noto Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'p56zvft7' /* ALL */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .price
                                                        .toString(),
                                                    '0',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
