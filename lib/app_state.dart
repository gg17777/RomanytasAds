import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _banglaLocal = prefs
              .getStringList('ff_banglaLocal')
              ?.map((x) {
                try {
                  return BanglaTypeStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _banglaLocal;
    });
    _safeInit(() {
      _ciboLocal = prefs
              .getStringList('ff_ciboLocal')
              ?.map((x) {
                try {
                  return CiboTypeStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _ciboLocal;
    });
    _safeInit(() {
      _nasoniLocal = prefs
              .getStringList('ff_nasoniLocal')
              ?.map((x) {
                try {
                  return NasoniTypeStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _nasoniLocal;
    });
    _safeInit(() {
      _review = prefs.getInt('ff_review') ?? _review;
    });
    _safeInit(() {
      _isCacheOverride =
          prefs.getBool('ff_isCacheOverride') ?? _isCacheOverride;
    });
    _safeInit(() {
      _lastCacheTime = prefs.containsKey('ff_lastCacheTime')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastCacheTime')!)
          : _lastCacheTime;
    });
    _safeInit(() {
      _reviewShowedLast = prefs.containsKey('ff_reviewShowedLast')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_reviewShowedLast')!)
          : _reviewShowedLast;
    });
    _safeInit(() {
      _infoBangla = prefs.getBool('ff_infoBangla') ?? _infoBangla;
    });
    _safeInit(() {
      _infoNasoni = prefs.getBool('ff_infoNasoni') ?? _infoNasoni;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _tapped = const LatLng(35.1503787, 33.3410323);
  LatLng? get tapped => _tapped;
  set tapped(LatLng? value) {
    _tapped = value;
  }

  List<MarkersStruct> _markerslist = [
    MarkersStruct.fromSerializableMap(jsonDecode(
        '{\"coordinates\":\"35.1503787,33.3410323\",\"imageUrl\":\"https://res.cloudinary.com/dpxrpzvry/image/upload/v1688323086/nrx5dhxceiqaqd2esxw6.png\"}'))
  ];
  List<MarkersStruct> get markerslist => _markerslist;
  set markerslist(List<MarkersStruct> value) {
    _markerslist = value;
  }

  void addToMarkerslist(MarkersStruct value) {
    markerslist.add(value);
  }

  void removeFromMarkerslist(MarkersStruct value) {
    markerslist.remove(value);
  }

  void removeAtIndexFromMarkerslist(int index) {
    markerslist.removeAt(index);
  }

  void updateMarkerslistAtIndex(
    int index,
    MarkersStruct Function(MarkersStruct) updateFn,
  ) {
    markerslist[index] = updateFn(_markerslist[index]);
  }

  void insertAtIndexInMarkerslist(int index, MarkersStruct value) {
    markerslist.insert(index, value);
  }

  String _eventiState = '';
  String get eventiState => _eventiState;
  set eventiState(String value) {
    _eventiState = value;
  }

  List<BanglaTypeStruct> _banglaLocal = [];
  List<BanglaTypeStruct> get banglaLocal => _banglaLocal;
  set banglaLocal(List<BanglaTypeStruct> value) {
    _banglaLocal = value;
    prefs.setStringList(
        'ff_banglaLocal', value.map((x) => x.serialize()).toList());
  }

  void addToBanglaLocal(BanglaTypeStruct value) {
    banglaLocal.add(value);
    prefs.setStringList(
        'ff_banglaLocal', _banglaLocal.map((x) => x.serialize()).toList());
  }

  void removeFromBanglaLocal(BanglaTypeStruct value) {
    banglaLocal.remove(value);
    prefs.setStringList(
        'ff_banglaLocal', _banglaLocal.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBanglaLocal(int index) {
    banglaLocal.removeAt(index);
    prefs.setStringList(
        'ff_banglaLocal', _banglaLocal.map((x) => x.serialize()).toList());
  }

  void updateBanglaLocalAtIndex(
    int index,
    BanglaTypeStruct Function(BanglaTypeStruct) updateFn,
  ) {
    banglaLocal[index] = updateFn(_banglaLocal[index]);
    prefs.setStringList(
        'ff_banglaLocal', _banglaLocal.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBanglaLocal(int index, BanglaTypeStruct value) {
    banglaLocal.insert(index, value);
    prefs.setStringList(
        'ff_banglaLocal', _banglaLocal.map((x) => x.serialize()).toList());
  }

  List<CiboTypeStruct> _ciboLocal = [];
  List<CiboTypeStruct> get ciboLocal => _ciboLocal;
  set ciboLocal(List<CiboTypeStruct> value) {
    _ciboLocal = value;
    prefs.setStringList(
        'ff_ciboLocal', value.map((x) => x.serialize()).toList());
  }

  void addToCiboLocal(CiboTypeStruct value) {
    ciboLocal.add(value);
    prefs.setStringList(
        'ff_ciboLocal', _ciboLocal.map((x) => x.serialize()).toList());
  }

  void removeFromCiboLocal(CiboTypeStruct value) {
    ciboLocal.remove(value);
    prefs.setStringList(
        'ff_ciboLocal', _ciboLocal.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCiboLocal(int index) {
    ciboLocal.removeAt(index);
    prefs.setStringList(
        'ff_ciboLocal', _ciboLocal.map((x) => x.serialize()).toList());
  }

  void updateCiboLocalAtIndex(
    int index,
    CiboTypeStruct Function(CiboTypeStruct) updateFn,
  ) {
    ciboLocal[index] = updateFn(_ciboLocal[index]);
    prefs.setStringList(
        'ff_ciboLocal', _ciboLocal.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCiboLocal(int index, CiboTypeStruct value) {
    ciboLocal.insert(index, value);
    prefs.setStringList(
        'ff_ciboLocal', _ciboLocal.map((x) => x.serialize()).toList());
  }

  List<NasoniTypeStruct> _nasoniLocal = [];
  List<NasoniTypeStruct> get nasoniLocal => _nasoniLocal;
  set nasoniLocal(List<NasoniTypeStruct> value) {
    _nasoniLocal = value;
    prefs.setStringList(
        'ff_nasoniLocal', value.map((x) => x.serialize()).toList());
  }

  void addToNasoniLocal(NasoniTypeStruct value) {
    nasoniLocal.add(value);
    prefs.setStringList(
        'ff_nasoniLocal', _nasoniLocal.map((x) => x.serialize()).toList());
  }

  void removeFromNasoniLocal(NasoniTypeStruct value) {
    nasoniLocal.remove(value);
    prefs.setStringList(
        'ff_nasoniLocal', _nasoniLocal.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromNasoniLocal(int index) {
    nasoniLocal.removeAt(index);
    prefs.setStringList(
        'ff_nasoniLocal', _nasoniLocal.map((x) => x.serialize()).toList());
  }

  void updateNasoniLocalAtIndex(
    int index,
    NasoniTypeStruct Function(NasoniTypeStruct) updateFn,
  ) {
    nasoniLocal[index] = updateFn(_nasoniLocal[index]);
    prefs.setStringList(
        'ff_nasoniLocal', _nasoniLocal.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInNasoniLocal(int index, NasoniTypeStruct value) {
    nasoniLocal.insert(index, value);
    prefs.setStringList(
        'ff_nasoniLocal', _nasoniLocal.map((x) => x.serialize()).toList());
  }

  DateTime? _curTime;
  DateTime? get curTime => _curTime;
  set curTime(DateTime? value) {
    _curTime = value;
  }

  int _review = 0;
  int get review => _review;
  set review(int value) {
    _review = value;
    prefs.setInt('ff_review', value);
  }

  bool _isCacheOverride = false;
  bool get isCacheOverride => _isCacheOverride;
  set isCacheOverride(bool value) {
    _isCacheOverride = value;
    prefs.setBool('ff_isCacheOverride', value);
  }

  DateTime? _lastCacheTime;
  DateTime? get lastCacheTime => _lastCacheTime;
  set lastCacheTime(DateTime? value) {
    _lastCacheTime = value;
    value != null
        ? prefs.setInt('ff_lastCacheTime', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastCacheTime');
  }

  DateTime? _reviewShowedLast;
  DateTime? get reviewShowedLast => _reviewShowedLast;
  set reviewShowedLast(DateTime? value) {
    _reviewShowedLast = value;
    value != null
        ? prefs.setInt('ff_reviewShowedLast', value.millisecondsSinceEpoch)
        : prefs.remove('ff_reviewShowedLast');
  }

  bool _infoBangla = false;
  bool get infoBangla => _infoBangla;
  set infoBangla(bool value) {
    _infoBangla = value;
    prefs.setBool('ff_infoBangla', value);
  }

  bool _infoNasoni = false;
  bool get infoNasoni => _infoNasoni;
  set infoNasoni(bool value) {
    _infoNasoni = value;
    prefs.setBool('ff_infoNasoni', value);
  }

  final _eventiCacheManager = FutureRequestManager<List<EventiRecord>>();
  Future<List<EventiRecord>> eventiCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<EventiRecord>> Function() requestFn,
  }) =>
      _eventiCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventiCacheCache() => _eventiCacheManager.clear();
  void clearEventiCacheCacheKey(String? uniqueKey) =>
      _eventiCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
