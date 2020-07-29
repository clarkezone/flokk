import 'dart:convert';

import 'package:flokk/_internal/http_client.dart';
import 'package:flokk/services/msgraph/models/message.dart';
import 'package:flokk/services/msgraph/models/person.dart';
import 'package:flokk/services/msgraph/models/photo_size.dart';
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

  Future<dynamic> _getResponse(
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

  Future<dynamic> createMessage(Message message) async {
    return await _postresponse(
        '/messages',
        {'Accept': 'application/json', "Content-Type": "application/json"},
        json.encode(message.toJson()));
  }
}
