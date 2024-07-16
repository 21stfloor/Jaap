import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'applicant_profile_view_component_widget.dart'
    show ApplicantProfileViewComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApplicantProfileViewComponentModel
    extends FlutterFlowModel<ApplicantProfileViewComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? createdChat;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  HiredApplicationsRecord? hiredApplicationDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
