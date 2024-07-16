import '/backend/backend.dart';
import '/components/video_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import 'video_page_widget.dart' show VideoPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VideoPageModel extends FlutterFlowModel<VideoPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel;
  // Models for videoComponent dynamic component.
  late FlutterFlowDynamicModels<VideoComponentModel> videoComponentModels;
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel;

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel =
        createModel(context, () => SideNavApplicantsModel());
    videoComponentModels =
        FlutterFlowDynamicModels(() => VideoComponentModel());
    sideNavAgencyModel = createModel(context, () => SideNavAgencyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavApplicantsModel.dispose();
    videoComponentModels.dispose();
    sideNavAgencyModel.dispose();
  }
}
