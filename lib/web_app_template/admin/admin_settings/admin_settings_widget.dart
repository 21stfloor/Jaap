import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'admin_settings_model.dart';
export 'admin_settings_model.dart';

class AdminSettingsWidget extends StatefulWidget {
  const AdminSettingsWidget({super.key});

  @override
  State<AdminSettingsWidget> createState() => _AdminSettingsWidgetState();
}

class _AdminSettingsWidgetState extends State<AdminSettingsWidget> {
  late AdminSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminSettingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.existingAgencyPriceCopy = await queryPricesRecordOnce(
        queryBuilder: (pricesRecord) => pricesRecord.where(
          'type',
          isEqualTo: FFAppConstants.userTypeAgency,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.existingAgencyPriceCopy != null) {
        _model.boostingPrice = _model.existingAgencyPriceCopy!.price;
        setState(() {});
      }
      _model.existingApplicantPriceCopy = await queryPricesRecordOnce(
        queryBuilder: (pricesRecord) => pricesRecord.where(
          'type',
          isEqualTo: FFAppConstants.userTypeApplicant,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.existingApplicantPriceCopy != null) {
        _model.applicantSubscriptionPrice =
            _model.existingApplicantPriceCopy!.price;
        setState(() {});
      }
    });

    _model.boostingPriceFocusNode ??= FocusNode();

    _model.applicantPriceTextController ??= TextEditingController(
        text: _model.applicantSubscriptionPrice.toString());
    _model.applicantPriceFocusNode ??= FocusNode();

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
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Container(
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.sidebarAdminModel,
                    updateCallback: () => setState(() {}),
                    child: SidebarAdminWidget(),
                  ),
                ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 1170.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 24.0, 16.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 4.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'ylltivnx' /* Settings */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Container(
                                width: double.infinity,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'zzoquknb' /* Price */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      StreamBuilder<List<PricesRecord>>(
                                        stream: queryPricesRecord(
                                          queryBuilder: (pricesRecord) =>
                                              pricesRecord.where(
                                            'type',
                                            isEqualTo:
                                                FFAppConstants.userTypeAgency,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<PricesRecord>
                                              containerPricesRecordList =
                                              snapshot.data!;

                                          final containerPricesRecord =
                                              containerPricesRecordList
                                                      .isNotEmpty
                                                  ? containerPricesRecordList
                                                      .first
                                                  : null;
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                        .boostingPriceTextController ??=
                                                    TextEditingController(
                                                  text: containerPricesRecord
                                                      ?.price
                                                      ?.toString(),
                                                ),
                                                focusNode: _model
                                                    .boostingPriceFocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '413scz0z' /* Agency Boosting Price */,
                                                  ),
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                validator: _model
                                                    .boostingPriceTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 10.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .applicantPriceTextController,
                                          focusNode:
                                              _model.applicantPriceFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'y3sfq0z4' /* Applicant Subscription Price */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          validator: _model
                                              .applicantPriceTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final firestoreBatch =
                                                FirebaseFirestore.instance
                                                    .batch();
                                            try {
                                              _model.existingAgencyPrice =
                                                  await queryPricesRecordOnce(
                                                queryBuilder: (pricesRecord) =>
                                                    pricesRecord.where(
                                                  'type',
                                                  isEqualTo: FFAppConstants
                                                      .userTypeAgency,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.existingAgencyPrice !=
                                                  null) {
                                                firestoreBatch.update(
                                                    _model.existingAgencyPrice!
                                                        .reference,
                                                    createPricesRecordData(
                                                      price: double.tryParse(_model
                                                          .boostingPriceTextController
                                                          .text),
                                                    ));
                                              } else {
                                                firestoreBatch.set(
                                                    PricesRecord.collection
                                                        .doc(),
                                                    createPricesRecordData(
                                                      type: FFAppConstants
                                                          .userTypeAgency,
                                                      price: double.tryParse(_model
                                                          .boostingPriceTextController
                                                          .text),
                                                    ));
                                              }

                                              _model.existingApplicantPrice =
                                                  await queryPricesRecordOnce(
                                                queryBuilder: (pricesRecord) =>
                                                    pricesRecord.where(
                                                  'type',
                                                  isEqualTo: FFAppConstants
                                                      .userTypeApplicant,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.existingAgencyPrice !=
                                                  null) {
                                                firestoreBatch.update(
                                                    _model.existingAgencyPrice!
                                                        .reference,
                                                    createPricesRecordData(
                                                      price: double.tryParse(_model
                                                          .applicantPriceTextController
                                                          .text),
                                                    ));
                                              } else {
                                                firestoreBatch.set(
                                                    PricesRecord.collection
                                                        .doc(),
                                                    createPricesRecordData(
                                                      type: FFAppConstants
                                                          .userTypeApplicant,
                                                      price: double.tryParse(_model
                                                          .applicantPriceTextController
                                                          .text),
                                                    ));
                                              }

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Prices was saved successfully',
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
                                            } finally {
                                              await firestoreBatch.commit();
                                            }

                                            setState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'p8ucd6f3' /* Save */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
