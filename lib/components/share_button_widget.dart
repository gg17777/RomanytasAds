import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'share_button_model.dart';
export 'share_button_model.dart';

class ShareButtonWidget extends StatefulWidget {
  const ShareButtonWidget({
    super.key,
    required this.discoRef,
  });

  final DocumentReference? discoRef;

  @override
  State<ShareButtonWidget> createState() => _ShareButtonWidgetState();
}

class _ShareButtonWidgetState extends State<ShareButtonWidget> {
  late ShareButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShareButtonModel());

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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 130.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) => StreamBuilder<SerateRecord>(
              stream: SerateRecord.getDocument(widget.discoRef!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }

                final buttonSerateRecord = snapshot.data!;

                return FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('SHARE_BUTTON_COMP_CONDIVIDI_BTN_ON_TAP');
                    logFirebaseEvent('Button_generate_current_page_link');
                    _model.currentPageLink = await generateCurrentPageLink(
                      context,
                      title: buttonSerateRecord.titolo,
                      imageUrl: buttonSerateRecord.locandina,
                      description: buttonSerateRecord.descrizione,
                      isShortLink: false,
                      forceRedirect: true,
                    );

                    logFirebaseEvent('Button_share');
                    await Share.share(
                      _model.currentPageLink,
                      sharePositionOrigin: getWidgetBoundingBox(context),
                    );
                  },
                  text: 'Condividi',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                );
              },
            ),
          ),
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Annulla',
            options: FFButtonOptions(
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(const SizedBox(width: 30.0)),
      ),
    );
  }
}
