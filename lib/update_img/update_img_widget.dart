import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'update_img_model.dart';
export 'update_img_model.dart';

class UpdateImgWidget extends StatefulWidget {
  const UpdateImgWidget({super.key});

  static String routeName = 'updateImg';
  static String routePath = 'updateImg';

  @override
  State<UpdateImgWidget> createState() => _UpdateImgWidgetState();
}

class _UpdateImgWidgetState extends State<UpdateImgWidget> {
  late UpdateImgModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateImgModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'updateImg'});
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: StreamBuilder<List<UpdateImgRecord>>(
              stream: queryUpdateImgRecord(),
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
                List<UpdateImgRecord> columnUpdateImgRecordList =
                    snapshot.data!;

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(columnUpdateImgRecordList.length,
                        (columnIndex) {
                      final columnUpdateImgRecord =
                          columnUpdateImgRecordList[columnIndex];
                      return StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(
                            columnUpdateImgRecord.userRef!),
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

                          final containerUsersRecord = snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    containerUsersRecord.photoUrl,
                                    width: MediaQuery.sizeOf(context).height *
                                        0.39,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.7,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  containerUsersRecord.email,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'UPDATE_IMG_PAGE_DELETE_BTN_ON_TAP');
                                      logFirebaseEvent('Button_backend_call');
                                      await columnUpdateImgRecord.reference
                                          .delete();
                                    },
                                    text: 'delete',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).divide(SizedBox(height: 30.0)),
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
