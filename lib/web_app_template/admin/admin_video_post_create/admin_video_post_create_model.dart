import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/web_app_template/admin/sidebar_admin/sidebar_admin_widget.dart';
import 'admin_video_post_create_widget.dart' show AdminVideoPostCreateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminVideoPostCreateModel
    extends FlutterFlowModel<AdminVideoPostCreateWidget> {
  ///  Local state fields for this page.

  String? uploadedThumbnail;

  String? uploadedVideo;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sidebarAdmin component.
  late SidebarAdminModel sidebarAdminModel1;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'aefsdg0k' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ymvdzxzd' /* Field is required */,
      );
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Model for sidebarAdmin component.
  late SidebarAdminModel sidebarAdminModel2;

  @override
  void initState(BuildContext context) {
    sidebarAdminModel1 = createModel(context, () => SidebarAdminModel());
    titleTextControllerValidator = _titleTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    sidebarAdminModel2 = createModel(context, () => SidebarAdminModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sidebarAdminModel1.dispose();
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    sidebarAdminModel2.dispose();
  }
}
