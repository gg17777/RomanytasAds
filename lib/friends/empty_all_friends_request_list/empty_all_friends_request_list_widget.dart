import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'empty_all_friends_request_list_model.dart';
export 'empty_all_friends_request_list_model.dart';

class EmptyAllFriendsRequestListWidget extends StatefulWidget {
  const EmptyAllFriendsRequestListWidget({super.key});

  @override
  State<EmptyAllFriendsRequestListWidget> createState() =>
      _EmptyAllFriendsRequestListWidgetState();
}

class _EmptyAllFriendsRequestListWidgetState
    extends State<EmptyAllFriendsRequestListWidget>
    with TickerProviderStateMixin {
  late EmptyAllFriendsRequestListModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyAllFriendsRequestListModel());

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.95, 0.95),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
      child: StreamBuilder<List<FriendsRequestRecord>>(
        stream: queryFriendsRequestRecord(
          queryBuilder: (friendsRequestRecord) => friendsRequestRecord
              .where(
                'Requestee',
                isEqualTo: currentUserReference,
              )
              .orderBy('dateSent', descending: true),
          singleRecord: true,
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
          List<FriendsRequestRecord> containerFriendsRequestRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final containerFriendsRequestRecord =
              containerFriendsRequestRecordList.isNotEmpty
                  ? containerFriendsRequestRecordList.first
                  : null;

          return Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Text(
                      'Nessuna nuova richiesta',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).accent1,
                            fontSize: 19.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Le richieste di amicizia che ti inviano le persone saranno visualizzate qui.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'EMPTY_ALL_FRIENDS_REQUEST_LIST_VEDI_I_SU');
                      logFirebaseEvent('Button_widget_animation');
                      if (animationsMap['buttonOnActionTriggerAnimation'] !=
                          null) {
                        await animationsMap['buttonOnActionTriggerAnimation']!
                            .controller
                            .forward(from: 0.0);
                      }
                      logFirebaseEvent('Button_widget_animation');
                      if (animationsMap['buttonOnActionTriggerAnimation'] !=
                          null) {
                        await animationsMap['buttonOnActionTriggerAnimation']!
                            .controller
                            .forward(from: 0.0);
                      }
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(FriendsSuggestionsWidget.routeName);
                    },
                    text: 'Vedi i suggerimenti di amicizia',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['buttonOnActionTriggerAnimation']!,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
