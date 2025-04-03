import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'not_me_in_photo_model.dart';
export 'not_me_in_photo_model.dart';

class NotMeInPhotoWidget extends StatefulWidget {
  const NotMeInPhotoWidget({
    super.key,
    required this.photoRef,
    required this.eventRef,
  });

  final DocumentReference? photoRef;
  final DocumentReference? eventRef;

  @override
  State<NotMeInPhotoWidget> createState() => _NotMeInPhotoWidgetState();
}

class _NotMeInPhotoWidgetState extends State<NotMeInPhotoWidget> {
  late NotMeInPhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotMeInPhotoModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 30.0,
              child: Divider(
                height: 30.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
              child: Text(
                'Può succedere che l\'AI commetta degli errori, se non sei tu la persona in foto puoi eliminare la foto dalla tua galleria',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).tertiary,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 50.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NOT_ME_IN_PHOTO_Container_mzvm9kkq_ON_TA');
                  logFirebaseEvent('Container_backend_call');

                  await widget.photoRef!.update({
                    ...mapToFirestore(
                      {
                        'users_in_photos':
                            FieldValue.arrayRemove([currentUserReference]),
                      },
                    ),
                  });
                  logFirebaseEvent('Container_backend_call');

                  await NotMeInPhotoCountRecord.collection
                      .doc()
                      .set(createNotMeInPhotoCountRecordData(
                        photoRef: widget.photoRef,
                        userRef: currentUserReference,
                        date: getCurrentTimestamp,
                      ));
                  logFirebaseEvent('Container_navigate_to');

                  context.pushNamed(
                    MyPhotosWidget.routeName,
                    queryParameters: {
                      'eventId': serializeParam(
                        widget.eventRef?.id,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Elimina',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).tertiary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
