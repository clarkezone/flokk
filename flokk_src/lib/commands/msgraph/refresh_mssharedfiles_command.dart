import 'package:flokk/_internal/log.dart';
import 'package:flokk/commands/abstract_command.dart';
import 'package:flokk/services/msgraph/models/shared_files.dart';
import 'package:flokk/services/service_result.dart';
import 'package:flutter/src/widgets/framework.dart';

class RefreshMSSharedFilesCommand extends AbstractCommand
    with AuthorizedServiceCommandMixin {
  RefreshMSSharedFilesCommand(BuildContext c) : super(c);

  Future<ServiceResult> execute(String forEmail,
      {bool skipGroups = false}) async {
    Log.p("[RefreshMSSharedFilesCommand]");

    ServiceResult<SharedFiles> result;
    await executeAuthServiceCmd(() async {
      // Check if we have a sync token...
      String syncToken = authModel.msGraphAccessToken ?? "";
      if (contactsModel.allContacts.isEmpty) {
        syncToken = null;
      }

      result = await msgraphService.getSharedFiles(syncToken, forEmail);

      if (result.success) {
        authModel.googleSyncToken = syncToken;
        //Iterate through returned contacts and either update existing contact or append

        msgraphSharedFilesModel.sharedFiles = result.content;

        //contactsModel.allContacts.removeWhere((ContactData c) => c.isDeleted);
        msgraphSharedFilesModel.notify();
        msgraphSharedFilesModel.scheduleSave();
              Log.p(
          "MSGraph shared files loaded = ${result?.content?.value?.length ?? 0}");
      }

      return result.response;
    });
    return result;
  }
}
