import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/concerti_record.dart';
import 'schema/serate_record.dart';
import 'schema/segnalazioni_nasoni_record.dart';
import 'schema/segnalazioni_bangla_record.dart';
import 'schema/bug_record.dart';
import 'schema/concerti_in_evidenza_record.dart';
import 'schema/segnalazione_cibo_record.dart';
import 'schema/eventi_record.dart';
import 'schema/friends_request_record.dart';
import 'schema/participating_serate_record.dart';
import 'schema/eventi_particiapting_record.dart';
import 'schema/sync_contacts_record.dart';
import 'schema/requests_sent_record.dart';
import 'schema/count_participating_events_record.dart';
import 'schema/count_invita_amici_record.dart';
import 'schema/count_user_search_record.dart';
import 'schema/count_filters_events_record.dart';
import 'schema/count_video_clicked_record.dart';
import 'schema/blink_record.dart';
import 'schema/request_accepted_record.dart';
import 'schema/liste_serate_record.dart';
import 'schema/lista_eventi_record.dart';
import 'schema/users_record.dart';
import 'schema/concerti_participating_record.dart';
import 'schema/proposing_concerti_record.dart';
import 'schema/swipe_actions_record.dart';
import 'schema/matches_record.dart';
import 'schema/likes_record.dart';
import 'schema/custom_ads_record.dart';
import 'schema/surveys_record.dart';
import 'schema/count_matches_record.dart';
import 'schema/secret_parties_record.dart';
import 'schema/secret_party_participating_record.dart';
import 'schema/secret_party_swipe_actions_record.dart';
import 'schema/photos_event_record.dart';
import 'schema/friends_record.dart';
import 'schema/meet_up_places_record.dart';
import 'schema/count_female_swipes_record.dart';
import 'schema/not_me_in_photo_count_record.dart';
import 'schema/tickets_record.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart' hide Order;
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/concerti_record.dart';
export 'schema/serate_record.dart';
export 'schema/segnalazioni_nasoni_record.dart';
export 'schema/segnalazioni_bangla_record.dart';
export 'schema/bug_record.dart';
export 'schema/concerti_in_evidenza_record.dart';
export 'schema/segnalazione_cibo_record.dart';
export 'schema/eventi_record.dart';
export 'schema/friends_request_record.dart';
export 'schema/participating_serate_record.dart';
export 'schema/eventi_particiapting_record.dart';
export 'schema/sync_contacts_record.dart';
export 'schema/requests_sent_record.dart';
export 'schema/count_participating_events_record.dart';
export 'schema/count_invita_amici_record.dart';
export 'schema/count_user_search_record.dart';
export 'schema/count_filters_events_record.dart';
export 'schema/count_video_clicked_record.dart';
export 'schema/blink_record.dart';
export 'schema/request_accepted_record.dart';
export 'schema/liste_serate_record.dart';
export 'schema/lista_eventi_record.dart';
export 'schema/users_record.dart';
export 'schema/concerti_participating_record.dart';
export 'schema/proposing_concerti_record.dart';
export 'schema/swipe_actions_record.dart';
export 'schema/matches_record.dart';
export 'schema/likes_record.dart';
export 'schema/custom_ads_record.dart';
export 'schema/surveys_record.dart';
export 'schema/count_matches_record.dart';
export 'schema/secret_parties_record.dart';
export 'schema/secret_party_participating_record.dart';
export 'schema/secret_party_swipe_actions_record.dart';
export 'schema/photos_event_record.dart';
export 'schema/friends_record.dart';
export 'schema/meet_up_places_record.dart';
export 'schema/count_female_swipes_record.dart';
export 'schema/not_me_in_photo_count_record.dart';
export 'schema/tickets_record.dart';

/// Functions to query ConcertiRecords (as a Stream and as a Future).
Future<int> queryConcertiRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ConcertiRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ConcertiRecord>> queryConcertiRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ConcertiRecord.collection,
      ConcertiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ConcertiRecord>> queryConcertiRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ConcertiRecord.collection,
      ConcertiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SerateRecords (as a Stream and as a Future).
Future<int> querySerateRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SerateRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SerateRecord>> querySerateRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SerateRecord.collection,
      SerateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SerateRecord>> querySerateRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SerateRecord.collection,
      SerateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SegnalazioniNasoniRecords (as a Stream and as a Future).
Future<int> querySegnalazioniNasoniRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SegnalazioniNasoniRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SegnalazioniNasoniRecord>> querySegnalazioniNasoniRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SegnalazioniNasoniRecord.collection,
      SegnalazioniNasoniRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SegnalazioniNasoniRecord>> querySegnalazioniNasoniRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SegnalazioniNasoniRecord.collection,
      SegnalazioniNasoniRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SegnalazioniBanglaRecords (as a Stream and as a Future).
Future<int> querySegnalazioniBanglaRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SegnalazioniBanglaRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SegnalazioniBanglaRecord>> querySegnalazioniBanglaRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SegnalazioniBanglaRecord.collection,
      SegnalazioniBanglaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SegnalazioniBanglaRecord>> querySegnalazioniBanglaRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SegnalazioniBanglaRecord.collection,
      SegnalazioniBanglaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query BugRecords (as a Stream and as a Future).
Future<int> queryBugRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      BugRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<BugRecord>> queryBugRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BugRecord.collection,
      BugRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BugRecord>> queryBugRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BugRecord.collection,
      BugRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ConcertiInEvidenzaRecords (as a Stream and as a Future).
Future<int> queryConcertiInEvidenzaRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ConcertiInEvidenzaRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ConcertiInEvidenzaRecord>> queryConcertiInEvidenzaRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ConcertiInEvidenzaRecord.collection,
      ConcertiInEvidenzaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ConcertiInEvidenzaRecord>> queryConcertiInEvidenzaRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ConcertiInEvidenzaRecord.collection,
      ConcertiInEvidenzaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SegnalazioneCiboRecords (as a Stream and as a Future).
Future<int> querySegnalazioneCiboRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SegnalazioneCiboRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SegnalazioneCiboRecord>> querySegnalazioneCiboRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SegnalazioneCiboRecord.collection,
      SegnalazioneCiboRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SegnalazioneCiboRecord>> querySegnalazioneCiboRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SegnalazioneCiboRecord.collection,
      SegnalazioneCiboRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query EventiRecords (as a Stream and as a Future).
Future<int> queryEventiRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      EventiRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<EventiRecord>> queryEventiRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      EventiRecord.collection,
      EventiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<EventiRecord>> queryEventiRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      EventiRecord.collection,
      EventiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query FriendsRequestRecords (as a Stream and as a Future).
Future<int> queryFriendsRequestRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FriendsRequestRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FriendsRequestRecord>> queryFriendsRequestRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FriendsRequestRecord.collection,
      FriendsRequestRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FriendsRequestRecord>> queryFriendsRequestRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FriendsRequestRecord.collection,
      FriendsRequestRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ParticipatingSerateRecords (as a Stream and as a Future).
Future<int> queryParticipatingSerateRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ParticipatingSerateRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ParticipatingSerateRecord>> queryParticipatingSerateRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ParticipatingSerateRecord.collection(parent),
      ParticipatingSerateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ParticipatingSerateRecord>> queryParticipatingSerateRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ParticipatingSerateRecord.collection(parent),
      ParticipatingSerateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query EventiParticiaptingRecords (as a Stream and as a Future).
Future<int> queryEventiParticiaptingRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      EventiParticiaptingRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<EventiParticiaptingRecord>> queryEventiParticiaptingRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      EventiParticiaptingRecord.collection(parent),
      EventiParticiaptingRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<EventiParticiaptingRecord>> queryEventiParticiaptingRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      EventiParticiaptingRecord.collection(parent),
      EventiParticiaptingRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SyncContactsRecords (as a Stream and as a Future).
Future<int> querySyncContactsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SyncContactsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SyncContactsRecord>> querySyncContactsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SyncContactsRecord.collection,
      SyncContactsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SyncContactsRecord>> querySyncContactsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SyncContactsRecord.collection,
      SyncContactsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query RequestsSentRecords (as a Stream and as a Future).
Future<int> queryRequestsSentRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RequestsSentRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RequestsSentRecord>> queryRequestsSentRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RequestsSentRecord.collection,
      RequestsSentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RequestsSentRecord>> queryRequestsSentRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RequestsSentRecord.collection,
      RequestsSentRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CountParticipatingEventsRecords (as a Stream and as a Future).
Future<int> queryCountParticipatingEventsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CountParticipatingEventsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CountParticipatingEventsRecord>>
    queryCountParticipatingEventsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          CountParticipatingEventsRecord.collection,
          CountParticipatingEventsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<CountParticipatingEventsRecord>>
    queryCountParticipatingEventsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          CountParticipatingEventsRecord.collection,
          CountParticipatingEventsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

/// Functions to query CountInvitaAmiciRecords (as a Stream and as a Future).
Future<int> queryCountInvitaAmiciRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CountInvitaAmiciRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CountInvitaAmiciRecord>> queryCountInvitaAmiciRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CountInvitaAmiciRecord.collection,
      CountInvitaAmiciRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CountInvitaAmiciRecord>> queryCountInvitaAmiciRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CountInvitaAmiciRecord.collection,
      CountInvitaAmiciRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CountUserSearchRecords (as a Stream and as a Future).
