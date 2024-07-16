import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/application_row/application_row_widget.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import 'listof_applicants_widget.dart' show ListofApplicantsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListofApplicantsModel extends FlutterFlowModel<ListofApplicantsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel1;
  // Models for applicationRow dynamic component.
  late FlutterFlowDynamicModels<ApplicationRowModel> applicationRowModels;
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel2;

  @override
  void initState(BuildContext context) {
    sideNavAgencyModel1 = createModel(context, () => SideNavAgencyModel());
    applicationRowModels =
        FlutterFlowDynamicModels(() => ApplicationRowModel());
    sideNavAgencyModel2 = createModel(context, () => SideNavAgencyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavAgencyModel1.dispose();
    applicationRowModels.dispose();
    sideNavAgencyModel2.dispose();
  }
}
