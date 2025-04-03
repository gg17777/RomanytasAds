import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/outout/bottom_nav_out_out/bottom_nav_out_out_widget.dart';
import '/index.dart';
import 'eventi_home_widget.dart' show EventiHomeWidget;
import 'package:flutter/material.dart';

class EventiHomeModel extends FlutterFlowModel<EventiHomeWidget> {
  ///  Local state fields for this page.

  DateTime? curDay;

  DateTime? curMonth;

  DateTime? curYear;

  List<ConcertiInEvidenzaRecord> listOfConcerti = [];
  void addToListOfConcerti(ConcertiInEvidenzaRecord item) =>
      listOfConcerti.add(item);
  void removeFromListOfConcerti(ConcertiInEvidenzaRecord item) =>
      listOfConcerti.remove(item);
  void removeAtIndexFromListOfConcerti(int index) =>
      listOfConcerti.removeAt(index);
  void insertAtIndexInListOfConcerti(
          int index, ConcertiInEvidenzaRecord item) =>
      listOfConcerti.insert(index, item);
  void updateListOfConcertiAtIndex(
          int index, Function(ConcertiInEvidenzaRecord) updateFn) =>
      listOfConcerti[index] = updateFn(listOfConcerti[index]);

  List<EventiRecord> listOfEventEventi = [];
  void addToListOfEventEventi(EventiRecord item) => listOfEventEventi.add(item);
  void removeFromListOfEventEventi(EventiRecord item) =>
      listOfEventEventi.remove(item);
  void removeAtIndexFromListOfEventEventi(int index) =>
      listOfEventEventi.removeAt(index);
  void insertAtIndexInListOfEventEventi(int index, EventiRecord item) =>
      listOfEventEventi.insert(index, item);
  void updateListOfEventEventiAtIndex(
          int index, Function(EventiRecord) updateFn) =>
      listOfEventEventi[index] = updateFn(listOfEventEventi[index]);

  List<SerateRecord> listOfSerate = [];
  void addToListOfSerate(SerateRecord item) => listOfSerate.add(item);
  void removeFromListOfSerate(SerateRecord item) => listOfSerate.remove(item);
  void removeAtIndexFromListOfSerate(int index) => listOfSerate.removeAt(index);
  void insertAtIndexInListOfSerate(int index, SerateRecord item) =>
      listOfSerate.insert(index, item);
  void updateListOfSerateAtIndex(int index, Function(SerateRecord) updateFn) =>
      listOfSerate[index] = updateFn(listOfSerate[index]);

  bool blink = false;

  List<EventiRecord> listOfDiscoEventi = [];
  void addToListOfDiscoEventi(EventiRecord item) => listOfDiscoEventi.add(item);
  void removeFromListOfDiscoEventi(EventiRecord item) =>
      listOfDiscoEventi.remove(item);
  void removeAtIndexFromListOfDiscoEventi(int index) =>
      listOfDiscoEventi.removeAt(index);
  void insertAtIndexInListOfDiscoEventi(int index, EventiRecord item) =>
      listOfDiscoEventi.insert(index, item);
  void updateListOfDiscoEventiAtIndex(
          int index, Function(EventiRecord) updateFn) =>
      listOfDiscoEventi[index] = updateFn(listOfDiscoEventi[index]);

  bool moreFilters = false;

  List<String> lessFilters = ['Dance', 'Cheap Drinks', 'Free'];
  void addToLessFilters(String item) => lessFilters.add(item);
  void removeFromLessFilters(String item) => lessFilters.remove(item);
  void removeAtIndexFromLessFilters(int index) => lessFilters.removeAt(index);
  void insertAtIndexInLessFilters(int index, String item) =>
      lessFilters.insert(index, item);
  void updateLessFiltersAtIndex(int index, Function(String) updateFn) =>
      lessFilters[index] = updateFn(lessFilters[index]);

  List<String> allFilters = [
    'Dance',
    'Cheap Drinks',
    'Free',
    'Techno',
    'Club',
    'LGBTQ+'
  ];
  void addToAllFilters(String item) => allFilters.add(item);
  void removeFromAllFilters(String item) => allFilters.remove(item);
  void removeAtIndexFromAllFilters(int index) => allFilters.removeAt(index);
  void insertAtIndexInAllFilters(int index, String item) =>
      allFilters.insert(index, item);
  void updateAllFiltersAtIndex(int index, Function(String) updateFn) =>
      allFilters[index] = updateFn(allFilters[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchVisibleEvents] action in eventiHome widget.
  List<ConcertiInEvidenzaRecord>? concertiEv;
  // Stores action output result for [Custom Action - fetchEventsSorted] action in eventiHome widget.
  List<EventiRecord>? eventis;
  // Stores action output result for [Custom Action - isOverrideCacheAction] action in eventiHome widget.
  bool? isCacheOverride;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Custom Action - fetchVisibleEvents] action in PageView widget.
  List<ConcertiInEvidenzaRecord>? concertiEvCopy;
  // Stores action output result for [Custom Action - fetchEventsSorted] action in PageView widget.
  List<EventiRecord>? eventisCopy;
  // Stores action output result for [Custom Action - fetchEventsSorted] action in PageView widget.
  List<EventiRecord>? discoCopy;
  // Stores action output result for [Custom Action - fetchSerateSorted] action in PageView widget.
  List<SerateRecord>? serateCopy;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // Model for bottomNavOutOut component.
  late BottomNavOutOutModel bottomNavOutOutModel;

  @override
  void initState(BuildContext context) {
    bottomNavOutOutModel = createModel(context, () => BottomNavOutOutModel());
  }

  @override
  void dispose() {
    bottomNavOutOutModel.dispose();
  }
}
