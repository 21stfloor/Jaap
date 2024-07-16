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
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'job_list_model.dart';
export 'job_list_model.dart';

class JobListWidget extends StatefulWidget {
  const JobListWidget({super.key});

  @override
  State<JobListWidget> createState() => _JobListWidgetState();
}

class _JobListWidgetState extends State<JobListWidget> {
  late JobListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      if (valueOrDefault(currentUserDocument?.role, '') !=
          FFAppConstants.userTypeApplicant) {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        _navigate =
            () => context.goNamedAuth('auth_WelcomeScreen', context.mounted);

        _navigate();
        return;
      }
      _model.addToRegionSelected(FFAppConstants.regionAsia);
      setState(() {});
      _model.allVisibleJobs = await queryJobRecordOnce(
        queryBuilder: (jobRecord) => jobRecord
            .where(
              'visible',
              isEqualTo: true,
            )
            .where(
              'region',
              isEqualTo: FFAppConstants.regionAsia,
            ),
      );
      _model.jobListResult = _model.allVisibleJobs!.toList().cast<JobRecord>();
      setState(() {});
      _model.allBoostedPost = await queryPaymentsRecordOnce(
        queryBuilder: (paymentsRecord) => paymentsRecord
            .where(
              'expiry',
              isGreaterThan: getCurrentTimestamp,
            )
            .orderBy('expiry', descending: true)
            .orderBy('date', descending: true),
      );
      _model.boostedPosts = _model.allBoostedPost!
          .where((e) => !e.expired)
          .toList()
          .toList()
          .cast<PaymentsRecord>();
      setState(() {});

