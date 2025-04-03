import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/friends/empty_my_lists_list/empty_my_lists_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'prova_model.dart';
export 'prova_model.dart';

class ProvaWidget extends StatefulWidget {
  const ProvaWidget({super.key});

  static String routeName = 'prova';
  static String routePath = 'prova';

  @override
  State<ProvaWidget> createState() => _ProvaWidgetState();
}

class _ProvaWidgetState extends State<ProvaWidget> {
  late ProvaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProvaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'prova'});
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: StreamBuilder<List<ListaEventiRecord>>(
              stream: queryListaEventiRecord(
                queryBuilder: (listaEventiRecord) => listaEventiRecord
                    .where(
                      'userRef',
                      isEqualTo: currentUserReference,
                      isNull: (currentUserReference) == null,
                    )
                    .orderBy('event_date', descending: true),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: SpinKitFadingCircle(
                        color: FlutterFlowTheme.of(context).alternate,
                        size: 25.0,
                      ),
                    ),
                  );
                }
                List<ListaEventiRecord> columnListaEventiRecordList =
                    snapshot.data!;
                if (columnListaEventiRecordList.isEmpty) {
                  return EmptyMyListsListWidget();
                }

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(columnListaEventiRecordList.length,
                        (columnIndex) {
                      final columnListaEventiRecord =
                          columnListaEventiRecordList[columnIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              columnListaEventiRecord.nome,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      );
                    }).divide(SizedBox(height: 20.0)),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
