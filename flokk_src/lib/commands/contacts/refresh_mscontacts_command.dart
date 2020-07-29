import 'package:flokk/_internal/log.dart';
import 'package:flokk/commands/abstract_command.dart';
import 'package:flokk/commands/groups/refresh_contact_groups_command.dart';
import 'package:flokk/data/contact_data.dart';
import 'package:flokk/services/google_rest/google_rest_contacts_service.dart';
import 'package:flokk/services/msgraph/models/person.dart';
import 'package:flokk/services/service_result.dart';
import 'package:flutter/src/widgets/framework.dart';

class RefreshMSContactsCommand extends AbstractCommand
    with AuthorizedServiceCommandMixin {
  RefreshMSContactsCommand(BuildContext c) : super(c);

  Future<ServiceResult> execute({bool skipGroups = false}) async {
    Log.p("[RefreshMSContactsCommand]");

    ServiceResult<People> result;
    await executeAuthServiceCmd(() async {
      // Check if we have a sync token...
      String syncToken = authModel.msGraphAccessToken ?? "";
      if (contactsModel.allContacts.isEmpty) {
        syncToken = null;
      }
      result = await msgraphService.getPeople(syncToken);
      Log.p("MSGraph People  loaded = ${result.content.value.length ?? 0}");
      return result.response;
    });
    return result;
  }
}
