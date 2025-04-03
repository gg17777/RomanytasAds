import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'delete_request_model.dart';
export 'delete_request_model.dart';

class DeleteRequestWidget extends StatefulWidget {
  const DeleteRequestWidget({
    super.key,
    required this.requestRef,
  });

  final DocumentReference? requestRef;

  @override
  State<DeleteRequestWidget> createState() => _DeleteRequestWidgetState();
}

class _DeleteRequestWidgetState extends State<DeleteRequestWidget>
    with TickerProviderStateMixin {
  late DeleteRequestModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteRequestModel());

    animationsMap.addAll({
      'rowOnActionTriggerAnimation': AnimationInfo(
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
    return Container(
      width: double.infinity,
      height: 140.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onPanDown: (details) async {
              logFirebaseEvent('DELETE_REQUEST_Divider_g0li77nt_ON_PAN_D');
              logFirebaseEvent('Divider_bottom_sheet');
              Navigator.pop(context);
            },
            child: SizedBox(
              width: 20.0,
              child: Divider(
                thickness: 2.0,
                color: Color(0xFF94040D),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Divider(
                thickness: 1.0,
                color: Color(0xFF94040D),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 70.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('DELETE_REQUEST_COMP_Row_og7n5en7_ON_TAP');
                    logFirebaseEvent('Row_backend_call');
                    await widget.requestRef!.delete();
                    logFirebaseEvent('Row_haptic_feedback');
                    HapticFeedback.lightImpact();
                    logFirebaseEvent('Row_bottom_sheet');
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Annulla richiesta',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF94040D),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Icon(
                        Icons.delete_rounded,
                        color: Color(0xFF94040D),
                        size: 28.0,
                      ),
                    ],
                  ),
                ).animateOnActionTrigger(
                  animationsMap['rowOnActionTriggerAnimation']!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
