import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import 'editprofile_agency_widget.dart' show EditprofileAgencyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditprofileAgencyModel extends FlutterFlowModel<EditprofileAgencyWidget> {
  ///  Local state fields for this page.

  String? profilePic;

  String? certificateUploaded;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in editprofileAgency widget.
  AgencyPofileRecord? agencyProfile;
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel1;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for editDisplayNAme widget.
  FocusNode? editDisplayNAmeFocusNode;
  TextEditingController? editDisplayNAmeTextController;
  String? Function(BuildContext, String?)?
      editDisplayNAmeTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for aboutUsTextField widget.
  FocusNode? aboutUsTextFieldFocusNode;
  TextEditingController? aboutUsTextFieldTextController;
  String? Function(BuildContext, String?)?
      aboutUsTextFieldTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel2;

  @override
  void initState(BuildContext context) {
    sideNavAgencyModel1 = createModel(context, () => SideNavAgencyModel());
    sideNavAgencyModel2 = createModel(context, () => SideNavAgencyModel());
  }

  @override
  void dispose() {
    sideNavAgencyModel1.dispose();
    editDisplayNAmeFocusNode?.dispose();
    editDisplayNAmeTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    aboutUsTextFieldFocusNode?.dispose();
    aboutUsTextFieldTextController?.dispose();

    sideNavAgencyModel2.dispose();
  }
}
