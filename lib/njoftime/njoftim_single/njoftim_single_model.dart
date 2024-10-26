import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'njoftim_single_widget.dart' show NjoftimSingleWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NjoftimSingleModel extends FlutterFlowModel<NjoftimSingleWidget> {
  ///  State fields for stateful widgets in this page.
// Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? existingChat;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? createdChat;
  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
