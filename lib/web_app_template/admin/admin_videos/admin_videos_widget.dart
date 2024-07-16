import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web_app_template/admin/sidebar_admin/sidebar_admin_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_videos_model.dart';
export 'admin_videos_model.dart';

class AdminVideosWidget extends StatefulWidget {
  const AdminVideosWidget({super.key});

  @override
  State<AdminVideosWidget> createState() => _AdminVideosWidgetState();
}

class _AdminVideosWidgetState extends State<AdminVideosWidget> {
  late AdminVideosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminVideosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      if (valueOrDefault(currentUserDocument?.role, '') !=
          FFAppConstants.userTypeAdmin) {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        _navigate =
            () => context.goNamedAuth('auth_WelcomeScreen', context.mounted);

        _navigate();
        return;
      }
      _model.allVideos = await queryVideoPostRecordOnce(
        queryBuilder: (videoPostRecord) =>
            videoPostRecord.orderBy('time_posted', descending: true),
      );
      _model.filteredVideoList =
          _model.allVideos!.toList().cast<VideoPostRecord>();
      setState(() {});

      _navigate();
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
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.sidebarAdminModel,
                updateCallback: () => setState(() {}),
                child: SidebarAdminWidget(),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      constraints: BoxConstraints(
                        maxWidth: 1170.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Color(0xFFE0E3E7),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'uk8186co' /* Videos */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF14181B),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 12.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'i7x2y1xg' /* Below is a list of your upload... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF57636C),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('AdminVideoPostCreate');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'atuanj24' /* Upload */,
                                  ),
                                  icon: Icon(
                                    Icons.video_call_sharp,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF14181B),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final videoRows =
                                        _model.filteredVideoList.toList();

                                    return FlutterFlowDataTable<
                                        VideoPostRecord>(
                                      controller:
                                          _model.paginatedDataTableController,
                                      data: videoRows,
                                      columnsBuilder: (onSortChanged) => [
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'brd63vy6' /* Thumbnail */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9e3i7nzw' /* Title */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '26aiomva' /* Updated */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'kdv254ch' /* Actions */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      dataRowBuilder: (videoRowsItem,
                                              videoRowsIndex,
                                              selected,
                                              onSelectChanged) =>
                                          DataRow(
                                        color: MaterialStateProperty.all(
                                          videoRowsIndex % 2 == 0
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        cells: [
                                          Text(
                                            videoRowsItem.postTitle,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            videoRowsItem.postTitle,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            dateTimeFormat(
                                              'yMMMd',
                                              videoRowsItem.timePosted!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 5.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                icon: Icon(
                                                  Icons.edit_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    'AdminVideosPostEdit',
                                                    queryParameters: {
                                                      'videoToEdit':
                                                          serializeParam(
                                                        videoRowsItem,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'videoToEdit':
                                                          videoRowsItem,
                                                    },
                                                  );
                                                },
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 5.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                icon: Icon(
                                                  Icons.delete_forever,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Confirm delete'),
                                                                content: Text(
                                                                    'Are you sure you want to delete this video?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    await videoRowsItem
                                                        .reference
                                                        .delete();
                                                  }
                                                },
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ].map((c) => DataCell(c)).toList(),
                                      ),
                                      paginated: true,
                                      selectable: false,
                                      hidePaginator: false,
                                      showFirstLastButtons: true,
                                      headingRowHeight: 56.0,
                                      dataRowHeight: 110.0,
                                      columnSpacing: 20.0,
                                      headingRowColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      borderRadius: BorderRadius.circular(8.0),
                                      addHorizontalDivider: true,
                                      addTopAndBottomDivider: false,
                                      hideDefaultHorizontalDivider: true,
                                      horizontalDividerColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      horizontalDividerThickness: 1.0,
                                      addVerticalDivider: false,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
