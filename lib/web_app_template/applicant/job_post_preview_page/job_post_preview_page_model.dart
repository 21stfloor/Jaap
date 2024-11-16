import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/agency_profile_view_component/agency_profile_view_component_widget.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import '/web_app_template/applicant/side_nav_geust/side_nav_geust_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'job_post_preview_page_widget.dart' show JobPostPreviewPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class JobPostPreviewPageModel
    extends FlutterFlowModel<JobPostPreviewPageWidget> {
  ///  Local state fields for this page.

  UsersRecord? agency;

  ///  State fields for stateful widgets in this page.

  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel1;
  // Model for sideNavGeust component.
  late SideNavGeustModel sideNavGeustModel1;
  String currentPageLink = '';
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel2;
  // Model for sideNavGeust component.
  late SideNavGeustModel sideNavGeustModel2;

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel1 =
        createModel(context, () => SideNavApplicantsModel());
    sideNavGeustModel1 = createModel(context, () => SideNavGeustModel());
    sideNavApplicantsModel2 =
        createModel(context, () => SideNavApplicantsModel());
    sideNavGeustModel2 = createModel(context, () => SideNavGeustModel());
  }

  @override
  void dispose() {
    sideNavApplicantsModel1.dispose();
    sideNavGeustModel1.dispose();
    sideNavApplicantsModel2.dispose();
    sideNavGeustModel2.dispose();
  }
}
