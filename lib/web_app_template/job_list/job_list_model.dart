import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/chat_group_threads/empty_state_simple/empty_state_simple_widget.dart';
import '/components/empty_result_widget.dart';
import '/components/job_filters_widget.dart';
import '/components/payment_dialog_applicant_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/agency_profile_view_component/agency_profile_view_component_widget.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import '/web_app_template/applicant/side_nav_geust/side_nav_geust_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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

  List<PaymentsRecord> boostedPosts = [];
  void addToBoostedPosts(PaymentsRecord item) => boostedPosts.add(item);
  void removeFromBoostedPosts(PaymentsRecord item) => boostedPosts.remove(item);
  void removeAtIndexFromBoostedPosts(int index) => boostedPosts.removeAt(index);
  void insertAtIndexInBoostedPosts(int index, PaymentsRecord item) =>
      boostedPosts.insert(index, item);
  void updateBoostedPostsAtIndex(
          int index, Function(PaymentsRecord) updateFn) =>
      boostedPosts[index] = updateFn(boostedPosts[index]);

  JobFilterStruct? filterData;
  void updateFilterDataStruct(Function(JobFilterStruct) updateFn) {
    updateFn(filterData ??= JobFilterStruct());
  }

  bool hasFilter = false;

  List<String> filteredAgencies = [];
  void addToFilteredAgencies(String item) => filteredAgencies.add(item);
  void removeFromFilteredAgencies(String item) => filteredAgencies.remove(item);
  void removeAtIndexFromFilteredAgencies(int index) =>
      filteredAgencies.removeAt(index);
  void insertAtIndexInFilteredAgencies(int index, String item) =>
      filteredAgencies.insert(index, item);
  void updateFilteredAgenciesAtIndex(int index, Function(String) updateFn) =>
      filteredAgencies[index] = updateFn(filteredAgencies[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in JobList widget.
  List<JobRecord>? jobListVisible;
  // Stores action output result for [Firestore Query - Query a collection] action in JobList widget.
  List<PaymentsRecord>? boostedPostVisible;
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel1;
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel1;
  // Model for sideNavGeust component.
  late SideNavGeustModel sideNavGeustModel1;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  List<JobRecord> simpleSearchResults = [];
  // Stores action output result for [Bottom Sheet - jobFilters] action in filterButton widget.
  JobFilterStruct? filterResult;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for emptyResult component.
  late EmptyResultModel emptyResultModel;
  // Model for sideNavApplicants component.
  late SideNavApplicantsModel sideNavApplicantsModel2;
  // Model for sideNavAgency component.
  late SideNavAgencyModel sideNavAgencyModel2;
  // Model for sideNavGeust component.
  late SideNavGeustModel sideNavGeustModel2;

  @override
  void initState(BuildContext context) {
    sideNavApplicantsModel1 =
        createModel(context, () => SideNavApplicantsModel());
    sideNavAgencyModel1 = createModel(context, () => SideNavAgencyModel());
    sideNavGeustModel1 = createModel(context, () => SideNavGeustModel());
    emptyResultModel = createModel(context, () => EmptyResultModel());
    sideNavApplicantsModel2 =
        createModel(context, () => SideNavApplicantsModel());
    sideNavAgencyModel2 = createModel(context, () => SideNavAgencyModel());
    sideNavGeustModel2 = createModel(context, () => SideNavGeustModel());
  }

  @override
  void dispose() {
    sideNavApplicantsModel1.dispose();
    sideNavAgencyModel1.dispose();
    sideNavGeustModel1.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();

    emptyResultModel.dispose();
    sideNavApplicantsModel2.dispose();
    sideNavAgencyModel2.dispose();
    sideNavGeustModel2.dispose();
  }

  /// Action blocks.
  Future searchJob(BuildContext context) async {
    List<JobRecord>? updatedAllFiltered;
    List<AgencyPofileRecord>? filteredCompanies;

    updatedAllFiltered = await queryJobRecordOnce(
      queryBuilder: (jobRecord) => jobRecord.where(
        'visible',
        isEqualTo: true,
      ),
    );
    jobListResult = updatedAllFiltered!.toList().cast<JobRecord>();
    if (filterData != null) {
      if (filterData!.hasCompanies() &&
          ((filterData?.companies != null &&
                  (filterData?.companies)!.isNotEmpty) ==
              true)) {
        filteredCompanies = await queryAgencyPofileRecordOnce(
          queryBuilder: (agencyPofileRecord) => agencyPofileRecord.whereIn(
              'companyProfile', filterData?.companies),
        );
        filteredAgencies = filteredCompanies!
            .map((e) => e.reference.id)
            .toList()
            .toList()
            .cast<String>();
        jobListResult = jobListResult
            .where((e) => filteredAgencies.contains(e.agency?.id))
            .toList()
            .toList()
            .cast<JobRecord>();
      }
      if (filterData!.hasCountries() &&
          ((filterData?.countries != null &&
                  (filterData?.countries)!.isNotEmpty) ==
              true)) {
        jobListResult = jobListResult
            .where((e) => filterData?.countries?.contains(e.region) == true)
            .toList()
            .toList()
            .cast<JobRecord>();
      }
      if (filterData!.hasJobTypes() &&
          ((filterData?.jobTypes != null &&
                  (filterData?.jobTypes)!.isNotEmpty) ==
              true)) {
        jobListResult = jobListResult
            .where((e) => filterData?.jobTypes?.contains(e.type) == true)
            .toList()
            .toList()
            .cast<JobRecord>();
      }
      if (filterData!.hasDays() &&
          (filterData?.days != null && filterData?.days != '')) {
        jobListResult = jobListResult
            .where((e) =>
                functions.isWithinDays(e.datePosted, filterData!.days) == true)
            .toList()
            .toList()
            .cast<JobRecord>();
      }
    } else {
      return;
    }
  }
}
