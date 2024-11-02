import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/admin/sidebar_admin/sidebar_admin_widget.dart';
import 'admin_settings_widget.dart' show AdminSettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminSettingsModel extends FlutterFlowModel<AdminSettingsWidget> {
  ///  Local state fields for this page.

  double boostingPrice = 50.0;

  double applicantSubscriptionPrice = 199.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in adminSettings widget.
  PricesRecord? existingAgencyPriceCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in adminSettings widget.
  PricesRecord? existingApplicantPriceCopy;
  // Model for sidebarAdmin component.
  late SidebarAdminModel sidebarAdminModel;
  // State field(s) for boostingPrice widget.
  FocusNode? boostingPriceFocusNode;
  TextEditingController? boostingPriceTextController;
  String? Function(BuildContext, String?)? boostingPriceTextControllerValidator;
  // State field(s) for applicantPrice widget.
  FocusNode? applicantPriceFocusNode;
  TextEditingController? applicantPriceTextController;
  String? Function(BuildContext, String?)?
      applicantPriceTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PricesRecord? existingAgencyPrice;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PricesRecord? existingApplicantPrice;

  @override
  void initState(BuildContext context) {
    sidebarAdminModel = createModel(context, () => SidebarAdminModel());
  }

  @override
  void dispose() {
    sidebarAdminModel.dispose();
    boostingPriceFocusNode?.dispose();
    boostingPriceTextController?.dispose();

    applicantPriceFocusNode?.dispose();
    applicantPriceTextController?.dispose();
  }
}
