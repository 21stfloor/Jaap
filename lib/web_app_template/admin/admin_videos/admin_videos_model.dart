import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/admin/sidebar_admin/sidebar_admin_widget.dart';
import 'admin_videos_widget.dart' show AdminVideosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminVideosModel extends FlutterFlowModel<AdminVideosWidget> {
  ///  Local state fields for this page.

  List<VideoPostRecord> filteredVideoList = [];
  void addToFilteredVideoList(VideoPostRecord item) =>
      filteredVideoList.add(item);
  void removeFromFilteredVideoList(VideoPostRecord item) =>
      filteredVideoList.remove(item);
  void removeAtIndexFromFilteredVideoList(int index) =>
      filteredVideoList.removeAt(index);
  void insertAtIndexInFilteredVideoList(int index, VideoPostRecord item) =>
      filteredVideoList.insert(index, item);
  void updateFilteredVideoListAtIndex(
          int index, Function(VideoPostRecord) updateFn) =>
      filteredVideoList[index] = updateFn(filteredVideoList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in adminVideos widget.
  List<VideoPostRecord>? allVideos;
  // Model for sidebarAdmin component.
  late SidebarAdminModel sidebarAdminModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<VideoPostRecord>();

  @override
  void initState(BuildContext context) {
    sidebarAdminModel = createModel(context, () => SidebarAdminModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sidebarAdminModel.dispose();
  }
}