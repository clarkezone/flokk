import 'package:flokk/_internal/log.dart';
import 'package:flokk/commands/abstract_command.dart';
import 'package:flokk/services/msgraph/models/email.dart';
import 'package:flokk/services/service_result.dart';
import 'package:flutter/src/widgets/framework.dart';

class RefreshMSeMailsCommand extends AbstractCommand
    with AuthorizedServiceCommandMixin {
  RefreshMSeMailsCommand(BuildContext c) : super(c);

  Future<ServiceResult> execute(String forEmail,
      {bool skipGroups = false}) async {
    Log.p("[RefreshMSeMailsCommand]");

    ServiceResult<Emails> result;
    await executeAuthServiceCmd(() async {
      // Check if we have a sync token...
      String syncToken = authModel.msGraphAccessToken ?? "";
      if (contactsModel.allContacts.isEmpty) {
        syncToken = null;
      }
      result = await msgraphService.getEmails(syncToken, forEmail);

      if (result.success) {
        authModel.googleSyncToken = syncToken;
        //Iterate through returned contacts and either update existing contact or append

        msgraphEmailModel.emails = result.content;

        //contactsModel.allContacts.removeWhere((ContactData c) => c.isDeleted);
        msgraphCalendarModel.notify();
        msgraphCalendarModel.scheduleSave();

        Log.p("MSGraph emails = ${result?.content?.value?.length ?? 0}");
      }
      
      return result.response;
    });
    return result;
  }
}
