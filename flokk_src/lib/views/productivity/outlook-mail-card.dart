import 'package:flokk/_internal/components/spacing.dart';
import 'package:flokk/_internal/utils/date_utils.dart';
import 'package:flokk/data/contact_data.dart';
import 'package:flokk/services/msgraph/models/email.dart';
import 'package:flokk/styled_components/styled_user_avatar.dart';
import 'package:flokk/styles.dart';
import 'package:flokk/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flokk/app_extensions.dart';

/// Item Renderer for Outlook Mail
class OutlookMailCard extends StatelessWidget {
  final Email mail;

  const OutlookMailCard(this.mail, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    final normalText = TextStyles.Body2.textColor(theme.txt);
    final boldText = TextStyles.H2.textColor(theme.txt);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4,
              height: 4,
              margin: const EdgeInsets.only(left: 4, top: 20, right: 6),
              decoration: BoxDecoration(
                color: theme.accent1,
                shape: BoxShape.circle,
              ),
            ).opacity(mail.isRead ? 0 : 1),
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(top: 6, right: 12, bottom: 6),
              child: StyledUserAvatar(
                contact: ContactData()
                  ..nameGiven = mail.from.emailAddress.name ?? '',
                useInitials: true,
                size: 32,
              ),
            ).opacity(0.9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mail.sender.emailAddress.name,
                      style: TextStyles.Body1.textHeight(1.4)
                          .textColor(theme.txt)),
                  VSpace(Insets.sm),
                  Text(mail.subject,
                      style: mail.isRead ? normalText : boldText),
                  VSpace(Insets.xs),
                  Text(
                    mail.bodyPreview,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: normalText.textHeight(1.3),
                  ).opacity(0.4),
                ],
              ),
            ),
            Text(
              DateFormats.friendlyDateTime(
                  DateTime.parse(mail.sentDateTime), 'MM-dd'),
              style: normalText,
            ).opacity(0.6).padding(top: Insets.sm),
            HSpace(Insets.m),
          ],
        ),
        Divider(color: theme.greyWeak.withOpacity(.35)),
      ],
    );
  }
}
