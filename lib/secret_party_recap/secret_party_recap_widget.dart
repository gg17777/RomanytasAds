import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'secret_party_recap_model.dart';
export 'secret_party_recap_model.dart';

class SecretPartyRecapWidget extends StatefulWidget {
  const SecretPartyRecapWidget({super.key});

  static String routeName = 'secret_party_recap';
  static String routePath = 'secretPartyRecap';

  @override
  State<SecretPartyRecapWidget> createState() => _SecretPartyRecapWidgetState();
}

class _SecretPartyRecapWidgetState extends State<SecretPartyRecapWidget> {
  late SecretPartyRecapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecretPartyRecapModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'secret_party_recap'});
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
            children: [],
          ),
        ),
      ),
    );
  }
}
