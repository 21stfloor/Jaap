import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/agency_profile_view_component/agency_profile_view_component_widget.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import '/web_app_template/applicant/side_nav_geust/side_nav_geust_widget.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'job_post_preview_page_model.dart';
export 'job_post_preview_page_model.dart';

class JobPostPreviewPageWidget extends StatefulWidget {
  const JobPostPreviewPageWidget({
    super.key,
    required this.jobPost,
  });

  final JobRecord? jobPost;

  @override
  State<JobPostPreviewPageWidget> createState() =>
      _JobPostPreviewPageWidgetState();
}

class _JobPostPreviewPageWidgetState extends State<JobPostPreviewPageWidget> {
  late JobPostPreviewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobPostPreviewPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AgencyPofileRecord>(
      stream: AgencyPofileRecord.getDocument(widget!.jobPost!.agency!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final jobPostPreviewPageAgencyPofileRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: Builder(
                builder: (context) {
                  if (loggedIn == true) {
                    return wrapWithModel(
                      model: _model.sideNavApplicantsModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: SideNavApplicantsWidget(),
                    );
                  } else {
                    return wrapWithModel(
                      model: _model.sideNavGeustModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: SideNavGeustWidget(),
                    );
                  }
                },
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
                      child: Builder(
                        builder: (context) {
                          if (loggedIn == true) {
                            return wrapWithModel(
                              model: _model.sideNavApplicantsModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: SideNavApplicantsWidget(),
                            );
                          } else {
                            return wrapWithModel(
                              model: _model.sideNavGeustModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: SideNavGeustWidget(),
                            );
                          }
                        },
                      ),
                    ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              jobPostPreviewPageAgencyPofileRecord.user!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }

                            final columnUsersRecord = snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.safePop();
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: Container(
                                          width: 80.0,
                                          height: 80.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                FlutterFlowTheme.of(context)
                                                    .tertiary
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, -1.0),
                                              end: AlignmentDirectional(
                                                  -1.0, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        columnUsersRecord
                                                            .photoUrl,
                                                        'https://firebasestorage.googleapis.com/v0/b/jaap-h3fa31.appspot.com/o/449133811_969639548177226_1356168894052321592_n%20(1).jpg?alt=media&token=41943bb5-d21d-42a4-873b-961dbcfb5091',
                                                      ),
                                                      width: 100.0,
                                                      height: 100.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus(),
                                                          child:
                                                              AgencyProfileViewComponentWidget(
                                                            agencyProfile:
                                                                jobPostPreviewPageAgencyPofileRecord,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Text(
                                                  jobPostPreviewPageAgencyPofileRecord
                                                      .companyProfile,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 56.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: Icon(
                                            Icons.share_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 32.0,
                                          ),
                                          onPressed: () async {
                                            _model.currentPageLink =
                                                await generateCurrentPageLink(
                                              context,
                                              title:
                                                  '${widget!.jobPost?.title} - ${jobPostPreviewPageAgencyPofileRecord.companyProfile}',
                                              imageUrl:
                                                  columnUsersRecord.photoUrl,
                                              description:
                                                  widget!.jobPost?.description,
                                            );

                                            if (isWeb) {
                                              await Clipboard.setData(
                                                  ClipboardData(
                                                      text: _model
                                                          .currentPageLink));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Share link was copied to clipboard',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            } else {
                                              await Share.share(
                                                _model.currentPageLink,
                                                sharePositionOrigin:
                                                    getWidgetBoundingBox(
                                                        context),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zbu2bdh9' /* Job Title */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      widget!.jobPost?.title,
                                                      'N/A',
                                                    ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 26.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'y1f83gnx' /* About the job */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                        widget!.jobPost
                                                            ?.description,
                                                      'N/A',
                                                    ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                                if (widget!.jobPost!
                                                        .hasVideo() &&
                                                    widget!
                                                        .jobPost!.videoApproved)
                                                  FlutterFlowVideoPlayer(
                                                    path:
                                                        widget!.jobPost!.video,
                                                    videoType:
                                                        VideoType.network,
                                                    autoPlay: true,
                                                    looping: true,
                                                    showControls: true,
                                                    allowFullScreen: true,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                              Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ft7c9acv' /* Job type */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      widget!.jobPost?.type,
                                                      'N/A',
                                                    ),
                                                    maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'vzbg78iz' /* Salaryy */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        formatNumber(
                                                          widget!
                                                              .jobPost?.salary,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                          currency: 'P',
                                                        ),
                                                        'N/A',
                                                      ),
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'flxms526' /* Location */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      widget!.jobPost?.region,
                                                      'N/A',
                                                    ),
                                                    maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0xis546y' /* Skill requirements */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      widget!.jobPost?.skils,
                                                      'N/A',
                                                    ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                                Builder(
                                                  builder: (context) {
                                                    if (loggedIn) {
                                                      return StreamBuilder<
                                                  List<
                                                      AppllicantProfileRecord>>(
                                                stream:
                                                    queryAppllicantProfileRecord(
                                                    parent:
                                                        currentUserReference,
                                                  singleRecord: true,
                                                ),
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
                                                  List<AppllicantProfileRecord>
                                                      columnAppllicantProfileRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final columnAppllicantProfileRecord =
                                                      columnAppllicantProfileRecordList
                                                              .isNotEmpty
                                                          ? columnAppllicantProfileRecordList
                                                              .first
                                                          : null;

                                                  return Column(
                                                    mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                    children: [
                                                      StreamBuilder<
                                                          List<
                                                              JobApplicationRecord>>(
                                                        stream:
                                                            queryJobApplicationRecord(
                                                          parent: widget!
                                                              .jobPost
                                                              ?.reference,
                                                          queryBuilder:
                                                              (jobApplicationRecord) =>
                                                                  jobApplicationRecord
                                                                      .where(
                                                            'applicant',
                                                            isEqualTo:
                                                                columnAppllicantProfileRecord
                                                                    ?.reference,
                                                          ),
                                                        ),
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
                                                                            FlutterFlowTheme.of(context).primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<JobApplicationRecord>
                                                              containerJobApplicationRecordList =
                                                                      snapshot
                                                                          .data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                                    child:
                                                                        Builder(
                                                              builder:
                                                                  (context) {
                                                                  if ((columnAppllicantProfileRecord != null) &&
                                                                            (columnAppllicantProfileRecord?.currentCompany ==
                                                                            null) &&
                                                                            (valueOrDefault<bool>(currentUserDocument?.accountactivation, false) !=
                                                                          false) &&
                                                                            !(containerJobApplicationRecordList.isNotEmpty)) {
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                if (loggedIn == false) {
                                                                              context.pushNamed('auth_CreateApplicant');

                                                                              return;
                                                                            } else {
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: Text('Confirm Application'),
                                                                                        content: Text('Are you sure you want to apply for this job?'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: Text('Cancel'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: Text('Confirm'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (confirmDialogResponse) {
                                                                                await JobApplicationRecord.createDoc(widget!.jobPost!.reference).set({
                                                                                  ...createJobApplicationRecordData(
                                                                                    applicant: columnAppllicantProfileRecord?.reference,
                                                                                    agency: widget!.jobPost?.agency,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'date': FieldValue.serverTimestamp(),
                                                                                    },
                                                                                  ),
                                                                                });

                                                                                safeSetState(() {});
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Your application was sent to the agency',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                await action_blocks.createNotification(
                                                                                  context,
                                                                                  user: jobPostPreviewPageAgencyPofileRecord.parentReference,
                                                                                  message: 'A new applicant wants to apply to your job post: ${widget!.jobPost?.title}',
                                                                                );

                                                                                await columnAppllicantProfileRecord!.reference.update(createAppllicantProfileRecordData(
                                                                                  status: FFAppConstants.statusNotHired,
                                                                                ));
                                                                              }
                                                                            }
                                                                          },
                                                                              text: !loggedIn ? 'Register now' : 'Apply now',
                                                                              icon: Icon(
                                                                                Icons.card_travel_rounded,
                                                                                size: 24.0,
                                                                          ),
                                                                              options: FFButtonOptions(
                                                                                height: 60.0,
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
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                          ),
                                                                        ),
                                                                    );
                                                                  } else {
                                                                    return Text(
                                                                            FFLocalizations.of(context).getText(
                                                                        'sj6tktmr' /* You can't apply for this job,
... */
                                                                        ,
                                                                      ),
                                                                      textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                                      );
                                                    } else {
                                                      return FFButtonWidget(
                                                        onPressed: () async {
                                                          context.goNamed(
                                                            'auth_CreateApplicant',
                                                            queryParameters: {
                                                              'role':
                                                                  serializeParam(
                                                                FFAppConstants
                                                                    .userTypeApplicant,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'c8nr6sit' /* Login to apply */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
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
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      );
                                                    }
                                                  },
                                              ),
                                            ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
        );
      },
    );
  }
}