Future<int> queryCountUserSearchRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CountUserSearchRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CountUserSearchRecord>> queryCountUserSearchRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CountUserSearchRecord.collection,
      CountUserSearchRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CountUserSearchRecord>> queryCountUserSearchRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CountUserSearchRecord.collection,
      CountUserSearchRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CountFiltersEventsRecords (as a Stream and as a Future).
Future<int> queryCountFiltersEventsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CountFiltersEventsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CountFiltersEventsRecord>> queryCountFiltersEventsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CountFiltersEventsRecord.collection,
      CountFiltersEventsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CountFiltersEventsRecord>> queryCountFiltersEventsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CountFiltersEventsRecord.collection,
      CountFiltersEventsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CountVideoClickedRecords (as a Stream and as a Future).
Future<int> queryCountVideoClickedRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CountVideoClickedRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CountVideoClickedRecord>> queryCountVideoClickedRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CountVideoClickedRecord.collection,
      CountVideoClickedRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CountVideoClickedRecord>> queryCountVideoClickedRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CountVideoClickedRecord.collection,
      CountVideoClickedRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query BlinkRecords (as a Stream and as a Future).
Future<int> queryBlinkRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      BlinkRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<BlinkRecord>> queryBlinkRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BlinkRecord.collection,
      BlinkRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BlinkRecord>> queryBlinkRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BlinkRecord.collection,
      BlinkRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query RequestAcceptedRecords (as a Stream and as a Future).
Future<int> queryRequestAcceptedRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RequestAcceptedRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RequestAcceptedRecord>> queryRequestAcceptedRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RequestAcceptedRecord.collection,
      RequestAcceptedRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RequestAcceptedRecord>> queryRequestAcceptedRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RequestAcceptedRecord.collection,
      RequestAcceptedRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ListeSerateRecords (as a Stream and as a Future).
Future<int> queryListeSerateRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ListeSerateRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ListeSerateRecord>> queryListeSerateRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ListeSerateRecord.collection(parent),
      ListeSerateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ListeSerateRecord>> queryListeSerateRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ListeSerateRecord.collection(parent),
      ListeSerateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ListaEventiRecords (as a Stream and as a Future).
Future<int> queryListaEventiRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ListaEventiRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ListaEventiRecord>> queryListaEventiRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ListaEventiRecord.collection(parent),
      ListaEventiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ListaEventiRecord>> queryListaEventiRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ListaEventiRecord.collection(parent),
      ListaEventiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query UsersRecords (as a Stream and as a Future).
Future<int> queryUsersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ConcertiParticipatingRecords (as a Stream and as a Future).
Future<int> queryConcertiParticipatingRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ConcertiParticipatingRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ConcertiParticipatingRecord>> queryConcertiParticipatingRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ConcertiParticipatingRecord.collection(parent),
      ConcertiParticipatingRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ConcertiParticipatingRecord>> queryConcertiParticipatingRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ConcertiParticipatingRecord.collection(parent),
      ConcertiParticipatingRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ProposingConcertiRecords (as a Stream and as a Future).
Future<int> queryProposingConcertiRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ProposingConcertiRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ProposingConcertiRecord>> queryProposingConcertiRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ProposingConcertiRecord.collection(parent),
      ProposingConcertiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ProposingConcertiRecord>> queryProposingConcertiRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ProposingConcertiRecord.collection(parent),
      ProposingConcertiRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SwipeActionsRecords (as a Stream and as a Future).
Future<int> querySwipeActionsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SwipeActionsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SwipeActionsRecord>> querySwipeActionsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SwipeActionsRecord.collection(parent),
      SwipeActionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SwipeActionsRecord>> querySwipeActionsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SwipeActionsRecord.collection(parent),
      SwipeActionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query MatchesRecords (as a Stream and as a Future).
Future<int> queryMatchesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      MatchesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<MatchesRecord>> queryMatchesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      MatchesRecord.collection,
      MatchesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<MatchesRecord>> queryMatchesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      MatchesRecord.collection,
      MatchesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query LikesRecords (as a Stream and as a Future).
Future<int> queryLikesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      LikesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<LikesRecord>> queryLikesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      LikesRecord.collection(parent),
      LikesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<LikesRecord>> queryLikesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      LikesRecord.collection(parent),
      LikesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CustomAdsRecords (as a Stream and as a Future).
