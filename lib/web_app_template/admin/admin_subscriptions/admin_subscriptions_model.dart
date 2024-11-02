import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/admin/sidebar_admin/sidebar_admin_widget.dart';
import 'admin_subscriptions_widget.dart' show AdminSubscriptionsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminSubscriptionsModel
    extends FlutterFlowModel<AdminSubscriptionsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sidebarAdmin component.
  late SidebarAdminModel sidebarAdminModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    sidebarAdminModel = createModel(context, () => SidebarAdminModel());
  }

  @override
  void dispose() {
    sidebarAdminModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
