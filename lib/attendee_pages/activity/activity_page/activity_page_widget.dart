import '/backend/backend.dart';
import '/components/ended_component/ended_component_widget.dart';
import '/components/live_component/live_component_widget.dart';
import '/components/main_nav_bar_widget.dart';
import '/components/upcoming_component/upcoming_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'activity_page_model.dart';
export 'activity_page_model.dart';

class ActivityPageWidget extends StatefulWidget {
  const ActivityPageWidget({super.key});

  @override
  State<ActivityPageWidget> createState() => _ActivityPageWidgetState();
}

class _ActivityPageWidgetState extends State<ActivityPageWidget> {
  late ActivityPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivityPageModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Activity',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 570.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          ActivityRecord>.separated(
                        pagingController: _model.setListViewController(
                          ActivityRecord.collection.where(
                            'event',
                            isEqualTo: FFAppState().eventName,
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          16.0,
                          0,
                          58.0,
                        ),
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                        builderDelegate:
                            PagedChildBuilderDelegate<ActivityRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
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
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
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

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewActivityRecord = _model
                                .listViewPagingController!
                                .itemList![listViewIndex];
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 0.5,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (listViewActivityRecord.image != '')
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                      child: Image.network(
                                        listViewActivityRecord.image,
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.jpg',
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.2,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                listViewActivityRecord.title,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              if (listViewActivityRecord
                                                          .status !=
                                                      '')
                                                Stack(
                                                  children: [
                                                    if (listViewActivityRecord
                                                            .status ==
                                                        FFAppState()
                                                            .liveEventStatus)
                                                      LiveComponentWidget(
                                                        key: Key(
                                                            'Key008_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                                      ),
                                                    if (listViewActivityRecord
                                                            .status ==
                                                        FFAppState()
                                                            .upcomingEventStatus)
                                                      UpcomingComponentWidget(
                                                        key: Key(
                                                            'Key1oz_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                                      ),
                                                    if (listViewActivityRecord
                                                            .status ==
                                                        FFAppState()
                                                            .endedEventStatus)
                                                      EndedComponentWidget(
                                                        key: Key(
                                                            'Keypvs_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                                      ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                          Text(
                                            listViewActivityRecord.description,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.access_time,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 20.0,
                                                  ),
                                                  Text(
                                                    listViewActivityRecord.time,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 20.0,
                                                  ),
                                                  Text(
                                                    listViewActivityRecord
                                                        .location,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.mainNavBarModel,
                updateCallback: () => safeSetState(() {}),
                child: const MainNavBarWidget(
                  pageIndex: 2,
                  loginType: FFAppConstants.loginTypeAttendee,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
