import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'load_page_logged_out_model.dart';
export 'load_page_logged_out_model.dart';

class LoadPageLoggedOutWidget extends StatefulWidget {
  const LoadPageLoggedOutWidget({super.key});

  static String routeName = 'loadPageLoggedOut';
  static String routePath = 'loadPageLoggedOut';

  @override
  State<LoadPageLoggedOutWidget> createState() =>
      _LoadPageLoggedOutWidgetState();
}

class _LoadPageLoggedOutWidgetState extends State<LoadPageLoggedOutWidget> {
  late LoadPageLoggedOutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadPageLoggedOutModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'loadPageLoggedOut'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOAD_LOGGED_OUT_loadPageLoggedOut_ON_INI');
      logFirebaseEvent('loadPageLoggedOut_update_app_state');
      FFAppState().curTime = functions.getDate('all');
      safeSetState(() {});
      logFirebaseEvent('loadPageLoggedOut_navigate_to');

      context.goNamed(
        EventiHomeLogOutWidget.routeName,
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );

      logFirebaseEvent('loadPageLoggedOut_update_app_state');
      FFAppState().page = 'events';
      safeSetState(() {});
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
            children: [],
          ),
        ),
      ),
    );
  }
}
