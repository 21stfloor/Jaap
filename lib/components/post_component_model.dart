import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_component_widget.dart' show PostComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostComponentModel extends FlutterFlowModel<PostComponentWidget> {
  ///  Local state fields for this component.

  int likes = 0;

  bool iLikedThis = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