      _navigate();
    });

    _model.searchBoxTextController ??= TextEditingController();
    _model.searchBoxFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideNavApplicantsModel2,
            updateCallback: () => setState(() {}),
            child: SideNavApplicantsWidget(),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Container(
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.sideNavApplicantsModel1,
                    updateCallback: () => setState(() {}),
                    child: SideNavApplicantsWidget(),
                  ),
                ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'j2bgq4f6' /* Job List */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.searchBoxTextController,
                                  focusNode: _model.searchBoxFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '7lfiwi6h' /* SEARCH JOB HERE */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model
                                      .searchBoxTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).accent1,
                              icon: Icon(
                                Icons.search,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                if (FFAppState().hasSubscription) {
                                  if (_model.choiceChipsValues!
                                      .contains(FFAppConstants.regionAll)) {
                                    _model.updatedAllVisibleJobWorld =
                                        await queryJobRecordOnce(
                                      queryBuilder: (jobRecord) => jobRecord
                                          .where(
                                            'visible',
                                            isEqualTo: true,
                                          )
                                          .whereIn(
                                              'region', _model.regionSelected),
                                    );
                                    _model.jobListResult = _model
                                        .updatedAllVisibleJobWorld!
                                        .toList()
                                        .cast<JobRecord>();
                                    setState(() {});
                                  }
                                } else {
                                  _model.regionSelected = [];
                                  setState(() {});
                                  _model.addToRegionSelected(
                                      FFAppConstants.regionAsia);
                                  setState(() {});
                                  _model.updatedAllVisibleJobAsia =
                                      await queryJobRecordOnce(
                                    queryBuilder: (jobRecord) => jobRecord
                                        .where(
                                          'visible',
                                          isEqualTo: true,
                                        )
                                        .where(
                                          'region',
                                          isEqualTo: FFAppConstants.regionAsia,
                                        ),
                                  );
                                  _model.jobListResult = _model
                                      .updatedAllVisibleJobAsia!
                                      .toList()
                                      .cast<JobRecord>();
                                  setState(() {});
                                }

                                if (_model.searchBoxTextController.text !=
                                        null &&
                                    _model.searchBoxTextController.text != '') {
                                  safeSetState(() {
                                    _model.simpleSearchResults = TextSearch(
                                      _model.jobListResult
                                          .map(
                                            (record) =>
                                                TextSearchItem.fromTerms(
                                                    record, [
                                              record.title!,
                                              record.location!,
                                              record.skils!
                                            ]),
                                          )
                                          .toList(),
                                    )
                                        .search(
                                            _model.searchBoxTextController.text)
                                        .map((r) => r.object)
                                        .toList();
                                    ;
                                  });
                                  _model.jobListResult = _model
                                      .simpleSearchResults
                                      .toList()
                                      .cast<JobRecord>();
                                  setState(() {});
                                }

                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) => FlutterFlowChoiceChips(
                                options: FFAppConstants.regions
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) async {
                                  setState(
                                      () => _model.choiceChipsValues = val);
                                  if (FFAppState().hasSubscription == true) {
                                    _model.regionSelected = _model
                                        .choiceChipsValues!
                                        .toList()
                                        .cast<String>();
                                    setState(() {});
                                  } else {
                                    if (_model.choiceChipsValues!
                                        .contains('World')) {
                                      await showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child:
                                                  PaymentDialogApplicantWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));

                                      return;
                                    }
                                  }
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  iconSize: 18.0,
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: true,
                                initialized: _model.choiceChipsValues != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  _model.regionSelected,
                                ),
                                wrapped: true,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            height: 180.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ltc5h9ar' /* Featured Jobs */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    width: double.infinity,
                                    height: 180.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Builder(
                                        builder: (context) {
                                          final boostedRows =
                                              _model.boostedPosts.toList();
                                          if (boostedRows.isEmpty) {
                                            return EmptyStateSimpleWidget();
                                          }

                                          return Container(
                                            width: double.infinity,
                                            height: 180.0,
                                            child: CarouselSlider.builder(
                                              itemCount: boostedRows.length,
                                              itemBuilder: (context,
                                                  boostedRowsIndex, _) {
                                                final boostedRowsItem =
                                                    boostedRows[
                                                        boostedRowsIndex];
                                                return StreamBuilder<
                                                    List<AgencyPofileRecord>>(
                                                  stream:
                                                      queryAgencyPofileRecord(
                                                    parent:
                                                        boostedRowsItem.sender,
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<AgencyPofileRecord>
                                                        containerAgencyPofileRecordList =
                                                        snapshot.data!;

                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final containerAgencyPofileRecord =
                                                        containerAgencyPofileRecordList
                                                                .isNotEmpty
                                                            ? containerAgencyPofileRecordList
                                                                .first
                                                            : null;
                                                    return Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord.getDocument(
                                                            containerAgencyPofileRecord!
                                                                .parentReference),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final cardUsersRecord =
                                                              snapshot.data!;

                                                          return Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            elevation: 4.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child:
                                                                StreamBuilder<
                                                                    JobRecord>(
                                                              stream: JobRecord
                                                                  .getDocument(
                                                                      boostedRowsItem
                                                                          .jobPost!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final columnJobRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Wrap(
                                                                        spacing:
                                                                            0.0,
                                                                        runSpacing:
                                                                            0.0,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: [
                                                                          Builder(
                                                                            builder: (context) =>
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: GestureDetector(
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: AgencyProfileViewComponentWidget(
                                                                                          agencyProfile: containerAgencyPofileRecord!,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                                child: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    cardUsersRecord.photoUrl,
                                                                                    'https://firebasestorage.googleapis.com/v0/b/jaap-h3fa31.appspot.com/o/449133811_969639548177226_1356168894052321592_n%20(1).jpg?alt=media&token=41943bb5-d21d-42a4-873b-961dbcfb5091',
                                                                                  ),
                                                                                  width: 40.0,
                                                                                  height: 40.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  columnJobRecord.title,
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    columnJobRecord.description.maybeHandleOverflow(
                                                                                      maxChars: 100,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      columnJobRecord.salary,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                      currency: 'P',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) => FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  context.pushNamed(
                                                                                    'jobPostPreviewPage',
                                                                                    queryParameters: {
                                                                                      'jobPost': serializeParam(
                                                                                        columnJobRecord,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'jobPost': columnJobRecord,
                                                                                    },
                                                                                  );

                                                                                  if (!FFAppState().hasSubscription && (columnJobRecord.region != FFAppConstants.regionAsia)) {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: GestureDetector(
                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                            child: PaymentDialogApplicantWidget(),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));
                                                                                  } else {
                                                                                    context.pushNamed(
                                                                                      'jobPostPreviewPage',
                                                                                      queryParameters: {
                                                                                        'jobPost': serializeParam(
                                                                                          columnJobRecord,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'jobPost': columnJobRecord,
                                                                                      },
                                                                                    );
                                                                                  }
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '9kg1qge0' /* View Full Details  */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  elevation: 3.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              carouselController:
                                                  _model.carouselController ??=
                                                      CarouselController(),
                                              options: CarouselOptions(
                                                initialPage: max(
                                                    0,
                                                    min(
                                                        1,
                                                        boostedRows.length -
                                                            1)),
                                                viewportFraction: 0.5,
                                                disableCenter: true,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.35,
                                                enableInfiniteScroll: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: true,
                                                autoPlayAnimationDuration:
                                                    Duration(milliseconds: 800),
                                                autoPlayInterval: Duration(
                                                    milliseconds: (800 + 4000)),
                                                autoPlayCurve: Curves.linear,
                                                pauseAutoPlayInFiniteScroll:
                                                    true,
                                                onPageChanged: (index, _) =>
                                                    _model.carouselCurrentIndex =
                                                        index,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'eaxc4l57' /* More Jobs */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final jobRows = _model.jobListResult.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: jobRows.length,
                                  itemBuilder: (context, jobRowsIndex) {
                                    final jobRowsItem = jobRows[jobRowsIndex];
                                    return Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: StreamBuilder<AgencyPofileRecord>(
                                        stream: AgencyPofileRecord.getDocument(
                                            jobRowsItem.agency!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          final cardAgencyPofileRecord =
                                              snapshot.data!;

                                          return Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            elevation: 4.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  cardAgencyPofileRecord
                                                      .parentReference),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }

                                                final columnUsersRecord =
                                                    snapshot.data!;

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            AgencyProfileViewComponentWidget(
                                                                          agencyProfile:
                                                                              cardAgencyPofileRecord,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    columnUsersRecord
                                                                        .photoUrl,
                                                                    'https://firebasestorage.googleapis.com/v0/b/jaap-h3fa31.appspot.com/o/449133811_969639548177226_1356168894052321592_n%20(1).jpg?alt=media&token=41943bb5-d21d-42a4-873b-961dbcfb5091',
                                                                  ),
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    jobRowsItem
                                                                        .title,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      jobRowsItem
                                                                          .description
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            300,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        formatNumber(
                                                          jobRowsItem.salary,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                          currency: 'P',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'jobPostPreviewPage',
                                                                    queryParameters:
                                                                        {
                                                                      'jobPost':
                                                                          serializeParam(
                                                                        jobRowsItem,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'jobPost':
                                                                          jobRowsItem,
                                                                    },
                                                                  );
                                                                },
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '9iuvbb3p' /* View Full Details  */,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
