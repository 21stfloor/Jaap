import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'agency_ratingbar_model.dart';
export 'agency_ratingbar_model.dart';

class AgencyRatingbarWidget extends StatefulWidget {
  const AgencyRatingbarWidget({super.key});

  @override
  State<AgencyRatingbarWidget> createState() => _AgencyRatingbarWidgetState();
}

class _AgencyRatingbarWidgetState extends State<AgencyRatingbarWidget> {
  late AgencyRatingbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgencyRatingbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      onRatingUpdate: (newValue) =>
          setState(() => _model.ratingBarValue = newValue),
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterFlowTheme.of(context).warning,
      ),
      direction: Axis.horizontal,
      initialRating: _model.ratingBarValue ??= 3.0,
      unratedColor: FlutterFlowTheme.of(context).accent3,
      itemCount: 5,
      itemSize: 24.0,
      glowColor: FlutterFlowTheme.of(context).warning,
    );
  }
}
