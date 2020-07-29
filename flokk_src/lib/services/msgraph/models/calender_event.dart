import 'package:flokk/services/msgraph/models/message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calender_event.g.dart';

@JsonSerializable()
class CalendarEvents {
  List<CalendarEvent> value;

  CalendarEvents({this.value});

  factory CalendarEvents.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventsFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEventsToJson(this);
}

@JsonSerializable()
class CalendarEvent {
  final String id;
  final String createdDateTime;
  final String lastModifiedDateTime;
  final String changeKey;
  final List<String> categories;
  final String originalStartTimeZone;
  final String originalEndTimeZone;
  final String iCalUId;
  final int reminderMinutesBeforeStart;
  final bool isReminderOn;
  final bool hasAttachments;
  final String subject;
  final String bodyPreview;
  final String importance;
  final String sensitivity;
  final bool isAllDay;
  final bool isCancelled;
  final bool isOrganizer;
  final bool responseRequested;
  final String seriesMasterId;
  final String showAs;
  final String type;
  final String webLink;
  final String onlineMeetingUrl;
  final bool isOnlineMeeting;
  final String onlineMeetingProvider;
  final bool allowNewTimeProposals;
  final String recurrence;
  final OnlineMeeting onlineMeeting;
  final ResponseStatus responseStatus;
  final Body body;
  final Start start;
  final End end;
  final Location location;
  final List<Location> locations;
  final List<Attendee> attendees;
  final EmailAddress organizer;

  CalendarEvent(
      {this.id,
      this.createdDateTime,
      this.lastModifiedDateTime,
      this.changeKey,
      this.categories,
      this.originalStartTimeZone,
      this.originalEndTimeZone,
      this.iCalUId,
      this.reminderMinutesBeforeStart,
      this.isReminderOn,
      this.hasAttachments,
      this.subject,
      this.bodyPreview,
      this.importance,
      this.sensitivity,
      this.isAllDay,
      this.isCancelled,
      this.isOrganizer,
      this.responseRequested,
      this.seriesMasterId,
      this.showAs,
      this.type,
      this.webLink,
      this.onlineMeetingUrl,
      this.isOnlineMeeting,
      this.onlineMeetingProvider,
      this.allowNewTimeProposals,
      this.recurrence,
      this.onlineMeeting,
      this.responseStatus,
      this.body,
      this.start,
      this.end,
      this.location,
      this.locations,
      this.attendees,
      this.organizer});

  factory CalendarEvent.fromJson(Map<String, dynamic> json) =>
      _$CalendarEventFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEventToJson(this);
}

@JsonSerializable()
class ResponseStatus {
  String response;
  String time;

  ResponseStatus({this.response, this.time});

  factory ResponseStatus.fromJson(Map<String, dynamic> json) =>
      _$ResponseStatusFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseStatusToJson(this);
}

@JsonSerializable()
class Start {
  String dateTime;
  String timeZone;

  Start({this.dateTime, this.timeZone});

  factory Start.fromJson(Map<String, dynamic> json) => _$StartFromJson(json);

  Map<String, dynamic> toJson() => _$StartToJson(this);
}

@JsonSerializable()
class End {
  String dateTime;
  String timeZone;

  End({this.dateTime, this.timeZone});

  factory End.fromJson(Map<String, dynamic> json) => _$EndFromJson(json);

  Map<String, dynamic> toJson() => _$EndToJson(this);
}

@JsonSerializable()
class Location {
  String displayName;
  String locationType;
  String uniqueId;
  String uniqueIdType;

  Location(
      {this.displayName, this.locationType, this.uniqueId, this.uniqueIdType});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Attendee {
  String type;
  ResponseStatus status;
  EmailAddress emailAddress;

  Attendee({this.type, this.status, this.emailAddress});

  factory Attendee.fromJson(Map<String, dynamic> json) =>
      _$AttendeeFromJson(json);

  Map<String, dynamic> toJson() => _$AttendeeToJson(this);
}

@JsonSerializable()
class OnlineMeeting {
  String joinUrl;

  OnlineMeeting({this.joinUrl});

  factory OnlineMeeting.fromJson(Map<String, dynamic> json) =>
      _$OnlineMeetingFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineMeetingToJson(this);
}
