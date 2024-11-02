import '/backend/backend.dart';
import '/components/post_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import 'community_page_widget.dart' show CommunityPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommunityPageModel extends FlutterFlowModel<CommunityPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel1;
  // Models for postComponent dynamic component.
  late FlutterFlowDynamicModels<PostComponentModel> postComponentModels;
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel2;

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel1 =
        createModel(context, () => SideNavApplicantsModel());
    postComponentModels = FlutterFlowDynamicModels(() => PostComponentModel());
    sideNavApplicantsModel2 =
        createModel(context, () => SideNavApplicantsModel());
  }

  @override
  void dispose() {
    sideNavApplicantsModel1.dispose();
    postComponentModels.dispose();
    sideNavApplicantsModel2.dispose();
  }
}
