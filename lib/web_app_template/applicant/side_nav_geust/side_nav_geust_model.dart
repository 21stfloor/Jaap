import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_nav_geust_widget.dart' show SideNavGeustWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SideNavGeustModel extends FlutterFlowModel<SideNavGeustWidget> {
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
