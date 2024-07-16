import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_nav_agency_widget.dart' show SideNavAgencyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideNavAgencyModel extends FlutterFlowModel<SideNavAgencyWidget> {
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
