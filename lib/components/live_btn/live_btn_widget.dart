import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'live_btn_model.dart';
export 'live_btn_model.dart';

class LiveBtnWidget extends StatefulWidget {
  const LiveBtnWidget({super.key});

  @override
  State<LiveBtnWidget> createState() => _LiveBtnWidgetState();
}

class _LiveBtnWidgetState extends State<LiveBtnWidget> {
  late LiveBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveBtnModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: 'Live',
      options: FFButtonOptions(
        width: 50.0,
        height: 20.0,
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: const Color(0xFFFF0000),
        textStyle: FlutterFlowTheme.of(context).titleMedium.override(
              fontFamily: 'Roboto',
              color: FlutterFlowTheme.of(context).primaryBackground,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
