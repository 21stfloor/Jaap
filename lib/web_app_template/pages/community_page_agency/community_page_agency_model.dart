import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import 'community_page_agency_widget.dart' show CommunityPageAgencyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommunityPageAgencyModel
    extends FlutterFlowModel<CommunityPageAgencyWidget> {
  ///  State fields for stateful widgets in this page.

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
    sideNavAgencyModel1.dispose();
    sideNavAgencyModel2.dispose();
  }
}
