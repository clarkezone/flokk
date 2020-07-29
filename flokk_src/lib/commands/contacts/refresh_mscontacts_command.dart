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

      if (result.success) {
        authModel.googleSyncToken = syncToken;
        //Iterate through returned contacts and either update existing contact or append
        for (Person p in result.content.value) {
          if (contactsModel.allContacts.any((x) => x.id == p.id)) {
            //TODO
            //contactsModel.swapContactById(n);
          } else {
            var n = ContactData();

            n.googleId = p.id;
            n.nameFull = p.displayName;
            n.nameFamily = p.surname;
            n.nameGiven = p.givenName;
            //Add camefrommsft flag
            contactsModel.addContact(n);
          }
        }
        //contactsModel.allContacts.removeWhere((ContactData c) => c.isDeleted);
        contactsModel.notify();
        contactsModel.scheduleSave();
      }

      Log.p("MSGraph People  loaded = ${result.content.value?.length ?? 0}");
      return result.response;
    });
    return result;
  }
}
