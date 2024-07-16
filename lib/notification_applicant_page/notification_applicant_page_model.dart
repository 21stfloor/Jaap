import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import 'notification_applicant_page_widget.dart'
    show NotificationApplicantPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationApplicantPageModel
    extends FlutterFlowModel<NotificationApplicantPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel1;
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel2;

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel1 =
        createModel(context, () => SideNavApplicantsModel());
    sideNavApplicantsModel2 =
        createModel(context, () => SideNavApplicantsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavApplicantsModel1.dispose();
    sideNavApplicantsModel2.dispose();
  }
}
