import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'video_event_model.dart';
export 'video_event_model.dart';

class VideoEventWidget extends StatefulWidget {
  const VideoEventWidget({
    super.key,
    required this.eventRef,
  });

  final DocumentReference? eventRef;

  static String routeName = 'videoEvent';
  static String routePath = 'videoEvent';

  @override
  State<VideoEventWidget> createState() => _VideoEventWidgetState();
}

class _VideoEventWidgetState extends State<VideoEventWidget> {
  late VideoEventModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoEventModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'videoEvent'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EventiRecord>(
      stream: EventiRecord.getDocument(widget.eventRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 25.0,
                ),
              ),
            ),
          );
        }

        final videoEventEventiRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Colors.black,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('VIDEO_EVENT_keyboard_arrow_left_ICN_ON_T');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Video evento',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowVideoPlayer(
                path: videoEventEventiRecord.videoPath,
                videoType: VideoType.network,
                width: MediaQuery.sizeOf(context).width * 1.14,
                height: MediaQuery.sizeOf(context).height * 1.0,
                aspectRatio: 0.56,
                autoPlay: true,
                looping: true,
                showControls: false,
                allowFullScreen: false,
                allowPlaybackSpeedMenu: false,
              ),
            ),
          ),
        );
      },
    );
  }
}
