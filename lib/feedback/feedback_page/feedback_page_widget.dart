import '/backend/backend.dart';
import '/feedback/feedback_item/feedback_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'feedback_page_model.dart';
export 'feedback_page_model.dart';

class FeedbackPageWidget extends StatefulWidget {
  const FeedbackPageWidget({super.key});

  @override
  State<FeedbackPageWidget> createState() => _FeedbackPageWidgetState();
}

class _FeedbackPageWidgetState extends State<FeedbackPageWidget> {
  late FeedbackPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.feedBackQuestionsOutput = await queryFeedbackQuestionsRecordOnce(
        queryBuilder: (feedbackQuestionsRecord) =>
            feedbackQuestionsRecord.where(
          'event',
          isEqualTo: FFAppState().eventName,
        ),
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Feedback',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Inter Tight',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 2.25,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Builder(
              builder: (context) {
                final feedbackListItem =
                    _model.feedBackQuestionsOutput?.toList() ?? [];

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: feedbackListItem.length,
                  itemBuilder: (context, feedbackListItemIndex) {
                    final feedbackListItemItem =
                        feedbackListItem[feedbackListItemIndex];
                    return Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        height: 200.0,
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FeedbackItemWidget(
                            key: Key(
                                'Keyh2e_${feedbackListItemIndex}_of_${feedbackListItem.length}'),
                            feedbackQuestion: feedbackListItemItem
                                .questions[feedbackListItemIndex],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
