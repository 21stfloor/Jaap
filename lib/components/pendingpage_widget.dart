import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pendingpage_model.dart';
export 'pendingpage_model.dart';

class PendingpageWidget extends StatefulWidget {
  const PendingpageWidget({super.key});

  @override
  State<PendingpageWidget> createState() => _PendingpageWidgetState();
}

class _PendingpageWidgetState extends State<PendingpageWidget> {
  late PendingpageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PendingpageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'sjlherlh' /* thank you for choosing JAAP ju... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'pv4bncj3' /* 
we will send the confirmation... */
                        ,
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        '3m1ospz8' /* Email */,
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'u1wypw6b' /* 
thank you very much */
                        ,
                      ),
                      style: TextStyle(),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                      ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
