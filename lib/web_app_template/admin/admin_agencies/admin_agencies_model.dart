import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comments_to_employer_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/admin/sidebar_admin/sidebar_admin_widget.dart';
import 'admin_agencies_widget.dart' show AdminAgenciesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AdminAgenciesModel extends FlutterFlowModel<AdminAgenciesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sidebarAdmin component.
  late SidebarAdminModel sidebarAdminModel;

  @override
  void initState(BuildContext context) {
    sidebarAdminModel = createModel(context, () => SidebarAdminModel());
  }

  @override
  void dispose() {
    sidebarAdminModel.dispose();
  }
}
