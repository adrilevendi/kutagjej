import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_folder/delete_chats_prompt/delete_chats_prompt_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'list11_messages_widget.dart' show List11MessagesWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class List11MessagesModel extends FlutterFlowModel<List11MessagesWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> selectedChats = [];
  void addToSelectedChats(DocumentReference item) => selectedChats.add(item);
  void removeFromSelectedChats(DocumentReference item) =>
      selectedChats.remove(item);
  void removeAtIndexFromSelectedChats(int index) =>
      selectedChats.removeAt(index);
  void insertAtIndexInSelectedChats(int index, DocumentReference item) =>
      selectedChats.insert(index, item);
  void updateSelectedChatsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedChats[index] = updateFn(selectedChats[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
