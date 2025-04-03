import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/Untitled_design_(52).png',
              width: 175.0,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'nasoniMap': ParameterData.none(),
  'EventiProfile': (data) async => ParameterData(
        allParams: {
          'eventoRef': getParameter<DocumentReference>(data, 'eventoRef'),
          'goBack': getParameter<String>(data, 'goBack'),
        },
      ),
  'ConcertoProfile': (data) async => ParameterData(
        allParams: {
          'concertoRef': getParameter<DocumentReference>(data, 'concertoRef'),
        },
      ),
  'banglaMap': ParameterData.none(),
  'ciboMap': ParameterData.none(),
  'Profilo': ParameterData.none(),
  'segnalazioneNasoni': ParameterData.none(),
  'SegnalazioneBangla': ParameterData.none(),
  'modify_data_profile': ParameterData.none(),
  'resetPassword': ParameterData.none(),
  'eventiHome': ParameterData.none(),
  'Segnalazione': ParameterData.none(),
  'loadPageLoggedIn': ParameterData.none(),
  'mapEvents': ParameterData.none(),
  'eventiListHome': ParameterData.none(),
  'concertiList': ParameterData.none(),
  'segnalazioneCibo': ParameterData.none(),
  'friendsMap': ParameterData.none(),
  'searchPage': ParameterData.none(),
  'friendsRequests': ParameterData.none(),
  'friendsRequestsAll': ParameterData.none(),
  'friendsSuggestions': ParameterData.none(),
  'friendsList': ParameterData.none(),
  'newPhotoProfile': ParameterData.none(),
  'mappaEventiFriends': ParameterData.none(),
  'synchroniseContacts': ParameterData.none(),
  'contactsBulkSent': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'userProfileSearched': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'ContactsPage': ParameterData.none(),
  'userPhone': ParameterData.none(),
  'missingDetailsPage': ParameterData.none(),
  'synchroniseContactsAgain': ParameterData.none(),
  'videoEvent': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
        },
      ),
  'chooseCity': ParameterData.none(),
  'loadPageLoggedOut': ParameterData.none(),
  'test': ParameterData.none(),
  'swipe_users': (data) async => ParameterData(
        allParams: {
          'eventId': getParameter<String>(data, 'eventId'),
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
          'eventName': getParameter<String>(data, 'eventName'),
        },
      ),
  'settings': ParameterData.none(),
  'privacy_account': ParameterData.none(),
  'main_matches_page': ParameterData.none(),
  'participatingListEvent100': (data) async => ParameterData(
        allParams: {
          'eventoRef': getParameter<DocumentReference>(data, 'eventoRef'),
          'blink': getParameter<bool>(data, 'blink'),
          'eventName': getParameter<String>(data, 'eventName'),
          'eventDoc': await getDocumentParameter<EventiRecord>(
              data, 'eventDoc', EventiRecord.fromSnapshot),
        },
      ),
  'filter_swipes': (data) async => ParameterData(
        allParams: {
          'eventId': getParameter<DocumentReference>(data, 'eventId'),
          'eventName': getParameter<String>(data, 'eventName'),
        },
      ),
  'edit_filters_swipes': ParameterData.none(),
  'tutorial_swipe': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
          'blink': getParameter<bool>(data, 'blink'),
          'eventName': getParameter<String>(data, 'eventName'),
          'eventType': getParameter<String>(data, 'eventType'),
        },
      ),
  'tutorial_participate': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
          'outOrIn': getParameter<String>(data, 'outOrIn'),
          'eventType': getParameter<String>(data, 'eventType'),
          'eventDoc': await getDocumentParameter<EventiRecord>(
              data, 'eventDoc', EventiRecord.fromSnapshot),
        },
      ),
  'blocked_users': ParameterData.none(),
  'privacy_policy': ParameterData.none(),
  'privacy_policy_popUp': ParameterData.none(),
  'prova2': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
          'eventId': getParameter<String>(data, 'eventId'),
          'eventName': getParameter<String>(data, 'eventName'),
        },
      ),
  'secret_parties_home': ParameterData.none(),
  'create_secret_party': ParameterData.none(),
  'secret_party_recap': ParameterData.none(),
  'swipe_usersCopy': (data) async => ParameterData(
        allParams: {
          'eventId': getParameter<String>(data, 'eventId'),
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
          'eventName': getParameter<String>(data, 'eventName'),
        },
      ),
  'myPhotos': (data) async => ParameterData(
        allParams: {
          'eventId': getParameter<String>(data, 'eventId'),
        },
      ),
  'notifications_settings': ParameterData.none(),
  'my_events': ParameterData.none(),
  'past_participants_events': (data) async => ParameterData(
        allParams: {
          'eventoRef': getParameter<DocumentReference>(data, 'eventoRef'),
        },
      ),
  'photo': (data) async => ParameterData(
        allParams: {
          'photoRef': getParameter<DocumentReference>(data, 'photoRef'),
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
          'numUsersInPhoto': getParameter<int>(data, 'numUsersInPhoto'),
        },
      ),
  'LogIn': ParameterData.none(),
  'CreateAccount': ParameterData.none(),
  'modify_email': ParameterData.none(),
  'modify_name': ParameterData.none(),
  'modify_bio': ParameterData.none(),
  'name_lastname_photo': ParameterData.none(),
  'modify_uni': ParameterData.none(),
  'drink_saltafila': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
        },
      ),
  'EventiProfileLogOut': (data) async => ParameterData(
        allParams: {
          'eventoRef': getParameter<DocumentReference>(data, 'eventoRef'),
          'goBack': getParameter<String>(data, 'goBack'),
        },
      ),
  'manager_profile': (data) async => ParameterData(
        allParams: {
          'managerRef': getParameter<DocumentReference>(data, 'managerRef'),
        },
      ),
  'friendsListUser': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'all_matches': ParameterData.none(),
  'all_likes': ParameterData.none(),
  'all_friends_requests': ParameterData.none(),
  'eventiHomeLogOut': ParameterData.none(),
  'buyTicket': (data) async => ParameterData(
        allParams: {
          'eventRef': getParameter<DocumentReference>(data, 'eventRef'),
        },
      ),
  'my_eventsCopy': ParameterData.none(),
  'prova': ParameterData.none(),
  'updateImg': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
