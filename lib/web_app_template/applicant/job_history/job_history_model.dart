import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/review_agency_component/review_agency_component_widget.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import 'job_history_widget.dart' show JobHistoryWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JobHistoryModel extends FlutterFlowModel<JobHistoryWidget> {
  ///  Local state fields for this page.

  String? postImage;

  ///  State fields for stateful widgets in this page.

  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel;

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel =
        createModel(context, () => SideNavApplicantsModel());
  }

  @override
  void dispose() {
    sideNavApplicantsModel.dispose();
  }
}
