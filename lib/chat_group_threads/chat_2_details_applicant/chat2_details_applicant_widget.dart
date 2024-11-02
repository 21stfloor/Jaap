import '../../video_call_widget/video_call_widget_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_group_threads/chat_thread_component/chat_thread_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/applicant/side_nav_applicants/side_nav_applicants_widget.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
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
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>> _creationSubscription;
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
      _model.existingSession = await queryCallSessionRecordOnce(
        queryBuilder: (callSessionRecord) => callSessionRecord
            .where(
              'agency',
              isEqualTo: widget!.chatRef?.userA,
            )
            .where(
              'applicant',
              isEqualTo: currentUserReference,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.hasCall = _model.existingSession != null;
      safeSetState(() {});



      _creationSubscription = FirebaseFirestore.instance
          .collection('CallSession')
          .where('agency', isEqualTo: widget.chatRef!.userA)
          .where('applicant', isEqualTo: currentUserReference)
          .snapshots()
          .listen((querySnapshot) {
        for (var docChange in querySnapshot.docChanges) {
          if (docChange.type == DocumentChangeType.added) {
            // A new document was created and matches the criteria
            print("New document created with ID: ${docChange.doc.id}");
            print("Document data: ${docChange.doc.data()}");
            setState((){
              _model.hasCall = true;
            });
          }
          else if (docChange.type == DocumentChangeType.removed) {
            // Document deleted
            print("Document deleted with ID: ${docChange.doc.id}");
            setState((){
              _model.hasCall = false;
            });
          }
        }
      }, onError: (error) {
        print("Error listening for document creations: $error");
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    _creationSubscription.cancel();
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
            model: _model.sideNavApplicantsModel2,
            updateCallback: () => safeSetState(() {}),
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
                  updateCallback: () => safeSetState(() {}),
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
                              if (_model.hasCall)
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () async{
                                        await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(0.0, 0.0)
                                                .resolve(Directionality.of(context)),
                                            child: VideoCallWidgetWidget(chatRef: widget.chatRef,),
                                          );
                                        },
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '5xikrvqr' /* Answer Video Call */,
                                      ),
                                      icon: Icon(
                                        Icons.call_sharp,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 128.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              Expanded(
                                flex: 19,
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
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
