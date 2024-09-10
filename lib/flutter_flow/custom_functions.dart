import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

double? addressLat(LatLng? coord) {
  // get latitude from coord
  return coord?.latitude;
}

double? addressLong(LatLng? coord) {
  // get latitude from coord
  return coord?.longitude;
}

String? whatsappLink(String? telefonoWa) {
  // add telefonoWa after https://wa.me/
  if (telefonoWa == null || telefonoWa.isEmpty) {
    return null;
  }
  final formattedPhone = telefonoWa.replaceAll(RegExp(r'[^\d]'), '');
  return 'https://wa.me/$formattedPhone';
}

DateTime? getDate(String? type) {
  // Get the current date and time
  DateTime now = DateTime.now();
  if (type == 'Day' || type == 'day') {
    return DateTime(now.day);
  } else if (type == 'Month' || type == 'month') {
    return DateTime(now.month);
  } else if (type == 'Year' || type == 'year') {
    return DateTime(now.year);
  } else {
    // Return only the date part (year, month, day)
    print(DateTime(now.year, now.month, now.day));
    return DateTime(now.year, now.month, now.day);
  }
}

List<LatLng> findClosestNasoniMarkers(
  List<GetAllNasoniRow> list,
  LatLng? currentLocation,
  int numberOfMarkersToReturn,
) {
  var listOfPoints = [];
  GetAllNasoniRow? dataA = null;
  GetAllNasoniRow? dataB = null;
  var markers = [];
  try {
    listOfPoints.add("Started");

    double haversineDistance(LatLng point1, LatLng point2) {
      const R = 6371e3; // Earth radius in meters

      double toRadians(double degree) {
        return degree * math.pi / 180.0;
      }

      double dLat = toRadians(point2.latitude - point1.latitude);
      double dLon = toRadians(point2.longitude - point1.longitude);

      double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
          math.cos(toRadians(point1.latitude)) *
              math.cos(toRadians(point2.latitude)) *
              math.sin(dLon / 2) *
              math.sin(dLon / 2);

      double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

      double distance = R * c; // Distance in meters

      return distance;
    }

    listOfPoints.add("Created harvesine function");
    list.sort((a, b) {
      dataA = a;
      dataB = b;
      double distanceA = (a.latitude != null && a.longitude != null)
          ? haversineDistance(currentLocation ?? LatLng(0, 0),
              LatLng(a.latitude!, a.longitude!))
          : double.maxFinite;
      double distanceB = (b.latitude != null && b.longitude != null)
          ? haversineDistance(currentLocation ?? LatLng(0, 0),
              LatLng(b.latitude!, b.longitude!))
          : double.maxFinite;
      listOfPoints.add("Completed check for item ${list.indexOf(a)}");
      return distanceA.compareTo(distanceB);
    });

    markers = list.take(numberOfMarkersToReturn).toList();
    listOfPoints.add("Completely set markers");
  } catch (e) {
    FirebaseFirestore.instance.collection("errors").doc().set({
      "error": e.toString(),
      "logs": listOfPoints,
      "got stuck on a": dataA?.data,
      "got stuck on b": dataB?.data,
      "created_at": DateTime.now()
    });
  }
  return markers.map((e) => getLatLng(e.latitude, e.longitude)).toList();
}

