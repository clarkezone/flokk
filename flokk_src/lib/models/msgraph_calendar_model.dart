import "package:flokk/models/abstract_model.dart";
import 'package:flokk/models/contacts_model.dart';
import 'package:flokk/services/msgraph/models/calender_event.dart';

class MSGraphCalendarModel extends AbstractModel {
  final expiry = Duration(
      days: 30); //the period of which to cull tweets based on createdAt

  ContactsModel contactsModel;
  CalendarEvents events;

  MSGraphCalendarModel(this.contactsModel) {
    enableSerialization("calendar.dat");
  }

  set calendarEvents(CalendarEvents calendarEvents) {
    events = calendarEvents;
  }

  @override
  void scheduleSave() {
    cull();
    super.scheduleSave();
  }

  /// //////////////////////////////////////////////////////////////////
  /// Serialization
  @override
  MSGraphCalendarModel copyFromJson(Map<String, dynamic> json) {
    CalendarEvents.fromJson(json);
    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    return events.toJson();
  }

  /// //////////////////////////////////////////////////////////////////
  /// Public API
  bool get isLoading => _isLoading;
  bool _isLoading = false;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  /////////////////////////////////////////////////////////////////////
  // Events
  List<CalendarEvent> get calEvents {
    return events.value;
  }

  void cull() {
    // final current = DateTime.now();
    // for (List<Tweet> n in _tweetHash.values) {
    //   n.removeWhere((x) => current.difference(x.createdAt) >= expiry);
    // }
    // _tweetHash.removeWhere((key, value) => value.isEmpty);
    notifyListeners();
  }
}
