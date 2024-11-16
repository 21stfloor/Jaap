import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_group_threads/chat_thread_component/chat_thread_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/applicant_profile_view_component/applicant_profile_view_component_widget.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import '/web_app_template/applicant/review_applicant_component/review_applicant_component_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat2_details_agency_model.dart';
export 'chat2_details_agency_model.dart';

class Chat2DetailsAgencyWidget extends StatefulWidget {
  const Chat2DetailsAgencyWidget({
    super.key,
    required this.chatRef,
    required this.jobPost,
  });

  final ChatsRecord? chatRef;
  final JobRecord? jobPost;

  @override
  State<Chat2DetailsAgencyWidget> createState() =>
      _Chat2DetailsAgencyWidgetState();
}

class _Chat2DetailsAgencyWidgetState extends State<Chat2DetailsAgencyWidget> {
  late Chat2DetailsAgencyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2DetailsAgencyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget!.chatRef == null) || (widget!.jobPost == null)) {
        context.goNamed('blank_404');

        return;
      }
      unawaited(
        () async {
          await widget!.chatRef!.reference.update({
            ...mapToFirestore(
              {
                'last_message_seen_by':
                    FieldValue.arrayUnion([currentUserReference]),
              },
            ),
          });
        }(),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideNavAgencyModel2,
            updateCallback: () => safeSetState(() {}),
            child: SideNavAgencyWidget(),
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
                wrapWithModel(
                  model: _model.sideNavAgencyModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: SideNavAgencyWidget(),
                ),
              Expanded(
                child: StreamBuilder<List<AgencyPofileRecord>>(
                  stream: queryAgencyPofileRecord(
                    parent: currentUserReference,
                    singleRecord: true,
                  ),
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
                    List<AgencyPofileRecord> containerAgencyPofileRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerAgencyPofileRecord =
                        containerAgencyPofileRecordList.isNotEmpty
                            ? containerAgencyPofileRecordList.first
                            : null;

                    return Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                widget!.chatRef!.userB!),
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

                              final containerUsersRecord = snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: StreamBuilder<
                                    List<AppllicantProfileRecord>>(
                                  stream: queryAppllicantProfileRecord(
                                    parent: containerUsersRecord.reference,
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<AppllicantProfileRecord>
                                        containerAppllicantProfileRecordList =
                                        snapshot.data!;
                                    final containerAppllicantProfileRecord =
                                        containerAppllicantProfileRecordList
                                                .isNotEmpty
                                            ? containerAppllicantProfileRecordList
                                                .first
                                            : null;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: StreamBuilder<
                                          List<JobApplicationRecord>>(
                                        stream: queryJobApplicationRecord(
                                          parent: widget!.jobPost?.reference,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<JobApplicationRecord>
                                              containerJobApplicationRecordList =
                                              snapshot.data!;
                                          final containerJobApplicationRecord =
                                              containerJobApplicationRecordList
                                                      .isNotEmpty
                                                  ? containerJobApplicationRecordList
                                                      .first
                                                  : null;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.spaceEvenly,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus(),
                                                                child:
                                                                    ApplicantProfileViewComponentWidget(
                                                                  applicantProfile:
                                                                      containerAppllicantProfileRecord!,
                                                                  jobRef:
                                                                      containerJobApplicationRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'tr418kgs' /* View Applicant Profile */,
                                                      ),
                                                      icon: Icon(
                                                        Icons.remove_red_eye,
                                                        size: 24.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      if (containerAppllicantProfileRecord
                                                              ?.currentCompany ==
                                                          null) {
                                                        return FFButtonWidget(
                                                          onPressed: () async {
                                                            final firestoreBatch =
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .batch();
                                                            try {
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Confirm Hiring'),
                                                                            content:
                                                                                Text('Proceed to hire this applicant?'),
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
                                                                firestoreBatch
                                                                    .update(
                                                                        containerAppllicantProfileRecord!
                                                                            .reference,
                                                                        createAppllicantProfileRecordData(
                                                                          currentCompany:
                                                                              containerAgencyPofileRecord?.reference,
                                                                          jobTitle: widget!
                                                                              .jobPost
                                                                              ?.title,
                                                                        ));

                                                                firestoreBatch.set(
                                                                    HiredApplicationsRecord.createDoc(widget!
                                                                        .jobPost!
                                                                        .reference),
                                                                    {
                                                                      ...createHiredApplicationsRecordData(
                                                                        applicant:
                                                                            containerUsersRecord.reference,
                                                                        title: widget!
                                                                            .jobPost
                                                                            ?.title,
                                                                        salary: widget!
                                                                            .jobPost
                                                                            ?.salary
                                                                            ?.toDouble(),
                                                                        agency:
                                                                            currentUserReference,
                                                                      ),
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'dateHired':
                                                                              FieldValue.serverTimestamp(),
                                                                        },
                                                                      ),
                                                                    });
                                                                await action_blocks
                                                                    .createNotification(
                                                                  context,
                                                                  user: containerAppllicantProfileRecord
                                                                      ?.parentReference,
                                                                  message:
                                                                      'Congratulations! You are hired:${widget!.jobPost?.title}',
                                                                );
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Success'),
                                                                      content: Text(
                                                                          'Applicant was hired successfully'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            } finally {
                                                              await firestoreBatch
                                                                  .commit();
                                                            }
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'lu508opu' /* Hire this Applicant */,
                                                          ),
                                                          icon: Icon(
                                                            Icons.check_circle,
                                                            size: 24.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
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
                                                                .secondary,
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
                                                            elevation: 3.0,
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
                                                        );
                                                      } else if (containerAppllicantProfileRecord
                                                              ?.currentCompany ==
                                                          containerAgencyPofileRecord
                                                              ?.reference) {
                                                        return FutureBuilder<
                                                            List<
                                                                RatingsRecord>>(
                                                          future:
                                                              queryRatingsRecordOnce(
                                                            queryBuilder:
                                                                (ratingsRecord) =>
                                                                    ratingsRecord
                                                                        .where(
                                                                          'user',
                                                                          isEqualTo: widget!
                                                                              .chatRef
                                                                              ?.userB,
                                                                        )
                                                                        .where(
                                                                          'author',
                                                                          isEqualTo:
                                                                              currentUserReference,
                                                                        ),
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
                                                            List<RatingsRecord>
                                                                containerRatingsRecordList =
                                                                snapshot.data!;
                                                            final containerRatingsRecord =
                                                                containerRatingsRecordList
                                                                        .isNotEmpty
                                                                    ? containerRatingsRecordList
                                                                        .first
                                                                    : null;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Visibility(
                                                                visible:
                                                                    !(containerRatingsRecord !=
                                                                        null),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                              child: ReviewApplicantComponentWidget(
                                                                                userToReview: containerUsersRecord,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'hv4byp6d' /* Rate this Applicant */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .star_sharp,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [],
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.video_chat,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      _model.existingSession =
                                                          await queryCallSessionRecordOnce(
                                                        queryBuilder:
                                                            (callSessionRecord) =>
                                                                callSessionRecord
                                                                    .where(
                                                                      'agency',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    )
                                                                    .where(
                                                                      'applicant',
                                                                      isEqualTo: widget!
                                                                          .chatRef
                                                                          ?.userB,
                                                                    ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      if (_model
                                                              .existingSession !=
                                                          null) {
                                                        await _model
                                                            .existingSession!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'dateStarted':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                        },
                                                          ),
                                                        });
                                                      } else {
                                                        await CallSessionRecord
                                                            .collection
                                                            .doc()
                                                            .set({
                                                          ...createCallSessionRecordData(
                                                            agency:
                                                                currentUserReference,
                                                            applicant: widget!
                                                                .chatRef?.userB,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'dateStarted':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                    },
                                                          ),
                                                        });
                                                        await _model
                                                            .existingSession!
                                                            .reference
                                                            .delete();
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.chatThreadComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: ChatThreadComponentWidget(
                                  chatRef: widget!.chatRef,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
