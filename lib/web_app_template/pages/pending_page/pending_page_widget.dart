import '/components/pendingpage_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pending_page_model.dart';
export 'pending_page_model.dart';

class PendingPageWidget extends StatefulWidget {
  const PendingPageWidget({super.key});

  @override
  State<PendingPageWidget> createState() => _PendingPageWidgetState();
}

class _PendingPageWidgetState extends State<PendingPageWidget> {
  late PendingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PendingPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: wrapWithModel(
              model: _model.pendingpageModel,
              updateCallback: () => safeSetState(() {}),
              child: PendingpageWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
