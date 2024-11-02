import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/admin/sidebar_admin/sidebar_admin_widget.dart';
import 'notification_admin_widget.dart' show NotificationAdminWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationAdminModel extends FlutterFlowModel<NotificationAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sidebarAdmin component.
  late SidebarAdminModel sidebarAdminModel1;
  // Model for sidebarAdmin component.
  late SidebarAdminModel sidebarAdminModel2;

  @override
  void initState(BuildContext context) {
    sidebarAdminModel1 = createModel(context, () => SidebarAdminModel());
    sidebarAdminModel2 = createModel(context, () => SidebarAdminModel());
  }

  @override
  void dispose() {
    sidebarAdminModel1.dispose();
    sidebarAdminModel2.dispose();
  }
}
