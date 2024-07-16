import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'payment_dialog_applicant_widget.dart' show PaymentDialogApplicantWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PaymentDialogApplicantModel
    extends FlutterFlowModel<PaymentDialogApplicantWidget> {
  ///  Local state fields for this component.

  double price = 199.0;

  String paymentMethodSelected = 'gcash';

  bool gcashToggle = false;

  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in paymentDialogApplicant widget.
  PricesRecord? currentApplicantPrice;
  // State field(s) for cardNumber widget.
  FocusNode? cardNumberFocusNode;
  TextEditingController? cardNumberTextController;
  final cardNumberMask = MaskTextInputFormatter(mask: '#### #### #### ####');
  String? Function(BuildContext, String?)? cardNumberTextControllerValidator;
  String? _cardNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hzmfx47s' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for cardDate widget.
  FocusNode? cardDateFocusNode;
  TextEditingController? cardDateTextController;
  final cardDateMask = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? cardDateTextControllerValidator;
  String? _cardDateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hqxpt1h6' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for cardCVV widget.
  FocusNode? cardCVVFocusNode;
  TextEditingController? cardCVVTextController;
  final cardCVVMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? cardCVVTextControllerValidator;
  String? _cardCVVTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hzmfx47s' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for gcashNumber widget.
  FocusNode? gcashNumberFocusNode;
  TextEditingController? gcashNumberTextController;
  String? Function(BuildContext, String?)? gcashNumberTextControllerValidator;
  String? _gcashNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'otwen5re' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    cardNumberTextControllerValidator = _cardNumberTextControllerValidator;
    cardDateTextControllerValidator = _cardDateTextControllerValidator;
    cardCVVTextControllerValidator = _cardCVVTextControllerValidator;
    gcashNumberTextControllerValidator = _gcashNumberTextControllerValidator;
  }

  @override
  void dispose() {
    cardNumberFocusNode?.dispose();
    cardNumberTextController?.dispose();

    cardDateFocusNode?.dispose();
    cardDateTextController?.dispose();

    cardCVVFocusNode?.dispose();
    cardCVVTextController?.dispose();

    gcashNumberFocusNode?.dispose();
    gcashNumberTextController?.dispose();
  }
}
