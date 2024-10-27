import '/flutter_flow/flutter_flow_util.dart';
import 'list11_messages_widget.dart' show List11MessagesWidget;
import 'package:flutter/material.dart';

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
