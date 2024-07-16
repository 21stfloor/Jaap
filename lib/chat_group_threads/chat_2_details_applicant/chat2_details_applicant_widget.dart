import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_group_threads/chat_thread_component/chat_thread_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/review_agency_component/review_agency_component_widget.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat2_details_applicant_model.dart';
export 'chat2_details_applicant_model.dart';

class Chat2DetailsApplicantWidget extends StatefulWidget {
  const Chat2DetailsApplicantWidget({
    super.key,
    required this.chatRef,
    required this.job,
  });

  final ChatsRecord? chatRef;
  final JobRecord? job;

  @override
  State<Chat2DetailsApplicantWidget> createState() =>
      _Chat2DetailsApplicantWidgetState();
}

class _Chat2DetailsApplicantWidgetState
    extends State<Chat2DetailsApplicantWidget> {
  late Chat2DetailsApplicantModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2DetailsApplicantModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                wrapWithModel(
                  model: _model.sideNavApplicantsModel1,
                  updateCallback: () => setState(() {}),
                  child: SideNavApplicantsWidget(),
                ),
              Expanded(
                child: StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(widget!.chatRef!.userA!),
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
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<AgencyPofileRecord>>(
                        stream: queryAgencyPofileRecord(
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<AgencyPofileRecord>
                              columnAgencyPofileRecordList = snapshot.data!;

                          final columnAgencyPofileRecord =
                              columnAgencyPofileRecordList.isNotEmpty
                                  ? columnAgencyPofileRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<RatingsRecord>>(
                                stream: queryRatingsRecord(
                                  queryBuilder: (ratingsRecord) =>
                                      ratingsRecord.where(Filter.or(
                                    Filter(
                                      'author',
                                      isEqualTo: currentUserReference,
                                    ),
                                    Filter(
                                      'user',
                                      isEqualTo: containerUsersRecord.reference,
                                    ),
                                  )),
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
                                  List<RatingsRecord> wrapRatingsRecordList =
                                      snapshot.data!;

                                  final wrapRatingsRecord =
                                      wrapRatingsRecordList.isNotEmpty
                                          ? wrapRatingsRecordList.first
                                          : null;
                                  return Wrap(
                                    spacing: 0.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (wrapRatingsRecord != null) {
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            );
                                          } else {
                                            return StreamBuilder<
                                                List<HiredApplicationsRecord>>(
                                              stream:
                                                  queryHiredApplicationsRecord(
                                                parent: widget!.job?.reference,
                                                queryBuilder:
                                                    (hiredApplicationsRecord) =>
                                                        hiredApplicationsRecord
                                                            .where(
                                                  'applicant',
                                                  isEqualTo:
                                                      currentUserReference,
                                                ),
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
                                                List<HiredApplicationsRecord>
                                                    containerHiredApplicationsRecordList =
                                                    snapshot.data!;

                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final containerHiredApplicationsRecord =
                                                    containerHiredApplicationsRecordList
                                                            .isNotEmpty
                                                        ? containerHiredApplicationsRecordList
                                                            .first
                                                        : null;
                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Visibility(
                                                    visible:
                                                        containerHiredApplicationsRecord !=
                                                            null,
                                                    child: Builder(
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
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      ReviewAgencyComponentWidget(
                                                                    userToReview:
                                                                        containerUsersRecord,
                                                                    agencyProfile:
                                                                        columnAgencyPofileRecord!,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'z4v7vku8' /* Rate this agency */,
                                                        ),
                                                        icon: Icon(
                                                          Icons.star_border,
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
                                                              .warning,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
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
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.chatThreadComponentModel,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: ChatThreadComponentWidget(
                                      chatRef: widget!.chatRef,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
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