List<LatLng> findClosestBanglaMarkers(
  List<GetAllBanglaRow> list,
  LatLng currentLocation,
  int numberOfMarkersToReturn,
) {
  double haversineDistance(LatLng point1, LatLng point2) {
    const R = 6371e3; // Earth radius in meters

    double toRadians(double degree) {
      return degree * math.pi / 180.0;
    }

    double dLat = toRadians(point2.latitude - point1.latitude);
    double dLon = toRadians(point2.longitude - point1.longitude);

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(toRadians(point1.latitude)) *
            math.cos(toRadians(point2.latitude)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    double distance = R * c; // Distance in meters

    return distance;
  }

  list.sort((a, b) {
    double distanceA = (a.latitude != null && a.longitude != null)
        ? haversineDistance(currentLocation, LatLng(a.latitude!, a.longitude!))
        : double.maxFinite;
    double distanceB = (b.latitude != null && b.longitude != null)
        ? haversineDistance(currentLocation, LatLng(b.latitude!, b.longitude!))
        : double.maxFinite;
    return distanceA.compareTo(distanceB);
  });

  var markers = list.take(numberOfMarkersToReturn).toList();
  return markers.map((e) => getLatLng(e.latitude, e.longitude)).toList();
}

List<LatLng> findClosestCiboMarkers(
  List<GetAllCiboByZozzoniRow> list,
  LatLng currentLocation,
  int numberOfMarkersToReturn,
) {
  double haversineDistance(LatLng point1, LatLng point2) {
    const R = 6371e3; // Earth radius in meters

    double toRadians(double degree) {
      return degree * math.pi / 180.0;
    }

    double dLat = toRadians(point2.latitude - point1.latitude);
    double dLon = toRadians(point2.longitude - point1.longitude);

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(toRadians(point1.latitude)) *
            math.cos(toRadians(point2.latitude)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    double distance = R * c; // Distance in meters

    return distance;
  }

  list.sort((a, b) {
    double distanceA = (a.latitude != null && a.longitude != null)
        ? haversineDistance(currentLocation, LatLng(a.latitude!, a.longitude!))
        : double.maxFinite;
    double distanceB = (b.latitude != null && b.longitude != null)
        ? haversineDistance(currentLocation, LatLng(b.latitude!, b.longitude!))
        : double.maxFinite;
    return distanceA.compareTo(distanceB);
  });

  var markers = list.take(numberOfMarkersToReturn).toList();
  return markers.map((e) => getLatLng(e.latitude, e.longitude)).toList();
}

bool areLatLngsSame(
  LatLng? point1,
  LatLng? point2,
) {
  var tolerance = 1e-6;
  if (point1 == null || point2 == null) {
    return false;
  }

  return (point1.latitude - point2.latitude).abs() < tolerance &&
      (point1.longitude - point2.longitude).abs() < tolerance;
}

LatLng getLatLng(
  double? lat,
  double? long,
) {
  return LatLng(lat ?? 0.0, long ?? 0.0);
}

bool isUserLocationGotten(LatLng? location) {
  if (location == null) {
    return false;
  }
  if (location.latitude == 0.0 && location.longitude == 0.0) {
    return false;
  }
  return true;
}

String haversineDistance(
  LatLng point1,
  LatLng point2,
) {
  const R = 6371e3; // Earth radius in meters

  double toRadians(double degree) {
    return degree * math.pi / 180.0;
  }

  double dLat = toRadians(point2.latitude - point1.latitude);
  double dLon = toRadians(point2.longitude - point1.longitude);

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(toRadians(point1.latitude)) *
          math.cos(toRadians(point2.latitude)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);

  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double distance = ((R * c) / 1000); // Distance in kilometers

  return distance.toStringAsFixed(1);
}

List<LatLng> getLatLngsFromNasoni(List<GetAllNasoniRow> list) {
  return list
      .map((e) => LatLng(e.latitude ?? 0.0, e.longitude ?? 0.0))
      .toList();
}

List<LatLng> getLatLngsFromBangla(List<GetAllBanglaRow> list) {
  return list
      .map((e) => LatLng(e.latitude ?? 0.0, e.longitude ?? 0.0))
      .toList();
}

List<LatLng> getLatLngsFromCibo(List<GetAllCiboRow> list) {
  return list
      .map((e) => LatLng(e.latitude ?? 0.0, e.longitude ?? 0.0))
      .toList();
}

double distanceInDouble(
  LatLng point1,
  LatLng point2,
) {
  const R = 6371e3; // Earth radius in meters

  double toRadians(double degree) {
    return degree * math.pi / 180.0;
  }

  double dLat = toRadians(point2.latitude - point1.latitude);
  double dLon = toRadians(point2.longitude - point1.longitude);

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(toRadians(point1.latitude)) *
          math.cos(toRadians(point2.latitude)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);

  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double distance = ((R * c) / 1000); // Distance in kilometers

  return distance;
}

List<EventiRecord> sortEventi(
  List<EventiRecord> events,
  LatLng currentLocation,
) {
  print("::::::::All events${events.map((e) => e.titolo).toList()}");

  double haversineDistance(LatLng point1, LatLng point2) {
    const R = 6371e3; // Earth radius in meters

    double toRadians(double degree) {
      return degree * math.pi / 180.0;
    }

    double dLat = toRadians(point2.latitude - point1.latitude);
    double dLon = toRadians(point2.longitude - point1.longitude);

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(toRadians(point1.latitude)) *
            math.cos(toRadians(point2.latitude)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    double distance = R * c; // Distance in meters

    return distance;
  }

  // Group events by date
  Map<DateTime, List<EventiRecord>> groupedEvents = {};
  for (var event in events) {
    DateTime eventDate = DateTime(event.data?.year ?? 3000,
        event.data?.month ?? 12, event.data?.day ?? 30);
    if (!groupedEvents.containsKey(eventDate)) {
      groupedEvents[eventDate] = [];
    }
    groupedEvents[eventDate]!.add(event);
  }

  List<EventiRecord> sortedEvents = [];

  // Sort each group by distance from currentLocation
  groupedEvents.forEach((date, eventGroup) {
    eventGroup.sort((a, b) {
      double distanceA =
          (a.indirizzo?.latitude != null && a.indirizzo?.longitude != null)
              ? haversineDistance(currentLocation,
                  LatLng(a.indirizzo!.latitude, a.indirizzo!.longitude))
              : double.maxFinite;
      double distanceB =
          (b.indirizzo?.latitude != null && b.indirizzo?.longitude != null)
              ? haversineDistance(currentLocation,
                  LatLng(b.indirizzo!.latitude, b.indirizzo!.longitude))
              : double.maxFinite;
      return distanceA.compareTo(distanceB);
    });
    sortedEvents.addAll(eventGroup);
  });

  print("::::::::Events${sortedEvents.map((e) => e.titolo).toList()}");
  return sortedEvents;
}

bool arrayContainsArrayItems(
  List<String> options,
  List<String> list2,
) {
  for (var item in options) {
    if (!list2.contains(item)) {
      return false;
    }
  }
  return true;
}

List<SerateRecord> sortSerate(
  List<SerateRecord> events,
  LatLng currentLocation,
) {
  print("::::::::All events${events.map((e) => e.titolo).toList()}");

  double haversineDistance(LatLng point1, LatLng point2) {
    const R = 6371e3; // Earth radius in meters

    double toRadians(double degree) {
      return degree * math.pi / 180.0;
    }

    double dLat = toRadians(point2.latitude - point1.latitude);
    double dLon = toRadians(point2.longitude - point1.longitude);

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(toRadians(point1.latitude)) *
            math.cos(toRadians(point2.latitude)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    double distance = R * c; // Distance in meters

    return distance;
  }

  // Group events by date
  Map<DateTime, List<SerateRecord>> groupedEvents = {};
  for (var event in events) {
    DateTime eventDate = DateTime(event.data?.year ?? 3000,
        event.data?.month ?? 12, event.data?.day ?? 30);
    if (!groupedEvents.containsKey(eventDate)) {
      groupedEvents[eventDate] = [];
    }
    groupedEvents[eventDate]!.add(event);
  }

  List<SerateRecord> sortedEvents = [];

  // Sort each group by distance from currentLocation
  groupedEvents.forEach((date, eventGroup) {
    eventGroup.sort((a, b) {
      double distanceA =
          (a.indirizzo?.latitude != null && a.indirizzo?.longitude != null)
              ? haversineDistance(currentLocation,
                  LatLng(a.indirizzo!.latitude, a.indirizzo!.longitude))
              : double.maxFinite;
      double distanceB =
          (b.indirizzo?.latitude != null && b.indirizzo?.longitude != null)
              ? haversineDistance(currentLocation,
                  LatLng(b.indirizzo!.latitude, b.indirizzo!.longitude))
              : double.maxFinite;
      return distanceA.compareTo(distanceB);
    });
    sortedEvents.addAll(eventGroup);
  });

  print("::::::::Events${sortedEvents.map((e) => e.titolo).toList()}");
  return sortedEvents;
}

List<MostreRecord> sortMostre(
  List<MostreRecord> events,
  LatLng currentLocation,
) {
  print("::::::::All events${events.map((e) => e.titolo).toList()}");

  double haversineDistance(LatLng point1, LatLng point2) {
    const R = 6371e3; // Earth radius in meters

    double toRadians(double degree) {
      return degree * math.pi / 180.0;
    }

    double dLat = toRadians(point2.latitude - point1.latitude);
    double dLon = toRadians(point2.longitude - point1.longitude);

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(toRadians(point1.latitude)) *
            math.cos(toRadians(point2.latitude)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    double distance = R * c; // Distance in meters

    return distance;
  }

  // First, sort the events by dataInizio (start date)
  events.sort((a, b) {
    return (a.dataInizio ?? DateTime(3000, 1, 1))
        .compareTo(b.dataInizio ?? DateTime(3000, 1, 1));
  });

  // Sort events by distance from currentLocation
  events.sort((a, b) {
    double distanceA =
        (a.indirizzo?.latitude != null && a.indirizzo?.longitude != null)
            ? haversineDistance(currentLocation,
                LatLng(a.indirizzo!.latitude, a.indirizzo!.longitude))
            : double.maxFinite;
    double distanceB =
        (b.indirizzo?.latitude != null && b.indirizzo?.longitude != null)
            ? haversineDistance(currentLocation,
                LatLng(b.indirizzo!.latitude, b.indirizzo!.longitude))
            : double.maxFinite;
    return distanceA.compareTo(distanceB);
  });

  print("::::::::Events${events.map((e) => e.titolo).toList()}");
  return events;
}

bool isMoreThanDaysAgo(
  DateTime dateToCheck,
  int numberOfDays,
) {
  DateTime now = DateTime.now();

  // Calculate the difference between the current date and the given date
  Duration difference = now.difference(dateToCheck);

  // Check if the difference is greater than one day
  return difference.inDays > numberOfDays;
}

DateTime getEndOfDay(int? additional) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day + (additional ?? 0));
}

bool? search(
  String? textSearchFor,
  String? textSearchIn,
) {
  // return textSearchIn toLowerCase contains textSearchFor toLowerCase
  if (textSearchFor == null || textSearchIn == null) {
    return null;
  }
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

LatLng getDummyCoordinate(
  double lat,
  double long,
) {
  return LatLng(lat, long);
}

GetAllNasoniRow? selectedNasoni(
  LatLng mapCenter,
  List<GetAllNasoniRow> allNasoni,
) {
  var match = allNasoni.where((e) =>
      areLatLngsSame(mapCenter, getLatLng(e.latitude ?? 0, e.longitude ?? 0)));
  if (match.isEmpty) {
    return null;
  } else {
    return match.first;
  }
}

bool nasoniIsNull(GetAllNasoniRow? nasoni) {
  return nasoni == null;
}

bool theSameDay(
  DateTime? data,
  int extra,
) {
  if (data == null) {
    return false;
  }
  var today = DateTime.now().copyWith(day: DateTime.now().day + extra);
  return today.day == data.day &&
      today.month == data.month &&
      today.year == data.year;
}

List<ConcertiInEvidenzaRecord> getRandomConcert(
  List<ConcertiInEvidenzaRecord> list,
  int count,
) {
  list.shuffle();
  return list.take(count).toList();
}

String textListToText(List<String> textList) {
  // transform the list textList into a string with the items divided by one space
  return textList.join(' ');
}
