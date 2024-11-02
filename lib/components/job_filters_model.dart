import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'job_filters_widget.dart' show JobFiltersWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JobFiltersModel extends FlutterFlowModel<JobFiltersWidget> {
  ///  Local state fields for this component.

  List<String> companySelections = ['Hello World'];
  void addToCompanySelections(String item) => companySelections.add(item);
  void removeFromCompanySelections(String item) =>
      companySelections.remove(item);
  void removeAtIndexFromCompanySelections(int index) =>
      companySelections.removeAt(index);
  void insertAtIndexInCompanySelections(int index, String item) =>
      companySelections.insert(index, item);
  void updateCompanySelectionsAtIndex(int index, Function(String) updateFn) =>
      companySelections[index] = updateFn(companySelections[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in jobFilters widget.
  List<AgencyPofileRecord>? allCompanies;
  // State field(s) for countryDropDown widget.
  List<String>? countryDropDownValue;
  FormFieldController<List<String>>? countryDropDownValueController;
  // State field(s) for jobTypeDropDown widget.
  List<String>? jobTypeDropDownValue;
  FormFieldController<List<String>>? jobTypeDropDownValueController;
  // State field(s) for companyDropDown widget.
  List<String>? companyDropDownValue;
  FormFieldController<List<String>>? companyDropDownValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
