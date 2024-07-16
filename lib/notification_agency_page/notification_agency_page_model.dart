import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import 'notification_agency_page_widget.dart' show NotificationAgencyPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationAgencyPageModel
    extends FlutterFlowModel<NotificationAgencyPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel1;
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel2;

  @override
  void initState(BuildContext context) {
    sideNavAgencyModel1 = createModel(context, () => SideNavAgencyModel());
    sideNavAgencyModel2 = createModel(context, () => SideNavAgencyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavAgencyModel1.dispose();
    sideNavAgencyModel2.dispose();
  }
}
