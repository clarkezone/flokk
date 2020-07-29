import 'package:flokk/api_keys.dart';
import 'package:flokk/services/msgraph/models/calender_event.dart';
import 'package:flokk/services/msgraph/models/email.dart';
import 'package:flokk/services/msgraph/models/person.dart';
import 'package:flokk/services/msgraph/models/shared_files.dart';
import 'package:flokk/services/service_result.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:flokk/services/msgraph/msgraph.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';

class MsGraphRestService {
  AadOAuth oauth;
  MsGraph msGraph;

  MsGraphRestService() {
    final Config configAzureOnMS = Config(
      ApiKeys().msgraphTenent,
      ApiKeys().msgraphClientID,
      "openid profile offline_access user.read people.read people.read.all calendars.read", //scope
      "https://login.microsoftonline.com/common/oauth2/nativeclient", //callbackURL
    );

    oauth = AadOAuth(configAzureOnMS);
  }

  Future<String> doLogin() async {
    if (UniversalPlatform.isWeb) {
      //TODO will need to confirm this works on the web ;-)
      // bool success = await WebSignInCommand(context).execute();
      // // We're in :) Load main app
      // if (success) refreshDataAndLoadApp();
      return "";
    } else {
      try {
        await oauth.login();
        var currentToken = await oauth.getAccessToken();
        msGraph = MsGraph(currentToken);
        return currentToken;
      } catch (e) {
        return "";
      } finally {}
    }
  }

  Future<ServiceResult<People>> getPeople(String syncToken) async {
    //TODO handle token
    //TODO error handing
    return await msGraph.me.getPeople();
  }

  Future<ServiceResult<CalendarEvents>> getCalendarEvents(
      String syncToken) async {
    //TODO handle token
    //TODO error handing
    return await msGraph.me.getCalendarEvents(7);
  }

  Future<ServiceResult<Emails>> getEmails(
      String syncToken, String contact) async {
    //TODO handle token
    //TODO error handing
    return await msGraph.me.getEmailsFromContact(contact);
  }

  Future<ServiceResult<SharedFiles>> getSharedFiles(
      String syncToken, String contact) async {
    //TODO handle token
    //TODO error handing
    return await msGraph.me.getSharedFilesFromContact(contact);
  }

  doLogout() {
    oauth.logout();
  }
}
