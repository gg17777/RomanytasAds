// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
import '/flutter_flow/flutter_flow_util.dart' as flutter;
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

class CustomMapWidget extends StatefulWidget {
  final List<CustomMarkerStruct> markerData;
  final double markerSize;
  final flutter.LatLng initialCenter;
  final double initialZoom;
  final bool allowInteraction;
  final bool allowZoom;
  final bool showZoomButtons;
  final bool showUserLocation;
  final bool showCompass;
  final bool showToolbar;
  final bool showTraffic;
  final bool centerOnMarkerTap;
  final Future<dynamic> Function(CustomMarkerStruct marker)? onMapMove;
  final double? width;
  final double? height;

  const CustomMapWidget({
    Key? key,
    required this.markerData,
    this.width,
    this.height,
    this.markerSize = 50.0,
    required this.initialCenter,
    this.initialZoom = 12.0,
    this.allowInteraction = true,
    this.allowZoom = true,
    this.showZoomButtons = false,
    this.showUserLocation = false,
    this.showCompass = false,
    this.showToolbar = false,
    this.showTraffic = false,
    this.centerOnMarkerTap = false,
    this.onMapMove,
  }) : super(key: key);

  @override
  _CustomMapWidgetState createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends State<CustomMapWidget> {
  late GoogleMapController _controller;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<BitmapDescriptor> _loadNetworkImage(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final ui.Codec codec = await ui.instantiateImageCodec(
        response.bodyBytes,
        targetWidth: widget.markerSize.toInt() * 3,
        targetHeight: widget.markerSize.toInt() * 3,
      );
      final ui.FrameInfo frameInfo = await codec.getNextFrame();
      final byteData = await frameInfo.image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      if (byteData != null) {
        return BitmapDescriptor.bytes(byteData.buffer.asUint8List(),
            width: widget.markerSize, height: widget.markerSize);
      }
    }
    return BitmapDescriptor.defaultMarker;
  }

  void _loadMarkers() async {
    Set<Marker> markers = {};
    for (var markerStruct in widget.markerData) {
      try {
        final icon =
            await _loadNetworkImage(_getMarkerImage(markerStruct.type));
        if (markerStruct.position != null) {
          markers.add(
            Marker(
              markerId: MarkerId(markerStruct.position.toString()),
              position: google.LatLng(
                markerStruct.position!.latitude,
                markerStruct.position!.longitude,
              ),
              icon: icon,
              onTap: () {
                if (widget.centerOnMarkerTap) {
                  _controller
                      .animateCamera(CameraUpdate.newLatLng(google.LatLng(
                    markerStruct.position!.latitude,
                    markerStruct.position!.longitude,
                  )));
                }
              },
            ),
          );
        }
      } catch (e) {
        print("::::looking for: ${e}");
      }
    }

    if (markers.isNotEmpty) {
      setState(() {
        _markers = markers;
      });
    }
  }

  String _getMarkerImage(String type) {
    switch (type) {
      case 'Serate':
        return "https://i.postimg.cc/mkV6xrcz/maps-2-purple2.png";
      case 'Eventi':
        return "https://i.postimg.cc/mkV6xrcz/maps-2-purple2.png";
      case 'meetUpPlaces':
        return "https://i.postimg.cc/PJdFFDqn/meetUp.png";
      default:
        return "https://i.postimg.cc/mkV6xrcz/maps-2-purple2.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: google.LatLng(
              widget.initialCenter.latitude, widget.initialCenter.longitude),
          zoom: widget.initialZoom,
        ),
        markers: _markers,
        onMapCreated: (controller) => _controller = controller,
        onCameraMove: (position) {
          if (widget.onMapMove != null) {
            CustomMarkerStruct customMarker = widget.markerData.firstWhere(
                (e) =>
                    e.position?.latitude == position.target.latitude &&
                    e.position?.longitude == position.target.longitude,
                orElse: () => CustomMarkerStruct());
            if (customMarker.id.isNotEmpty) {
              widget.onMapMove!(CustomMarkerStruct(
                  position: flutter.LatLng(
                      position.target.latitude, position.target.longitude)));
            }
          }
        },
        zoomGesturesEnabled: widget.allowZoom,
        zoomControlsEnabled: widget.showZoomButtons,
        myLocationEnabled: widget.showUserLocation,
        compassEnabled: widget.showCompass,
        mapToolbarEnabled: widget.showToolbar,
        trafficEnabled: widget.showTraffic,
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
