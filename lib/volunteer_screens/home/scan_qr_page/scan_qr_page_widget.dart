import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/main_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'scan_qr_page_model.dart';
export 'scan_qr_page_model.dart';

class ScanQrPageWidget extends StatefulWidget {
  const ScanQrPageWidget({super.key});

  @override
  State<ScanQrPageWidget> createState() => _ScanQrPageWidgetState();
}

class _ScanQrPageWidgetState extends State<ScanQrPageWidget> {
  late ScanQrPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanQrPageModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.person,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 23.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Scan QR',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.location_on,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 23.0,
                    ),
                    onPressed: () {
                      print('locationBtn pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.notifications_active,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 23.0,
                    ),
                    onPressed: () {
                      print('notificationBtn pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.qr_code,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 23.0,
                    ),
                    onPressed: () async {
                      _model.outputQrData = await queryQrRecordOnce(
                        queryBuilder: (qrRecord) => qrRecord.where(
                          'attendee_email',
                          isEqualTo: currentUserEmail,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);

                      context.pushNamed(
                        'UserQRCodeListPage',
                        queryParameters: {
                          'qrData': serializeParam(
                            _model.outputQrData,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'qrData': _model.outputQrData,
                        },
                      );

                      safeSetState(() {});
                    },
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('qrScanner');
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 35.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Scan QR',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        letterSpacing: 0.0,
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
              wrapWithModel(
                model: _model.mainNavBarModel,
                updateCallback: () => safeSetState(() {}),
                child: const MainNavBarWidget(
                  pageIndex: 1,
                  loginType: FFAppConstants.loginTypeVolunteer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
