import 'package:flokk/_internal/components/spacing.dart';
import 'package:flokk/data/contact_data.dart';
import 'package:flokk/data/tweet_data.dart';
import 'package:flokk/styled_components/styled_icons.dart';
import 'package:flokk/styled_components/styled_user_avatar.dart';
import 'package:flokk/styles.dart';
import 'package:flokk/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flokk/app_extensions.dart';

/// Item Renderer for Git Events
class OutlookMailCard extends StatelessWidget {
  final Tweet gitEvent;
  // final ContactData contact;

  const OutlookMailCard(this.gitEvent, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    var normalText = TextStyles.Body2.textColor(theme.txt);
    var boldText = TextStyles.H2.textColor(theme.txt);

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
            ).opacity(true
                ? 1
                : 0), //todo: when the email is unread, show it otherwise hide
            // StyledUserAvatar(contact: contact, size: 32, useInitials: true),
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(top: 6, right: 12, bottom: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
            ).opacity(0.9),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Alex Wilber",
                      style: TextStyles.Body1.textHeight(1.4)
                          .textColor(theme.txt)),
                  VSpace(Insets.sm),
                  Text("Making things comfy",
                      style: true
                          ? boldText
                          : normalText), //todo: when the email is unread, use boldText otherwise use normalText
                  VSpace(Insets.xs),
                  Text(
                    "An Air Conditioning system component is acting up in the west end of Building 123.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: normalText.textHeight(1.3),
                  ).opacity(0.4),
                ],
              ),
            ),
            Text("Yesterday", style: normalText)
                .opacity(0.6)
                .padding(top: Insets.sm),
            HSpace(Insets.m),
          ],
        ),
        Divider(color: theme.greyWeak.withOpacity(.35)),
      ],
    );
  }
}
