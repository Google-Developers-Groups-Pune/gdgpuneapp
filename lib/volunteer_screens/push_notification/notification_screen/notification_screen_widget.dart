import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/main_nav_bar_widget.dart';
import '/components/send_btn_component/send_btn_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notification_screen_model.dart';
export 'notification_screen_model.dart';

class NotificationScreenWidget extends StatefulWidget {
  const NotificationScreenWidget({super.key});

  @override
  State<NotificationScreenWidget> createState() =>
      _NotificationScreenWidgetState();
}

class _NotificationScreenWidgetState extends State<NotificationScreenWidget> {
  late NotificationScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationScreenModel());

    _model.notificationTitleTextController ??= TextEditingController();
    _model.notificationTitleFocusNode ??= FocusNode();

    _model.notificationDescriptionTextController ??= TextEditingController();
    _model.notificationDescriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                      'Notification',
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
                    onPressed: () {
                      print('qrBtn pressed ...');
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
              Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Title',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 18.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller:
                                    _model.notificationTitleTextController,
                                focusNode: _model.notificationTitleFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Title',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xA457636C),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                maxLines: 2,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .notificationTitleTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Description',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 18.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model
                                    .notificationDescriptionTextController,
                                focusNode:
                                    _model.notificationDescriptionFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Description',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xA457636C),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                maxLines: 6,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .notificationDescriptionTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(null),
                              options: const [
                                'Speakers',
                                'All Users',
                                'Volunteers Level 1',
                                'Organizers',
                                'Attendees',
                                'Volunteers Level 2'
                              ],
                              onChanged: (val) => safeSetState(
                                  () => _model.dropDownValue = val),
                              width: 200.0,
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Select user segment..',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 32.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.dropDownValue == 'Speakers') {
                            _model.speakers = await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'roles',
                                arrayContains: FFAppConstants.loginTypeSpeaker,
                              ),
                            );
                            _model.userSegement = _model.speakers!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          } else if (_model.dropDownValue ==
                              'Volunteers Level 1') {
                            _model.volunteerUsers1 = await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'roles',
                                arrayContains:
                                    FFAppConstants.loginTypeVolunteerlvl1,
                              ),
                            );
                            _model.userSegement = _model.volunteerUsers1!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          } else if (_model.dropDownValue == 'Organizers') {
                            _model.orgainzerUsers = await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'roles',
                                arrayContains: FFAppConstants.organizerRole,
                              ),
                            );
                            _model.userSegement = _model.orgainzerUsers!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          } else if (_model.dropDownValue == 'Attendees') {
                            _model.attendeeUsers = await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'roles',
                                arrayContains: FFAppConstants.loginTypeAttendee,
                              ),
                            );
                            _model.userSegement = _model.attendeeUsers!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          } else if (_model.dropDownValue ==
                              'Volunteers Level 2') {
                            _model.volunteerUsers2 = await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'roles',
                                arrayContains:
                                    FFAppConstants.loginTypeVolunteerlvl2,
                              ),
                            );
                            _model.userSegement = _model.volunteerUsers2!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          } else {
                            _model.allusers = await queryUsersRecordOnce();
                            _model.userSegement = _model.allusers!
                                .map((e) => e.reference)
                                .toList()
                                .cast<DocumentReference>();
                            safeSetState(() {});
                          }

                          triggerPushNotification(
                            notificationTitle:
                                _model.notificationTitleTextController.text,
                            notificationText: _model
                                .notificationDescriptionTextController.text,
                            notificationSound: 'default',
                            userRefs: _model.userSegement.toList(),
                            initialPageName: 'UserHomePage',
                            parameterData: {},
                          );

                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.sendBtnComponentModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const SendBtnComponentWidget(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              wrapWithModel(
                model: _model.mainNavBarModel,
                updateCallback: () => safeSetState(() {}),
                child: MainNavBarWidget(
                  pageIndex: 4,
                  loginType: () {
                    if (FFAppState()
                        .loggedInUser
                        .roles
                        .contains(FFAppConstants.loginTypeVolunteerlvl1)) {
                      return FFAppConstants.loginTypeVolunteer;
                    } else if (FFAppState()
                        .loggedInUser
                        .roles
                        .contains(FFAppConstants.loginTypeVolunteerlvl2)) {
                      return FFAppConstants.loginTypeVolunteer;
                    } else if (FFAppState()
                        .loggedInUser
                        .roles
                        .contains(FFAppConstants.organizerRole)) {
                      return FFAppConstants.loginTypeVolunteer;
                    } else {
                      return FFAppConstants.loginTypeAttendee;
                    }
                  }(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
