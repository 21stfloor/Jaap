import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import 'editprofileapplicant_widget.dart' show EditprofileapplicantWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditprofileapplicantModel
    extends FlutterFlowModel<EditprofileapplicantWidget> {
  ///  Local state fields for this page.

  String? profilePic =
      'https://firebasestorage.googleapis.com/v0/b/jaap-h3fa31.appspot.com/o/449133811_969639548177226_1356168894052321592_n%20(1).jpg?alt=media&token=41943bb5-d21d-42a4-873b-961dbcfb5091';

  DateTime? birthday;

  String? uploadedResume;

  String? uploadedCertification;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in editprofileapplicant widget.
  AppllicantProfileRecord? existingApplicantProfile;
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for fullnameField widget.
  FocusNode? fullnameFieldFocusNode;
  TextEditingController? fullnameFieldTextController;
  String? Function(BuildContext, String?)? fullnameFieldTextControllerValidator;
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for birthplaceField widget.
  FocusNode? birthplaceFieldFocusNode;
  TextEditingController? birthplaceFieldTextController;
  String? Function(BuildContext, String?)?
      birthplaceFieldTextControllerValidator;
  // State field(s) for addressField widget.
  FocusNode? addressFieldFocusNode;
  TextEditingController? addressFieldTextController;
  String? Function(BuildContext, String?)? addressFieldTextControllerValidator;
  // State field(s) for bioField widget.
  FocusNode? bioFieldFocusNode;
  TextEditingController? bioFieldTextController;
  String? Function(BuildContext, String?)? bioFieldTextControllerValidator;
  // State field(s) for phoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for certificationField widget.
  FocusNode? certificationFieldFocusNode;
  TextEditingController? certificationFieldTextController;
  String? Function(BuildContext, String?)?
      certificationFieldTextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? isValid;

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel =
        createModel(context, () => SideNavApplicantsModel());
  }

  @override
  void dispose() {
    sideNavApplicantsModel.dispose();
    fullnameFieldFocusNode?.dispose();
    fullnameFieldTextController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    birthplaceFieldFocusNode?.dispose();
    birthplaceFieldTextController?.dispose();

    addressFieldFocusNode?.dispose();
    addressFieldTextController?.dispose();

    bioFieldFocusNode?.dispose();
    bioFieldTextController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldTextController?.dispose();

    certificationFieldFocusNode?.dispose();
    certificationFieldTextController?.dispose();
  }
}
