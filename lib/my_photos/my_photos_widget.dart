import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/friends/empty_photo_list/empty_photo_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'my_photos_model.dart';
export 'my_photos_model.dart';

class MyPhotosWidget extends StatefulWidget {
  const MyPhotosWidget({
    super.key,
    required this.eventId,
  });

  final String? eventId;

  static String routeName = 'myPhotos';
  static String routePath = 'myPhotos';

  @override
  State<MyPhotosWidget> createState() => _MyPhotosWidgetState();
}

class _MyPhotosWidgetState extends State<MyPhotosWidget> {
  late MyPhotosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyPhotosModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'myPhotos'});
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
        body: StreamBuilder<List<PhotosEventRecord>>(
          stream: queryPhotosEventRecord(
            parent: functions.getEventiRef(widget.eventId!),
            queryBuilder: (photosEventRecord) => photosEventRecord
                .where(
                  'users_in_photos',
                  arrayContains: currentUserReference,
                )
                .orderBy('created_time', descending: true),
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
            List<PhotosEventRecord> containerPhotosEventRecordList =
                snapshot.data!;

            return Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MY_PHOTOS_PAGE_Icon_xts4z7vt_ON_TAP');
                                  logFirebaseEvent('Icon_navigate_to');

                                  context.pushNamed(
                                    MyEventsWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.leftToRight,
                                      ),
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.chevron_left_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 66.0, 0.0, 0.0),
                          child: Text(
                            'Le mie foto',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  if (containerPhotosEventRecordList.length > 0)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: Text(
                        'Le foto riportate sono solamente quelle dove sei presente. Il sistema può commettere errori, se trovi una foto non tua puoi eliminarla.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).tertiary,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final photos =
                              containerPhotosEventRecordList.toList();
                          if (photos.isEmpty) {
                            return EmptyPhotoListWidget();
                          }

                          return GridView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              10.0,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: photos.length,
                            itemBuilder: (context, photosIndex) {
                              final photosItem = photos[photosIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'MY_PHOTOS_PAGE_Image_gorp6zt5_ON_TAP');
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed(
                                    PhotoWidget.routeName,
                                    queryParameters: {
                                      'photoRef': serializeParam(
                                        photosItem.reference,
                                        ParamType.DocumentReference,
                                      ),
                                      'eventRef': serializeParam(
                                        functions
                                            .getEventiRef(widget.eventId!),
                                        ParamType.DocumentReference,
                                      ),
                                      'numUsersInPhoto': serializeParam(
                                        photosItem.usersInPhotos.length,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    photosItem.image,
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
