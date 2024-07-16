import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  Local state fields for this page.

  String? postImage;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel;
  // State field(s) for titleTextField widget.
  FocusNode? titleTextFieldFocusNode;
  TextEditingController? titleTextFieldTextController;
  String? Function(BuildContext, String?)?
      titleTextFieldTextControllerValidator;
  String? _titleTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5sxu8y8y' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for descriptionTextField widget.
  FocusNode? descriptionTextFieldFocusNode;
  TextEditingController? descriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldTextControllerValidator;
  String? _descriptionTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n248ccji' /* Field is required */,
      );
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel =
        createModel(context, () => SideNavApplicantsModel());
    titleTextFieldTextControllerValidator =
        _titleTextFieldTextControllerValidator;
    descriptionTextFieldTextControllerValidator =
        _descriptionTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavApplicantsModel.dispose();
    titleTextFieldFocusNode?.dispose();
    titleTextFieldTextController?.dispose();

    descriptionTextFieldFocusNode?.dispose();
    descriptionTextFieldTextController?.dispose();
  }
}
