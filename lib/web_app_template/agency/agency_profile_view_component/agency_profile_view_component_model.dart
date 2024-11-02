import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comments_to_employer_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'agency_profile_view_component_widget.dart'
    show AgencyProfileViewComponentWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AgencyProfileViewComponentModel
    extends FlutterFlowModel<AgencyProfileViewComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for commentsToEmployer component.
  late CommentsToEmployerModel commentsToEmployerModel;

  @override
  void initState(BuildContext context) {
    commentsToEmployerModel =
        createModel(context, () => CommentsToEmployerModel());
  }

  @override
  void dispose() {
    commentsToEmployerModel.dispose();
  }
}
