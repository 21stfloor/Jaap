import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_group_threads/empty_state_simple/empty_state_simple_widget.dart';
import '/components/payment_dialog_applicant_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web_app_template/agency/agency_profile_view_component/agency_profile_view_component_widget.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import 'job_list_widget.dart' show JobListWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class JobListModel extends FlutterFlowModel<JobListWidget> {
  ///  Local state fields for this page.

  List<JobRecord> jobListResult = [];
  void addToJobListResult(JobRecord item) => jobListResult.add(item);
  void removeFromJobListResult(JobRecord item) => jobListResult.remove(item);
  void removeAtIndexFromJobListResult(int index) =>
      jobListResult.removeAt(index);
  void insertAtIndexInJobListResult(int index, JobRecord item) =>
      jobListResult.insert(index, item);
  void updateJobListResultAtIndex(int index, Function(JobRecord) updateFn) =>
      jobListResult[index] = updateFn(jobListResult[index]);

  List<String> regionSelected = [];
  void addToRegionSelected(String item) => regionSelected.add(item);
  void removeFromRegionSelected(String item) => regionSelected.remove(item);
  void removeAtIndexFromRegionSelected(int index) =>
      regionSelected.removeAt(index);
  void insertAtIndexInRegionSelected(int index, String item) =>
      regionSelected.insert(index, item);
  void updateRegionSelectedAtIndex(int index, Function(String) updateFn) =>
      regionSelected[index] = updateFn(regionSelected[index]);

  List<PaymentsRecord> boostedPosts = [];
  void addToBoostedPosts(PaymentsRecord item) => boostedPosts.add(item);
  void removeFromBoostedPosts(PaymentsRecord item) => boostedPosts.remove(item);
  void removeAtIndexFromBoostedPosts(int index) => boostedPosts.removeAt(index);
  void insertAtIndexInBoostedPosts(int index, PaymentsRecord item) =>
      boostedPosts.insert(index, item);
  void updateBoostedPostsAtIndex(
          int index, Function(PaymentsRecord) updateFn) =>
      boostedPosts[index] = updateFn(boostedPosts[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in JobList widget.
  List<JobRecord>? allVisibleJobs;
  // Stores action output result for [Firestore Query - Query a collection] action in JobList widget.
  List<PaymentsRecord>? allBoostedPost;
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel1;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<JobRecord>? updatedAllVisibleJobWorld;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<JobRecord>? updatedAllVisibleJobAsia;
  List<JobRecord> simpleSearchResults = [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel2;

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel1 =
        createModel(context, () => SideNavApplicantsModel());
    sideNavApplicantsModel2 =
        createModel(context, () => SideNavApplicantsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavApplicantsModel1.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();

    sideNavApplicantsModel2.dispose();
  }
}
