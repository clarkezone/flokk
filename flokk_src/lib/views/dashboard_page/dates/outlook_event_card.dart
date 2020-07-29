import 'package:flokk/_internal/components/spacing.dart';
import 'package:flokk/app_extensions.dart';
import 'package:flokk/data/contact_data.dart';
import 'package:flokk/styled_components/buttons/transparent_btn.dart';
import 'package:flokk/styled_components/styled_card.dart';
import 'package:flokk/styled_components/styled_user_avatar.dart';
import 'package:flokk/styles.dart';
import 'package:flokk/themes.dart';
import 'package:flokk/views/main_scaffold/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OutlookEventCard extends StatelessWidget {
  const OutlookEventCard(this.contact, this.event, {Key key}) : super(key: key);

  static DateFormat get monthDayFmt => DateFormat("MMMMEEEEd");

  final ContactData contact;
  final DateMixin event;

  bool get isBirthday => event is BirthdayData;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    var cardTimeText = TextStyles.H2.textColor(theme.txt);
    var cardContentText = TextStyles.Body2.textColor(theme.txt);

    return TransparentBtn(
      onPressed: () => context
          .read<MainScaffoldState>()
          .trySetSelectedContact(contact, showSocial: false),
      borderRadius: Corners.s8,
      contentPadding: EdgeInsets.zero,
      child: StyledCard(
        align: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                VSpace(Insets.sm),
                Flexible(
                  child: Row(
                    children: [
                      VerticalDivider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("3:00 AM", style: cardTimeText),
                          VSpace(Insets.m),
                          Text("4:00 AM", style: cardTimeText),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            HSpace(Insets.l),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Featured Talk: Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyles.Body1.textHeight(1.6)
                          .textColor(theme.txt)),
                  VSpace(Insets.m),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14.0,
                        semanticLabel: 'Meeting location',
                      ),
                      HSpace(Insets.xs),
                      Text("Microsoft Teams Meeting", style: cardContentText),
                    ],
                  ).opacity(0.6),
                  VSpace(Insets.m),
                  Row(
                    children: [
                      StyledUserAvatar(contact: contact, size: 32),
                      HSpace(Insets.sm),
                      StyledUserAvatar(contact: contact, size: 32),
                      HSpace(Insets.sm),
                      StyledUserAvatar(contact: contact, size: 32),
                    ],
                  ),
                ],
              ),
            ),
            HSpace(Insets.m),
          ],
        ).padding(all: Insets.m),
      ),
    );
  }
}
