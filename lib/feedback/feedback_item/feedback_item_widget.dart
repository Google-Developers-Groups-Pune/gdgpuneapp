import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'feedback_item_model.dart';
export 'feedback_item_model.dart';

class FeedbackItemWidget extends StatefulWidget {
  const FeedbackItemWidget({
    super.key,
    required this.feedbackQuestion,
    required this.componentIndex,
  });

  final QuestionsStruct? feedbackQuestion;
  final int? componentIndex;

  @override
  State<FeedbackItemWidget> createState() => _FeedbackItemWidgetState();
}

class _FeedbackItemWidgetState extends State<FeedbackItemWidget> {
  late FeedbackItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().insertAtIndexInFeedbackAnswers(
          widget.componentIndex!,
          FeedbacksStruct(
            question: widget.feedbackQuestion?.question,
            type: widget.feedbackQuestion?.type,
            answer: null,
          ));
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        FFAppState().updateFeedbackAnswersAtIndex(
          widget.componentIndex!,
          (e) => e..answer = _model.textController.text,
        );
        safeSetState(() {});
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.feedbackQuestion?.question,
                'NA',
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Stack(
            children: [
              if (widget.feedbackQuestion?.type ==
                  FFAppState().feedbackItemRating)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: RatingBar.builder(
                      onRatingUpdate: (newValue) {
                        safeSetState(() => _model.ratingBarValue = newValue);
                        FFAppState().updateFeedbackAnswersAtIndex(
                          widget.componentIndex!,
                          (e) => e..answer = _model.ratingBarValue.toString(),
                        );
                        safeSetState(() {});
                      },
                      itemBuilder: (context, index) => FaIcon(
                        FontAwesomeIcons.star,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      direction: Axis.horizontal,
                      initialRating: _model.ratingBarValue ??= 0.0,
                      unratedColor: FlutterFlowTheme.of(context).secondaryText,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 28.0, 0.0),
                      itemSize: 24.0,
                      glowColor: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              if (widget.feedbackQuestion?.type ==
                  FFAppState().feedbackItemText)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  lineHeight: 5.0,
                                ),
                        hintText: 'TextField',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
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
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                      maxLines: 6,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
