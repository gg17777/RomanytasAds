import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

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

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
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
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/LOGO_TONDO.png',
              width: 100.0,
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
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'nasoniMap': ParameterData.none(),
  'DiscotecaProfile': (data) async => ParameterData(
        allParams: {
          'serataRef': getParameter<DocumentReference>(data, 'serataRef'),
        },
      ),
  'EventiProfile': (data) async => ParameterData(
        allParams: {
          'eventoRef': getParameter<DocumentReference>(data, 'eventoRef'),
        },
      ),
  'MostreProfile': (data) async => ParameterData(
        allParams: {
          'mostreRef': getParameter<DocumentReference>(data, 'mostreRef'),
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
  'impostazioniAccount': ParameterData.none(),
  'resetPassword': ParameterData.none(),
  'mappaDiscoteche': ParameterData.none(),
  'eventiHome': ParameterData.none(),
  'Segnalazione': ParameterData.none(),
  'loadPage': ParameterData.none(),
  'auth12': ParameterData.none(),
  'mappaEventi': ParameterData.none(),
  'mappaMostre': ParameterData.none(),
  'prova': ParameterData.none(),
  'eventiList': ParameterData.none(),
  'discotecheList': ParameterData.none(),
  'concertiList': ParameterData.none(),
  'mostreList': ParameterData.none(),
  'evntiHome2': ParameterData.none(),
  'concertoInEvidenzaProfile': (data) async => ParameterData(
        allParams: {
          'concertoInEveidenzaRef':
              getParameter<DocumentReference>(data, 'concertoInEveidenzaRef'),
        },
      ),
  'segnalazioneCibo': ParameterData.none(),
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
