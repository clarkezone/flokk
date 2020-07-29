import 'package:flokk/_internal/components/spacing.dart';
import 'package:flokk/data/git_event_data.dart';
import 'package:flokk/styled_components/styled_icons.dart';
import 'package:flokk/styles.dart';
import 'package:flokk/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flokk/app_extensions.dart';

/// Item Renderer for Git Events
class OneDriveFileCard extends StatelessWidget {
  final GitEvent gitEvent;

  const OneDriveFileCard(this.gitEvent, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    var cardTimeText = TextStyles.Body2.textColor(theme.txt);
    var cardContentText = TextStyles.H2.textColor(theme.txt);

    return Column(
      children: [
        Row(
          children: [
            Image(image: StyledIcons.ppt),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contoso Research and Devvelopment Spend ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyles.Body1.textHeight(1.4)
                          .textColor(theme.txt)),
                  VSpace(Insets.xs),
                  Row(
                    children: [
                      Text("Isaiah Langer", style: cardContentText),
                      Text(" shared", style: cardTimeText),
                      Container(
                              width: 4,
                              height: 4,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle))
                          .opacity(0.9),
                      Text("Yesterday", style: cardTimeText).opacity(0.6),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(color: theme.greyWeak.withOpacity(.35)),
      ],
    );
  }
}
