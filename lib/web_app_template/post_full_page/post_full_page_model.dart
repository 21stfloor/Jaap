import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comment_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import '/web_app_template/applicant/side_nav_geust/side_nav_geust_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'post_full_page_widget.dart' show PostFullPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PostFullPageModel extends FlutterFlowModel<PostFullPageWidget> {
  ///  Local state fields for this page.

  int likes = 0;

  PostRecord? postDoc;

  int numComments = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCurrentUrl] action in PostFullPage widget.
  String? currentPageLink;
  // Stores action output result for [Backend Call - Read Document] action in PostFullPage widget.
  PostRecord? postDocResult;
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel1;
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel1;
  // Model for sideNavGeust component.
  late SideNavGeustModel sideNavGeustModel1;
  // Stores action output result for [Custom Action - getCurrentUrl] action in IconButton widget.
  String? postLink;
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel2;
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel2;
  // Model for sideNavGeust component.
  late SideNavGeustModel sideNavGeustModel2;

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel1 =
        createModel(context, () => SideNavApplicantsModel());
    sideNavAgencyModel1 = createModel(context, () => SideNavAgencyModel());
    sideNavGeustModel1 = createModel(context, () => SideNavGeustModel());
    sideNavApplicantsModel2 =
        createModel(context, () => SideNavApplicantsModel());
    sideNavAgencyModel2 = createModel(context, () => SideNavAgencyModel());
    sideNavGeustModel2 = createModel(context, () => SideNavGeustModel());
  }

  @override
  void dispose() {
    sideNavApplicantsModel1.dispose();
    sideNavAgencyModel1.dispose();
    sideNavGeustModel1.dispose();
    sideNavApplicantsModel2.dispose();
    sideNavAgencyModel2.dispose();
    sideNavGeustModel2.dispose();
  }
}
