import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import 'profile_agency_widget.dart' show ProfileAgencyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileAgencyModel extends FlutterFlowModel<ProfileAgencyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel;

  @override
  void initState(BuildContext context) {
    sideNavAgencyModel = createModel(context, () => SideNavAgencyModel());
  }

  @override
  void dispose() {
    sideNavAgencyModel.dispose();
  }
}
