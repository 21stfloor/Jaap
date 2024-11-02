import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web_app_template/agency/payment_dialog_agency/payment_dialog_agency_widget.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'job_post_edit_widget.dart' show JobPostEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JobPostEditModel extends FlutterFlowModel<JobPostEditWidget> {
  ///  Local state fields for this page.

  DocumentReference? agency;

  int iterator = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel1;
  // State field(s) for jobTitle widget.
  FocusNode? jobTitleFocusNode;
  TextEditingController? jobTitleTextController;
  String? Function(BuildContext, String?)? jobTitleTextControllerValidator;
  String? _jobTitleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6caumz4v' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for jobDescription widget.
  FocusNode? jobDescriptionFocusNode;
  TextEditingController? jobDescriptionTextController;
  String? Function(BuildContext, String?)?
      jobDescriptionTextControllerValidator;
  String? _jobDescriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hzmfx47s' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  String? _locationTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4gsb2g34' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for skills widget.
  FocusNode? skillsFocusNode;
  TextEditingController? skillsTextController;
  String? Function(BuildContext, String?)? skillsTextControllerValidator;
  String? _skillsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'sac3vlz9' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Salary widget.
  FocusNode? salaryFocusNode;
  TextEditingController? salaryTextController;
  String? Function(BuildContext, String?)? salaryTextControllerValidator;
  String? _salaryTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gbdtq4gm' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for regionDropDown widget.
  String? regionDropDownValue;
  FormFieldController<String>? regionDropDownValueController;
  // State field(s) for jobTypeDropDown widget.
  String? jobTypeDropDownValue;
  FormFieldController<String>? jobTypeDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PaymentsRecord>? allBoostedPost;
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel2;

  @override
  void initState(BuildContext context) {
    sideNavAgencyModel1 = createModel(context, () => SideNavAgencyModel());
    jobTitleTextControllerValidator = _jobTitleTextControllerValidator;
    jobDescriptionTextControllerValidator =
        _jobDescriptionTextControllerValidator;
    locationTextControllerValidator = _locationTextControllerValidator;
    skillsTextControllerValidator = _skillsTextControllerValidator;
    salaryTextControllerValidator = _salaryTextControllerValidator;
    sideNavAgencyModel2 = createModel(context, () => SideNavAgencyModel());
  }

  @override
  void dispose() {
    sideNavAgencyModel1.dispose();
    jobTitleFocusNode?.dispose();
    jobTitleTextController?.dispose();

    jobDescriptionFocusNode?.dispose();
    jobDescriptionTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    skillsFocusNode?.dispose();
    skillsTextController?.dispose();

    salaryFocusNode?.dispose();
    salaryTextController?.dispose();

    sideNavAgencyModel2.dispose();
  }
}
