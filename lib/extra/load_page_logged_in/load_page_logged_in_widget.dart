import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'load_page_logged_in_model.dart';
export 'load_page_logged_in_model.dart';

class LoadPageLoggedInWidget extends StatefulWidget {
  const LoadPageLoggedInWidget({super.key});

  static String routeName = 'loadPageLoggedIn';
  static String routePath = 'loadPageLoggedIn';

  @override
  State<LoadPageLoggedInWidget> createState() => _LoadPageLoggedInWidgetState();
}

class _LoadPageLoggedInWidgetState extends State<LoadPageLoggedInWidget> {
  late LoadPageLoggedInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadPageLoggedInModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'loadPageLoggedIn'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      logFirebaseEvent('LOAD_LOGGED_IN_loadPageLoggedIn_ON_INIT_');
      logFirebaseEvent('loadPageLoggedIn_update_app_state');
      FFAppState().curTime = functions.getDate('all');
      safeSetState(() {});
      logFirebaseEvent('loadPageLoggedIn_navigate_to');

      context.goNamed(
        EventiHomeWidget.routeName,
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );

      logFirebaseEvent('loadPageLoggedIn_update_app_state');
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
