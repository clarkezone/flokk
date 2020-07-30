import 'dart:convert';

import 'package:flokk/_internal/http_client.dart';
import 'package:flokk/services/msgraph/models/calender_event.dart';
import 'package:flokk/services/msgraph/models/email.dart';
import 'package:flokk/services/msgraph/models/message.dart';
import 'package:flokk/services/msgraph/models/person.dart';
import 'package:flokk/services/msgraph/models/photo_size.dart';
import 'package:flokk/services/msgraph/models/shared_files.dart';
import 'package:flokk/services/service_result.dart';
import 'package:http/http.dart' as http;

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

  Future<dynamic> _getresponsebytes(
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

  Future<HttpResponse> _getResponse(
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
    HttpResponse response = await HttpClient.get(_uri, headers: _headers);
    //var response = await http.get(_uri, headers: _headers);
    return response;
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
    return await _getresponsebytes('', {'responseType': 'application/json'});
  }

  Future<dynamic> photo() async {
    return await _getresponsebytes(
        '/photo/\$value', {'responseType': 'arrayBuffer'});
  }

  Future<dynamic> profilePhotobySize(photoSize size) async {
    String psize = PhotoSize.sizeValue[size];
    return await _getresponsebytes('$psize/photo/\$value',
        {'responseType': 'arrayBuffer', 'Content-Type': 'image/jpg'});
  }

  Future<dynamic> getMessages({String folderId}) async {
    folderId ??= '';
    if (folderId.isNotEmpty) {
      return await _getresponsebytes('/mailFolers/$folderId/messages',
          {'Content-Type': 'application/json'});
    } else {
      return await _getresponsebytes(
          '/messages', {'Content-Type': 'application/json'});
    }
  }

  Future<ServiceResult<People>> getPeople() async {
    final response = await _getResponse(
        '/people/?\$top=20&filter=personType/class eq \'Person\' and personType/subclass eq \'OrganizationUser\'',
        {'responseType': 'application/json'});

    final peeps =
        People.fromJson(json.decode(response.body) as Map<String, dynamic>);

    return ServiceResult(peeps, response);
  }

  Future<ServiceResult<CalendarEvents>> getCalendarEvents(int numDays) async {
    var dateNow = DateTime.now();
    var startDateTimeString = dateNow.toIso8601String();
    var endDateTimeString =
        dateNow.add(new Duration(days: numDays)).toIso8601String();

    final response = await _getResponse(
        '/calendarView?startdatetime=$startDateTimeString&enddatetime=$endDateTimeString',
        {'responseType': 'application/json'});

    if (!response.success) {
      return ServiceResult(null, response);
    }

    final calendarEvents = CalendarEvents.fromJson(
        json.decode(response.body) as Map<String, dynamic>);

    return ServiceResult(calendarEvents, response);
  }

  Future<ServiceResult<Emails>> getEmailsFromContact(
      String contactEmailAddress) async {
    final response = await _getResponse(
        '/mailFolders/AQMkADgzNzRhMjA0LWI2ZTEtNDk2Zi1iNmU4LTA3Y2Y3NDZiZDU4ZAAuAAADeOGL1FuToU2DhupkGnk9AgEAbPfkKItXh0OOnETFTjBl-wAAAgEMAAAA/messages',
        {'responseType': 'application/json'});
    // ?\$filter=(from/emailAddress/address) eq \'$contactEmailAddress\'

    if (!response.success) {
      return ServiceResult(null, response);
    }

    final emails =
        Emails.fromJson(json.decode(response.body) as Map<String, dynamic>);

    return ServiceResult(emails, response);
  }

  Future<ServiceResult<SharedFiles>> getSharedFilesFromContact(
      String contactEmailAddress) async {
    final response = await _getResponse(
        '/insights/shared', {'responseType': 'application/json'});
    // '/insights/shared?&\$filter=(lastshared/sharedby/address eq \'$contactEmailAddress\')'

    if (!response.success) {
      return ServiceResult(null, response);
    }

    final sharedFiles = SharedFiles.fromJson(
        json.decode(response.body) as Map<String, dynamic>);

    return ServiceResult(sharedFiles, response);
  }

  Future<dynamic> createMessage(Message message) async {
    return await _postresponse(
        '/messages',
        {'Accept': 'application/json', "Content-Type": "application/json"},
        json.encode(message.toJson()));
  }
}
