import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'review_applicant_component_widget.dart'
    show ReviewApplicantComponentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReviewApplicantComponentModel
    extends FlutterFlowModel<ReviewApplicantComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;
  String? _noteTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5iu3slk7' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserRatingsRecord? existingRatingRecord;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserRatingsRecord? createdUserRatingRecord;

  @override
  void initState(BuildContext context) {
    noteTextControllerValidator = _noteTextControllerValidator;
  }

  @override
  void dispose() {
    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
