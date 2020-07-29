import 'package:flokk/_internal/log.dart';
import 'package:flokk/commands/abstract_command.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../services/msgraph/models/calender_event.dart';
import '../../services/service_result.dart';

class RefreshMSCalendarEventsCommand extends AbstractCommand
    with AuthorizedServiceCommandMixin {
  RefreshMSCalendarEventsCommand(BuildContext c) : super(c);

  Future<ServiceResult> execute({bool skipGroups = false}) async {
    Log.p("[RefreshMSCalendarEventsCommand]");

    ServiceResult<CalendarEvents> result;
    await executeAuthServiceCmd(() async {
      // Check if we have a sync token...
      String syncToken = authModel.msGraphAccessToken ?? "";
      if (contactsModel.allContacts.isEmpty) {
        syncToken = null;
      }
      result = await msgraphService.getCalendarEvents(syncToken);

      if (result.success) {
        authModel.googleSyncToken = syncToken;
        //Iterate through returned contacts and either update existing contact or append

        msgraphCalendarModel.calendarEvents = result.content;

        //contactsModel.allContacts.removeWhere((ContactData c) => c.isDeleted);
        msgraphCalendarModel.notify();
        msgraphCalendarModel.scheduleSave();

          Log.p(
          "MSGraph calendar events loaded = ${result?.content?.value?.length ?? 0}");
      }
    
      return result.response;
    });
    return result;
  }
}
