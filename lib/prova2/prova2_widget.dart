import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'prova2_model.dart';
export 'prova2_model.dart';

class Prova2Widget extends StatefulWidget {
  const Prova2Widget({
    super.key,
    required this.eventRef,
    required this.eventId,
    required this.eventName,
  });

  final DocumentReference? eventRef;
  final String? eventId;
  final String? eventName;

  static String routeName = 'prova2';
  static String routePath = 'prova2';

  @override
  State<Prova2Widget> createState() => _Prova2WidgetState();
}

class _Prova2WidgetState extends State<Prova2Widget> {
  late Prova2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Prova2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'prova2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROVA2_PAGE_prova2_ON_INIT_STATE');
      logFirebaseEvent('prova2_navigate_to');

      context.pushNamed(
        SwipeUsersWidget.routeName,
        queryParameters: {
          'eventId': serializeParam(
            widget.eventId,
            ParamType.String,
          ),
          'eventRef': serializeParam(
            widget.eventRef,
            ParamType.DocumentReference,
          ),
          'eventName': serializeParam(
            widget.eventName,
            ParamType.String,
          ),
        }.withoutNulls,
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
