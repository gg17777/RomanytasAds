import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'delete_like_model.dart';
export 'delete_like_model.dart';

class DeleteLikeWidget extends StatefulWidget {
  const DeleteLikeWidget({
    super.key,
    required this.likeRef,
  });

  final DocumentReference? likeRef;

  @override
  State<DeleteLikeWidget> createState() => _DeleteLikeWidgetState();
}

class _DeleteLikeWidgetState extends State<DeleteLikeWidget>
    with TickerProviderStateMixin {
  late DeleteLikeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteLikeModel());

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
              logFirebaseEvent('DELETE_LIKE_Divider_ucx31jc9_ON_PAN_DOWN');
              logFirebaseEvent('Divider_bottom_sheet');
              Navigator.pop(context);
            },
            child: SizedBox(
              width: 20.0,
              child: Divider(
                thickness: 2.0,
                color: Color(0xFF94004D),
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
                    logFirebaseEvent('DELETE_LIKE_COMP_Row_xp08l4ll_ON_TAP');
                    logFirebaseEvent('Row_backend_call');
                    await widget.likeRef!.delete();
                    logFirebaseEvent('Row_update_app_state');

                    _model.updatePage(() {});
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
                        'Elimina',
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
