import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'upcoming_component_model.dart';
export 'upcoming_component_model.dart';

class UpcomingComponentWidget extends StatefulWidget {
  const UpcomingComponentWidget({super.key});

  @override
  State<UpcomingComponentWidget> createState() =>
      _UpcomingComponentWidgetState();
}

class _UpcomingComponentWidgetState extends State<UpcomingComponentWidget> {
  late UpcomingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpcomingComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'UPCOMING',
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
