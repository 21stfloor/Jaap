import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/agency_ratingbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel1;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel2;

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel1 =
        createModel(context, () => SideNavApplicantsModel());
    sideNavApplicantsModel2 =
        createModel(context, () => SideNavApplicantsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavApplicantsModel1.dispose();
    sideNavApplicantsModel2.dispose();
  }
}
