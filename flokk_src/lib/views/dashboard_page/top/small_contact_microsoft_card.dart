import 'package:flokk/_internal/components/spacing.dart';
import 'package:flokk/app_extensions.dart';
import 'package:flokk/data/contact_data.dart';
import 'package:flokk/styled_components/social/contact_badge.dart';
import 'package:flokk/styled_components/styled_card.dart';
import 'package:flokk/styled_components/styled_user_avatar.dart';
import 'package:flokk/styles.dart';
import 'package:flokk/themes.dart';
import 'package:flokk/views/main_scaffold/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SmallContactMicrosoftCard extends StatelessWidget {

  static const double cardWidth = 162;

  final ContactData contact;

  const SmallContactMicrosoftCard(this.contact, {Key key}) : super(key: key);

  void _handleCardPressed(BuildContext c) =>
      c.read<MainScaffoldState>().trySetSelectedContact(contact, showSocial: false);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    Color txtColor = theme.isDark ? Colors.white : Colors.black;
    return StyledCard(
      onPressed: () => _handleCardPressed(context),
      child: Container(
        margin: EdgeInsets.all(Insets.m),
        width: cardWidth - Insets.m * 2,
        child: Column(
          children: [
            StyledUserAvatar(contact: contact, size: 60, useInitials: true,),
            VSpace(Insets.xs),
            Text(
              contact?.nameFull ?? "",
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: TextStyles.H2.textHeight(1.3).textColor(txtColor).bold,
              textAlign: TextAlign.center,
            ).center().height(30),
            Text(
              contact?.jobTitle ?? "",
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: TextStyles.Body2.textHeight(1.3).textColor(theme.greyWeak),
              textAlign: TextAlign.center,
            ).center().height(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on, size: 20, color: txtColor),
                HSpace(Insets.xs),
                Text(
                  "Unknown", //contact?.officeLocation ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyles.Body2.textHeight(1.3).textColor(txtColor),
                  textAlign: TextAlign.center,
                ),
              ]
            ).height(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ContactBadge(
                  icon: Icons.mail_outline,
                  iconPlaceholder: Icons.mail_outline,
                  hasAccount: contact.hasEmail,
                  onPressed: () {},
                ),
                HSpace(Insets.m),
                ContactBadge(
                  icon: Icons.phone_android,
                  iconPlaceholder: Icons.phone_android,
                  hasAccount: contact.hasPhone,
                  onPressed: () {},
                ),

              ],
            ),
          ],
        ),
      ),
    ).padding(
      right: Insets.m * 1.75,
      vertical: Insets.m,
    );
  }
}
