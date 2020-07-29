import 'package:graphtester/msgraph/models/calender_event.dart';
import 'package:graphtester/msgraph/models/email.dart';
import 'package:graphtester/msgraph/models/person.dart';
import 'package:graphtester/msgraph/models/photo_size.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:graphtester/msgraph/models/message.dart';

class Me {
  String uri = 'https://graph.microsoft.com/v1.0/me';
  String events = 'https://graph.microsoft.com/v1.0/me/events';

  Map<String, String> _headers;

  static Me _me;

  factory Me(token) {
    _me = new Me._(token);
    return _me;
  }

  Me._(token) {
    this._headers = {
      'Authorization': '$token',
    };
  }

  Future<dynamic> _getresponse(
      String action, Map<String, String> headers) async {
    if (headers.length > 0) {
      _headers.addAll(headers);
    }
    String _uri;
    if (action.isNotEmpty) {
      _uri = '$uri$action';
    } else {
      _uri = '$uri';
    }
    var response = await http.get(_uri, headers: _headers);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }

  Future<dynamic> _getResponseAsString(
      String action, Map<String, String> headers) async {
    if (headers.length > 0) {
      _headers.addAll(headers);
    }
    String _uri;
    if (action.isNotEmpty) {
      _uri = '$uri$action';
    } else {
      _uri = '$uri';
    }
    var response = await http.get(_uri, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<dynamic> _postresponse(
      String action, Map<String, String> headers, dynamic body) async {
    if (headers.length > 0) {
      _headers.addAll(headers);
    }
    String _uri;
    if (action.isNotEmpty) {
      _uri = '$uri$action';
    } else {
      _uri = '$uri';
    }
    var response = await http.post(_uri, headers: _headers, body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  Future<dynamic> get() async {
    return await _getresponse('', {'responseType': 'application/json'});
  }

  Future<dynamic> photo() async {
    return await _getresponse(
        '/photo/\$value', {'responseType': 'arrayBuffer'});
  }

  Future<dynamic> profilePhotobySize(photoSize size) async {
    String psize = PhotoSize.sizeValue[size];
    return await _getresponse('$psize/photo/\$value',
        {'responseType': 'arrayBuffer', 'Content-Type': 'image/jpg'});
  }

  Future<dynamic> getMessages({String folderId}) async {
    folderId ??= '';
    if (folderId.isNotEmpty) {
      return await _getresponse('/mailFolers/$folderId/messages',
          {'Content-Type': 'application/json'});
    } else {
      return await _getresponse(
          '/messages', {'Content-Type': 'application/json'});
    }
  }

  Future<People> getPeople() async {
    final response = await _getResponseAsString(
        '/people/?\$top=20&filter=personType/class eq \'Person\' and personType/subclass eq \'OrganizationUser\'',
        {'responseType': 'application/json'});

    final peeps =
        People.fromJson(json.decode(response) as Map<String, dynamic>);

    return peeps;
  }

  Future<CalendarEvents> getCalendarEvents(int numDays) async {
    var dateNow = DateTime.now();
    var startDateTimeString = dateNow.toIso8601String();
    var endDateTimeString =
        dateNow.add(new Duration(days: numDays)).toIso8601String();

    final response = await _getResponseAsString(
        '/calendarView?startdatetime=$startDateTimeString&enddatetime=$endDateTimeString',
        {'responseType': 'application/json'});

    final calendarEvents =
        CalendarEvents.fromJson(json.decode(response) as Map<String, dynamic>);

    return calendarEvents;
  }

  Future<Emails> getEmailsFromContact(String contactEmailAddress) async {
    final response = await _getResponseAsString(
        '/messages?\$filter=(from/emailAddress/address) eq \'$contactEmailAddress\'',
        {'responseType': 'application/json'});

    final emails =
        Emails.fromJson(json.decode(response) as Map<String, dynamic>);

    return emails;
  }

  Future<dynamic> createMessage(Message message) async {
    return await _postresponse(
        '/messages',
        {'Accept': 'application/json', "Content-Type": "application/json"},
        json.encode(message.toJson()));
  }
}
