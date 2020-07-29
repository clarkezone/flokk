import 'package:flokk/api_keys.dart';
import 'package:flokk/services/msgraph/models/person.dart';
import 'package:flokk/services/service_result.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:flokk/services/msgraph/msgraph.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';

class MsGraphRestService {
  String currentToken = "";

  Future<String> doLogin() async {
    if (UniversalPlatform.isWeb) {
      //TODO will need to confirm this works on the web ;-)
      // bool success = await WebSignInCommand(context).execute();
      // // We're in :) Load main app
      // if (success) refreshDataAndLoadApp();
      return "";
    } else {
      try {
        final Config configAzureOnMS = Config(
          ApiKeys().msgraphTenent,
          ApiKeys().msgraphClientID,
          "openid profile offline_access user.read people.read people.read.all", //scope
          "https://login.microsoftonline.com/common/oauth2/nativeclient", //callbackURL
        );

        final AadOAuth oauth = AadOAuth(configAzureOnMS);
        await oauth.login();
        currentToken = await oauth.getAccessToken();
        return currentToken;
      } catch (e) {
        return "";
      } finally {}
    }
  }

  Future<ServiceResult<People>> getPeople(String syncToken) async {
    //TODO handle token expiry
    if (syncToken != "" && syncToken != null) {
      currentToken = syncToken;
    }
    //TODO error handing
    var msGraph = MsGraph(currentToken);
    return await msGraph.me.getPeople();
  }
}