Future<int> queryCustomAdsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CustomAdsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CustomAdsRecord>> queryCustomAdsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CustomAdsRecord.collection,
      CustomAdsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CustomAdsRecord>> queryCustomAdsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CustomAdsRecord.collection,
      CustomAdsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SurveysRecords (as a Stream and as a Future).
Future<int> querySurveysRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SurveysRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SurveysRecord>> querySurveysRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SurveysRecord.collection,
      SurveysRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SurveysRecord>> querySurveysRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SurveysRecord.collection,
      SurveysRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CountMatchesRecords (as a Stream and as a Future).
Future<int> queryCountMatchesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CountMatchesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CountMatchesRecord>> queryCountMatchesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CountMatchesRecord.collection,
      CountMatchesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CountMatchesRecord>> queryCountMatchesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CountMatchesRecord.collection,
      CountMatchesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SecretPartiesRecords (as a Stream and as a Future).
Future<int> querySecretPartiesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SecretPartiesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SecretPartiesRecord>> querySecretPartiesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SecretPartiesRecord.collection,
      SecretPartiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SecretPartiesRecord>> querySecretPartiesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SecretPartiesRecord.collection,
      SecretPartiesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SecretPartyParticipatingRecords (as a Stream and as a Future).
Future<int> querySecretPartyParticipatingRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SecretPartyParticipatingRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SecretPartyParticipatingRecord>>
    querySecretPartyParticipatingRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollection(
          SecretPartyParticipatingRecord.collection(parent),
          SecretPartyParticipatingRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

Future<List<SecretPartyParticipatingRecord>>
    querySecretPartyParticipatingRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          SecretPartyParticipatingRecord.collection(parent),
          SecretPartyParticipatingRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

/// Functions to query SecretPartySwipeActionsRecords (as a Stream and as a Future).
Future<int> querySecretPartySwipeActionsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SecretPartySwipeActionsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SecretPartySwipeActionsRecord>> querySecretPartySwipeActionsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SecretPartySwipeActionsRecord.collection(parent),
      SecretPartySwipeActionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SecretPartySwipeActionsRecord>>
    querySecretPartySwipeActionsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
        queryCollectionOnce(
          SecretPartySwipeActionsRecord.collection(parent),
          SecretPartySwipeActionsRecord.fromSnapshot,
          queryBuilder: queryBuilder,
          limit: limit,
          singleRecord: singleRecord,
        );

/// Functions to query PhotosEventRecords (as a Stream and as a Future).
Future<int> queryPhotosEventRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PhotosEventRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PhotosEventRecord>> queryPhotosEventRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PhotosEventRecord.collection(parent),
      PhotosEventRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PhotosEventRecord>> queryPhotosEventRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PhotosEventRecord.collection(parent),
      PhotosEventRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query FriendsRecords (as a Stream and as a Future).
Future<int> queryFriendsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FriendsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FriendsRecord>> queryFriendsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FriendsRecord.collection(parent),
      FriendsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FriendsRecord>> queryFriendsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FriendsRecord.collection(parent),
      FriendsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query MeetUpPlacesRecords (as a Stream and as a Future).
Future<int> queryMeetUpPlacesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      MeetUpPlacesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<MeetUpPlacesRecord>> queryMeetUpPlacesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      MeetUpPlacesRecord.collection,
      MeetUpPlacesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<MeetUpPlacesRecord>> queryMeetUpPlacesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      MeetUpPlacesRecord.collection,
      MeetUpPlacesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CountFemaleSwipesRecords (as a Stream and as a Future).
Future<int> queryCountFemaleSwipesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CountFemaleSwipesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CountFemaleSwipesRecord>> queryCountFemaleSwipesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CountFemaleSwipesRecord.collection(parent),
      CountFemaleSwipesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CountFemaleSwipesRecord>> queryCountFemaleSwipesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CountFemaleSwipesRecord.collection(parent),
      CountFemaleSwipesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query NotMeInPhotoCountRecords (as a Stream and as a Future).
Future<int> queryNotMeInPhotoCountRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      NotMeInPhotoCountRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<NotMeInPhotoCountRecord>> queryNotMeInPhotoCountRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      NotMeInPhotoCountRecord.collection,
      NotMeInPhotoCountRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<NotMeInPhotoCountRecord>> queryNotMeInPhotoCountRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      NotMeInPhotoCountRecord.collection,
      NotMeInPhotoCountRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query TicketsRecords (as a Stream and as a Future).
Future<int> queryTicketsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      TicketsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<TicketsRecord>> queryTicketsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      TicketsRecord.collection(parent),
      TicketsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<TicketsRecord>> queryTicketsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      TicketsRecord.collection(parent),
      TicketsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UsersRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUsersRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument = UsersRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUsersRecordData(email: email));
}
