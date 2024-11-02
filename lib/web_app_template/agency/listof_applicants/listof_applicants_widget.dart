import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/agency/side_nav_agency/side_nav_agency_widget.dart';
import '/web_app_template/applicant/application_row/application_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'listof_applicants_model.dart';
export 'listof_applicants_model.dart';

class ListofApplicantsWidget extends StatefulWidget {
  const ListofApplicantsWidget({super.key});

  @override
  State<ListofApplicantsWidget> createState() => _ListofApplicantsWidgetState();
}

class _ListofApplicantsWidgetState extends State<ListofApplicantsWidget> {
  late ListofApplicantsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListofApplicantsModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 8.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '45xoyedp' /* Applicants */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
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
                            List<AgencyPofileRecord>
                                containerAgencyPofileRecordList =
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
                              height: 800.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                                child:
                                    StreamBuilder<List<JobApplicationRecord>>(
                                  stream: queryJobApplicationRecord(
                                    queryBuilder: (jobApplicationRecord) =>
                                        jobApplicationRecord
                                            .where(
                                              'agency',
                                              isEqualTo:
                                                  containerAgencyPofileRecord
                                                      ?.reference,
                                            )
                                            .orderBy('date', descending: true),
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
                                    List<JobApplicationRecord>
                                        listViewJobApplicationRecordList =
                                        snapshot.data!;

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount:
                                          listViewJobApplicationRecordList
                                              .length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewJobApplicationRecord =
                                            listViewJobApplicationRecordList[
                                                listViewIndex];
                                        return wrapWithModel(
                                          model: _model.applicationRowModels
                                              .getModel(
                                            listViewJobApplicationRecord
                                                .reference.id,
                                            listViewIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ApplicationRowWidget(
                                            key: Key(
                                              'Keyo64_${listViewJobApplicationRecord.reference.id}',
                                            ),
                                            jobApplication:
                                                listViewJobApplicationRecord,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
