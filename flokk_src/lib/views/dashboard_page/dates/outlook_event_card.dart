import 'package:flokk/_internal/components/spacing.dart';
import 'package:flokk/app_extensions.dart';
import 'package:flokk/data/contact_data.dart';
import 'package:flokk/services/msgraph/models/calender_event.dart';
import 'package:flokk/styled_components/buttons/transparent_btn.dart';
import 'package:flokk/styled_components/styled_card.dart';
import 'package:flokk/styled_components/styled_user_avatar.dart';
import 'package:flokk/styles.dart';
import 'package:flokk/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OutlookEventCard extends StatelessWidget {
  const OutlookEventCard(this.event, {Key key}) : super(key: key);

  static DateFormat get timeFmt => DateFormat.jm();

  final CalendarEvent event;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    final cardTimeText = TextStyles.H2.textColor(theme.txt);
    final cardContentText = TextStyles.Body2.textColor(theme.txt);

    final startTime = DateTime.tryParse(event.start.dateTime);
    final endTime = DateTime.tryParse(event.end.dateTime);
    final location = event?.location?.displayName == ""
        ? "Unknown"
        : event?.location?.displayName;

    return TransparentBtn(
      onPressed: () => {},
      borderRadius: Corners.s8,
      contentPadding: EdgeInsets.zero,
      child: StyledCard(
        align: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                VSpace(Insets.xs),
                Flexible(
                  child: Row(
                    children: [
                      VerticalDivider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              startTime != null
                                  ? timeFmt.format(startTime)
                                  : '',
                              style: cardTimeText),
                          VSpace(Insets.m),
                          Text(endTime != null ? timeFmt.format(endTime) : '',
                              style: cardTimeText),
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
                  Text(event?.subject ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyles.Body1.textHeight(1.4)
                          .textColor(theme.txt)),
                  VSpace(Insets.sm),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14.0,
                        semanticLabel: 'Meeting location',
                      ),
                      HSpace(Insets.xs),
                      Text(
                          event.isOnlineMeeting
                              ? 'Microsoft Teams Meeting'
                              : location,
                          style: cardContentText),
                    ],
                  ).opacity(0.6).translate(offset: Offset(-3, 0)),
                  VSpace(Insets.m),
                  Row(
                    children: event?.attendees
                            ?.map((attendee) => [
                                  StyledUserAvatar(
                                    contact: ContactData()
                                      ..nameGiven =
                                          attendee?.emailAddress?.name ?? '',
                                    useInitials: true,
                                    size: 32,
                                  ),
                                  HSpace(Insets.sm),
                                ])
                            ?.expand((i) => i)
                            ?.toList() ??
                        [],
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
