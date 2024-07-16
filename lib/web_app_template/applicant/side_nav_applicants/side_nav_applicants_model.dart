import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'side_nav_applicants_widget.dart' show SideNavApplicantsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideNavApplicantsModel extends FlutterFlowModel<SideNavApplicantsWidget> {
  ///  Local state fields for this component.

  RatingStruct? ratingData;
  void updateRatingDataStruct(Function(RatingStruct) updateFn) {
    updateFn(ratingData ??= RatingStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
