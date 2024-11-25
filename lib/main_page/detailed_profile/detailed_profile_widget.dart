import 'dart:math';

import 'package:flutter/foundation.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/stars_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/main_page/rating_modal/rating_modal_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_expanded_image_view.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share_plus/share_plus.dart';

import 'detailed_profile_model.dart';
export 'detailed_profile_model.dart';

class DetailedProfileWidget extends StatefulWidget {
  const DetailedProfileWidget({
    super.key,
    String? userName,
    this.chating,
    required this.userRef,
  }) : userName = userName ?? 'test user name';

  final String userName;
  final ChatsRecord? chating;
  final DocumentReference? userRef;

  @override
  State<DetailedProfileWidget> createState() => _DetailedProfileWidgetState();
}

class _DetailedProfileWidgetState extends State<DetailedProfileWidget>
    with TickerProviderStateMixin {
  late DetailedProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailedProfileModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, -400.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 500.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
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
      'containerOnActionTriggerAnimation2': AnimationInfo(
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final detailedProfileUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: StreamBuilder<LocationsRecord>(
                      stream: LocationsRecord.getDocument(
                          detailedProfileUsersRecord.location!),
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
                        final stackLocationsRecord = snapshot.data!;
                        return Stack(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 338.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 334.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Stack(
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl:
                                                      valueOrDefault<String>(
                                                    detailedProfileUsersRecord
                                                        .photoUrl,
                                                    'https://stablepoint.com/assets/uploads/images/blog/make-your-website-load-faster.jpg',
                                                  ),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  fit: BoxFit.cover,
                                                ).animateOnPageLoad(animationsMap[
                                                    'imageOnPageLoadAnimation']!),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      20.0, 55.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.safePop();
                                                        },
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    7.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_back_ios,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 85.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Share.share(
                                                                      'KuTaGjej | ${widget.userName} ${Uri.base}');
                                                                },
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .kshareSquare,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                                thickness: 1,
                                                                width: 1,
                                                                indent: 7,
                                                                endIndent: 7,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        9,
                                                                        0),
                                                                child:
                                                                    AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (functions.isFavoriteProf(
                                                                              detailedProfileUsersRecord.reference,
                                                                              (currentUserDocument?.favorites.toList() ?? []).toList()) ==
                                                                          true) {
                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'favorites': FieldValue.arrayRemove([
                                                                                widget.userRef
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Favorite removed.',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                const Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        await currentUserReference!
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'favorites': FieldValue.arrayUnion([
                                                                                widget.userRef
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Favourite added',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                const Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      (currentUserDocument?.favorites.toList() ?? []).contains(widget
                                                                              .userRef)
                                                                          ? Icons
                                                                              .bookmark_rounded
                                                                          : Icons
                                                                              .bookmark_border,
                                                                      color: (currentUserDocument?.favorites.toList() ?? []).contains(widget
                                                                              .userRef)
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .accent2,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ]),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 1.0),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.7,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0),
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 30.0, 0.0, 0.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          flex: 70,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              -1.0,
                                                                              1.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          detailedProfileUsersRecord
                                                                              .category,
                                                                          'i  pergjithshem',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Noto Sans',
                                                                              fontSize: 22.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    if (detailedProfileUsersRecord
                                                                            .verified ==
                                                                        true)
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              3.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.verified_user_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).warning,
                                                                            size:
                                                                                21.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              ReviewRecord>>(
                                                                        stream:
                                                                            queryReviewRecord(
                                                                          queryBuilder: (reviewRecord) =>
                                                                              reviewRecord.where(
                                                                            'reviewedRef',
                                                                            isEqualTo:
                                                                                detailedProfileUsersRecord.reference,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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

                                                                          List<ReviewRecord>
                                                                              ratingBarReviewRecordList =
                                                                              snapshot.data!;
                                                                          var ratingVal = ratingBarReviewRecordList.isEmpty
                                                                              ? 5.0
                                                                              : ratingBarReviewRecordList.map((m) => m.rating).reduce((a, b) => a + b) / ratingBarReviewRecordList.length;

                                                                          if (kIsWeb) {
                                                                            return Row(
                                                                                children: List.generate(
                                                                              5,
                                                                              (index) => InkWell(
                                                                                onTap: () async {},
                                                                                child: Icon(
                                                                                  Icons.star_rounded,
                                                                                  color: ratingVal >= index.toDouble() + 1 ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).accent2,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ));
                                                                          } else {
                                                                            return RatingBar.builder(
                                                                              onRatingUpdate: (newValue) => setState(() => _model.ratingBarValue = newValue),
                                                                              itemBuilder: (context, index) => Icon(
                                                                                Icons.star_rounded,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              direction: Axis.horizontal,
                                                                              initialRating: ratingVal ??= 3.3,
                                                                              unratedColor: FlutterFlowTheme.of(context).accent3,
                                                                              itemCount: 5,
                                                                              itemSize: 25.0,
                                                                              glowColor: FlutterFlowTheme.of(context).secondary,
                                                                              ignoreGestures: true,
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(20.0,
                                                              0.0, 0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            detailedProfileUsersRecord
                                                                .displayName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  FutureBuilder<
                                                                      int>(
                                                                    future:
                                                                        queryReviewRecordCount(
                                                                      queryBuilder:
                                                                          (reviewRecord) =>
                                                                              reviewRecord.where(
                                                                        'reviewedRef',
                                                                        isEqualTo:
                                                                            widget.userRef,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      int textCount =
                                                                          snapshot
                                                                              .data!;
                                                                      return Text(
                                                                        textCount
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Noto Sans',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  FutureBuilder<
                                                                      int>(
                                                                    future:
                                                                        queryReviewRecordCount(
                                                                      queryBuilder:
                                                                          (reviewRecord) =>
                                                                              reviewRecord.where(
                                                                        'reviewedRef',
                                                                        isEqualTo:
                                                                            widget.userRef,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      int textCount =
                                                                          snapshot
                                                                              .data!;
                                                                      return Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'pks2mmj1' /*  reviews */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Noto Sans',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(20.0,
                                                              2.0, 20.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              stackLocationsRecord
                                                                  .locationName,
                                                              'Tirana ,AL',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons.location_pin,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 25.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              10.0, 0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                MouseRegion(
                                                                  opaque: false,
                                                                  cursor: MouseCursor
                                                                          .defer ??
                                                                      MouseCursor
                                                                          .defer,
                                                                  onEnter:
                                                                      ((event) async {
                                                                    setState(() =>
                                                                        _model.mouseRegionHovered1 =
                                                                            true);
                                                                    if (animationsMap[
                                                                            'containerOnActionTriggerAnimation1'] !=
                                                                        null) {
                                                                      await animationsMap[
                                                                              'containerOnActionTriggerAnimation1']!
                                                                          .controller
                                                                          .forward(
                                                                              from: 0.0);
                                                                    }
                                                                  }),
                                                                  onExit:
                                                                      ((event) async {
                                                                    setState(() =>
                                                                        _model.mouseRegionHovered1 =
                                                                            false);
                                                                    if (animationsMap[
                                                                            'containerOnActionTriggerAnimation1'] !=
                                                                        null) {
                                                                      await animationsMap[
                                                                              'containerOnActionTriggerAnimation1']!
                                                                          .controller
                                                                          .reverse();
                                                                    }
                                                                  }),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        var shouldSetState =
                                                                            false;
                                                                        if (loggedIn) {
                                                                          _model.existingChat =
                                                                              await queryChatsRecordOnce(
                                                                            queryBuilder: (chatsRecord) => chatsRecord
                                                                                .where(
                                                                                  'recipient',
                                                                                  isEqualTo: widget.userRef,
                                                                                )
                                                                                .where(
                                                                                  'sender',
                                                                                  isEqualTo: currentUserReference,
                                                                                ),
                                                                            singleRecord:
                                                                                true,
                                                                          ).then((s) => s.firstOrNull);
                                                                          shouldSetState =
                                                                              true;
                                                                          if (_model.existingChat !=
                                                                              null) {
                                                                            context.pushNamed(
                                                                              'CHAT',
                                                                              queryParameters: {
                                                                                'chat': serializeParam(
                                                                                  _model.existingChat,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'chat': _model.existingChat,
                                                                              },
                                                                            );
                                                                          } else {
                                                                            var chatsRecordReference =
                                                                                ChatsRecord.collection.doc();
                                                                            await chatsRecordReference.set(createChatsRecordData(
                                                                              recipient: widget.userRef,
                                                                              sender: currentUserReference,
                                                                            ));
                                                                            _model.createdChat = ChatsRecord.getDocumentFromData(
                                                                                createChatsRecordData(
                                                                                  recipient: widget.userRef,
                                                                                  sender: currentUserReference,
                                                                                ),
                                                                                chatsRecordReference);
                                                                            shouldSetState =
                                                                                true;

                                                                            context.pushNamed(
                                                                              'CHAT',
                                                                              queryParameters: {
                                                                                'chat': serializeParam(
                                                                                  _model.createdChat,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'chat': _model.createdChat,
                                                                              },
                                                                            );
                                                                          }

                                                                          if (shouldSetState) {
                                                                            setState(() {});
                                                                          }
                                                                          return;
                                                                        } else {
                                                                          context
                                                                              .pushNamed('Login1');
                                                                        }

                                                                        if (shouldSetState) {
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                      },
                                                                      child:
                                                                          AnimatedContainer(
                                                                        duration:
                                                                            const Duration(milliseconds: 100),
                                                                        curve: Curves
                                                                            .elasticOut,
                                                                        width: MediaQuery.sizeOf(context).width -
                                                                            40,
                                                                        height:
                                                                            38.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          boxShadow: const [
                                                                            BoxShadow(
                                                                              blurRadius: 4.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                2.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'rynszofa' /* Send Message */,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Noto Sans',
                                                                                      color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnActionTrigger(
                                                                      animationsMap[
                                                                          'containerOnActionTriggerAnimation1']!,
                                                                    ),
                                                                  ),
                                                                ),
                                                                MouseRegion(
                                                                  opaque: false,
                                                                  cursor: MouseCursor
                                                                          .defer ??
                                                                      MouseCursor
                                                                          .defer,
                                                                  onEnter:
                                                                      ((event) async {
                                                                    setState(() =>
                                                                        _model.mouseRegionHovered2 =
                                                                            true);
                                                                    if (animationsMap[
                                                                            'containerOnActionTriggerAnimation2'] !=
                                                                        null) {
                                                                      await animationsMap[
                                                                              'containerOnActionTriggerAnimation2']!
                                                                          .controller
                                                                          .forward(
                                                                              from: 0.0);
                                                                    }
                                                                  }),
                                                                  onExit:
                                                                      ((event) async {
                                                                    setState(() =>
                                                                        _model.mouseRegionHovered2 =
                                                                            false);
                                                                    if (animationsMap[
                                                                            'containerOnActionTriggerAnimation2'] !=
                                                                        null) {
                                                                      await animationsMap[
                                                                              'containerOnActionTriggerAnimation2']!
                                                                          .controller
                                                                          .reverse();
                                                                    }
                                                                  }),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        if (loggedIn) {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () {},
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: SizedBox(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.65,
                                                                                    child: RatingModalWidget(
                                                                                      profPage: detailedProfileUsersRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));
                                                                        } else {
                                                                          context
                                                                              .pushNamed('Login1');
                                                                        }
                                                                      },
                                                                      child:
                                                                          AnimatedContainer(
                                                                        duration:
                                                                            const Duration(milliseconds: 100),
                                                                        curve: Curves
                                                                            .elasticOut,
                                                                        width: MediaQuery.sizeOf(context).width -
                                                                            40.0,
                                                                        height:
                                                                            38.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                          boxShadow: const [
                                                                            BoxShadow(
                                                                              blurRadius: 4.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                2.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '78hcswp8' /* Leave a review */,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Noto Sans',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ).animateOnActionTrigger(
                                                                      animationsMap[
                                                                          'containerOnActionTriggerAnimation2']!,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(20.0,
                                                              30.0, 0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'f1yjope4' /* Descripcion */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              10.0, 0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      20.0,
                                                                      0.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        Text(
                                                                  valueOrDefault(
                                                                      detailedProfileUsersRecord
                                                                          .shortDescription,
                                                                      ''),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Noto Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              0.0, 20.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    20.0,
                                                                    40.0,
                                                                    0.0,
                                                                    0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'vj2nnfp7' /* Galería */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Noto Sans',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          if (currentUserUid ==
                                                              widget
                                                                  .userRef?.id)
                                                            Opacity(
                                                              opacity: 1.0,
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    final selectedMedia =
                                                                        await selectMediaWithSourceBottomSheet(
                                                                      context:
                                                                          context,
                                                                      maxWidth:
                                                                          500.00,
                                                                      imageQuality:
                                                                          56,
                                                                      allowPhoto:
                                                                          true,
                                                                    );
                                                                    if (selectedMedia !=
                                                                            null &&
                                                                        selectedMedia.every((m) => validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                      setState(() =>
                                                                          _model.isDataUploading1 =
                                                                              true);
                                                                      var selectedUploadedFiles =
                                                                          <FFUploadedFile>[];

                                                                      var downloadUrls =
                                                                          <String>[];
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

                                                                        downloadUrls = (await Future
                                                                                .wait(
                                                                          selectedMedia
                                                                              .map(
                                                                            (m) async =>
                                                                                await uploadData(m.storagePath, m.bytes),
                                                                          ),
                                                                        ))
                                                                            .where((u) =>
                                                                                u !=
                                                                                null)
                                                                            .map((u) =>
                                                                                u!)
                                                                            .toList();
                                                                      } finally {
                                                                        _model.isDataUploading1 =
                                                                            false;
                                                                      }
                                                                      if (selectedUploadedFiles.length ==
                                                                              selectedMedia
                                                                                  .length &&
                                                                          downloadUrls.length ==
                                                                              selectedMedia.length) {
                                                                        setState(
                                                                            () {
                                                                          _model.uploadedLocalFile1 =
                                                                              selectedUploadedFiles.first;
                                                                          _model.uploadedFileUrl1 =
                                                                              downloadUrls.first;
                                                                        });
                                                                      } else {
                                                                        setState(
                                                                            () {});
                                                                        return;
                                                                      }
                                                                    }

                                                                    var mediaRecordReference =
                                                                        MediaRecord
                                                                            .collection
                                                                            .doc();
                                                                    await mediaRecordReference
                                                                        .set(
                                                                            createMediaRecordData(
                                                                      userName:
                                                                          'dsgrrgre',
                                                                      mediaType:
                                                                          'photo',
                                                                      mediaUrl:
                                                                          _model
                                                                              .uploadedFileUrl1,
                                                                      user: widget
                                                                          .userRef,
                                                                    ));
                                                                    _model.uploadedMedia =
                                                                        MediaRecord.getDocumentFromData(
                                                                            createMediaRecordData(
                                                                              userName: 'dsgrrgre',
                                                                              mediaType: 'photo',
                                                                              mediaUrl: _model.uploadedFileUrl1,
                                                                              user: widget.userRef,
                                                                            ),
                                                                            mediaRecordReference);

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  text: "+",
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        30.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0,
                                                              10.0, 20.0, 0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                        height: 245.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  MediaRecord>>(
                                                            stream:
                                                                queryMediaRecord(
                                                              queryBuilder:
                                                                  (mediaRecord) =>
                                                                      mediaRecord
                                                                          .where(
                                                                'user',
                                                                isEqualTo: widget
                                                                    .userRef,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<MediaRecord>
                                                                  gridViewMediaRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                // onTap: () async {
                                                                //   final selectedMedia =
                                                                //       await selectMediaWithSourceBottomSheet(
                                                                //     context: context,
                                                                //     allowPhoto: true,
                                                                //   );
                                                                //   if (selectedMedia !=
                                                                //           null &&
                                                                //       selectedMedia.every((m) =>
                                                                //           validateFileFormat(
                                                                //               m.storagePath,
                                                                //               context))) {
                                                                //     setState(() =>
                                                                //         _model.isDataUploading2 =
                                                                //             true);
                                                                //     var selectedUploadedFiles =
                                                                //         <FFUploadedFile>[];

                                                                //     var downloadUrls =
                                                                //         <String>[];
                                                                //     try {
                                                                //       selectedUploadedFiles =
                                                                //           selectedMedia
                                                                //               .map((m) =>
                                                                //                   FFUploadedFile(
                                                                //                     name: m.storagePath.split('/').last,
                                                                //                     bytes: m.bytes,
                                                                //                     height: m.dimensions?.height,
                                                                //                     width: m.dimensions?.width,
                                                                //                     blurHash: m.blurHash,
                                                                //                   ))
                                                                //               .toList();

                                                                //       downloadUrls = (await Future
                                                                //               .wait(
                                                                //         selectedMedia
                                                                //             .map(
                                                                //           (m) async =>
                                                                //               await uploadData(
                                                                //                   m.storagePath,
                                                                //                   m.bytes),
                                                                //         ),
                                                                //       ))
                                                                //           .where((u) =>
                                                                //               u !=
                                                                //               null)
                                                                //           .map((u) =>
                                                                //               u!)
                                                                //           .toList();
                                                                //     } finally {
                                                                //       _model.isDataUploading2 =
                                                                //           false;
                                                                //     }
                                                                //     if (selectedUploadedFiles
                                                                //                 .length ==
                                                                //             selectedMedia
                                                                //                 .length &&
                                                                //         downloadUrls
                                                                //                 .length ==
                                                                //             selectedMedia
                                                                //                 .length) {
                                                                //       setState(() {
                                                                //         _model.uploadedLocalFile2 =
                                                                //             selectedUploadedFiles
                                                                //                 .first;
                                                                //         _model.uploadedFileUrl2 =
                                                                //             downloadUrls
                                                                //                 .first;
                                                                //       });
                                                                //     } else {
                                                                //       setState(() {});
                                                                //       return;
                                                                //     }
                                                                //   }

                                                                //   await MediaRecord
                                                                //       .collection
                                                                //       .doc()
                                                                //       .set(
                                                                //           createMediaRecordData(
                                                                //         userName: '',
                                                                //         mediaType:
                                                                //             'photo',
                                                                //         mediaUrl: _model
                                                                //             .uploadedFileUrl2,
                                                                //         user:
                                                                //             currentUserReference,
                                                                //       ));
                                                                // },
                                                                child: GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        3,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        1.0,
                                                                  ),
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      gridViewMediaRecordList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          gridViewIndex) {
                                                                    final gridViewMediaRecord =
                                                                        gridViewMediaRecordList[
                                                                            gridViewIndex];
                                                                    return ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8.0),
                                                                        child:
                                                                            InkWell(
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
                                                                                  image: CachedNetworkImage(
                                                                                    imageUrl: gridViewMediaRecord.mediaUrl,
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                  allowRotation: true,
                                                                                  tag: gridViewMediaRecord.mediaUrl + Random(2).toString(),
                                                                                  useHeroAnimation: true,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Hero(
                                                                            tag:
                                                                                gridViewMediaRecord.mediaUrl,
                                                                            transitionOnUserGestures:
                                                                                true,
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(12),
                                                                              child: Image.network(
                                                                                gridViewMediaRecord.mediaUrl,
                                                                                width: 300,
                                                                                height: 200,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ));
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  20.0,
                                                                  35.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'y62kzoqa' /* Reviews */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Noto Sans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(20.0,
                                                              5.0, 0.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    ReviewRecord>>(
                                                              stream:
                                                                  queryReviewRecord(
                                                                queryBuilder:
                                                                    (reviewRecord) =>
                                                                        reviewRecord
                                                                            .where(
                                                                  'reviewedRef',
                                                                  isEqualTo: widget
                                                                      .userRef,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
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
                                                                List<ReviewRecord>
                                                                    listViewReviewRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      listViewReviewRecordList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          listViewIndex) {
                                                                    final listViewReviewRecord =
                                                                        listViewReviewRecordList[
                                                                            listViewIndex];
                                                                    return Padding(
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            350.0,
                                                                        height:
                                                                            100.0,
                                                                        constraints:
                                                                            const BoxConstraints(
                                                                          maxWidth:
                                                                              1270.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: const [
                                                                            BoxShadow(
                                                                              blurRadius: 4.0,
                                                                              color: Color(0x230E151B),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                2.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional
                                                                              .fromSTEB(
                                                                              16.0,
                                                                              12.0,
                                                                              16.0,
                                                                              12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                              ))
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 100.7,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Visibility(
                                                                                      visible: responsiveVisibility(
                                                                                        context: context,
                                                                                        phone: false,
                                                                                        tablet: false,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(4.0),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                          child: CachedNetworkImage(
                                                                                            fadeInDuration: const Duration(milliseconds: 500),
                                                                                            fadeOutDuration: const Duration(milliseconds: 500),
                                                                                            imageUrl: 'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                                                                                            width: 90.0,
                                                                                            height: 90.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                              child: StreamBuilder<UsersRecord>(
                                                                                                stream: UsersRecord.getDocument(listViewReviewRecord.reviewerRef!),
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
                                                                                                  final textUsersRecord = snapshot.data!;
                                                                                                  return Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewReviewRecord.comment,
                                                                                                      'John Doe',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Noto Sans',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              "${listViewReviewRecord.createdTime!.day}/${listViewReviewRecord.createdTime!.month}",
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: 'Noto Sans',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Builder(builder: (context) {
                                                                                              if (kIsWeb) {
                                                                                                return Row(
                                                                                                    children: List.generate(
                                                                                                  5,
                                                                                                  (index) => InkWell(
                                                                                                    onTap: () async {},
                                                                                                    child: Icon(
                                                                                                      Icons.star_rounded,
                                                                                                      color: listViewReviewRecord.rating >= index.toDouble() + 1 ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).accent2,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ));
                                                                                              } else {
                                                                                                return StarsComponentWidget(
                                                                                                  key: Key('Keyspz_${listViewIndex}_of_${listViewReviewRecordList.length}'),
                                                                                                  parameter1: listViewReviewRecord.rating,
                                                                                                );
                                                                                              }
                                                                                            })
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 300.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            listViewReviewRecord.comment,
                                                                                            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual ',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: 'Noto Sans',
                                                                                                letterSpacing: 0.0,
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
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ]
                                                            .divide(
                                                                const SizedBox(
                                                                    height:
                                                                        12.0))
                                                            .around(
                                                                const SizedBox(
                                                                    height:
                                                                        12.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'containerOnPageLoadAnimation1']!),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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
