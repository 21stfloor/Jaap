import '/components/pendingpage_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pending_page_widget.dart' show PendingPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PendingPageModel extends FlutterFlowModel<PendingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for pendingpage component.
  late PendingpageModel pendingpageModel;

  @override
  void initState(BuildContext context) {
    pendingpageModel = createModel(context, () => PendingpageModel());
  }

  @override
  void dispose() {
    pendingpageModel.dispose();
  }
}
