import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ReverseGeocodingCall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? lng,
  }) async {
    final ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reverse geocoding',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=AIzaSyACRpaHgchOwbEAZ1bK7SySyzWD_oGhg3Q',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.results[0].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ReverseGeocodingCopyCall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? lng,
  }) async {
    final ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reverse geocoding Copy',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=AIzaSyACRpaHgchOwbEAZ1bK7SySyzWD_oGhg3Q',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.results[0].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class IncrementViewsCall {
  static Future<ApiCallResponse> call({
    String? collectionId = '',
    String? docId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "collectionId": "${collectionId}",
  "docId": "${docId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'incrementViews',
      apiUrl:
          'https://us-central1-romanita-5nlemi.cloudfunctions.net/incrementViews',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
