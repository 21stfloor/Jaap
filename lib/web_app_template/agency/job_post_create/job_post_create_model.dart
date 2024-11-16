import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'job_post_create_widget.dart' show JobPostCreateWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JobPostCreateModel extends FlutterFlowModel<JobPostCreateWidget> {
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
        'jmpcnf6e' /* Field is required */,
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
        'rifr53dj' /* Field is required */,
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
        'if76ulha' /* Field is required */,
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
        'ag7vcud2' /* Field is required */,
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
        's806rtbi' /* Field is required */,
      );
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for regionDropDown widget.
  String? regionDropDownValue;
  FormFieldController<String>? regionDropDownValueController;
  // State field(s) for jobTypeDropDown widget.
  String? jobTypeDropDownValue;
  FormFieldController<String>? jobTypeDropDownValueController;
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
