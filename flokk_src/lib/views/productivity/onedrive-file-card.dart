import 'package:flokk/_internal/components/spacing.dart';
import 'package:flokk/_internal/url_launcher/url_launcher.dart';
import 'package:flokk/_internal/utils/date_utils.dart';
import 'package:flokk/services/msgraph/models/shared_files.dart';
import 'package:flokk/styled_components/styled_icons.dart';
import 'package:flokk/styles.dart';
import 'package:flokk/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flokk/app_extensions.dart';

/// Item Renderer for shared OneDrive file card
class OneDriveFileCard extends StatelessWidget {
  final SharedFile file;

  const OneDriveFileCard(this.file, {Key key}) : super(key: key);

  void _handleSharedFilePressed() =>
      UrlLauncher.openHttp(file.resourceReference.webUrl);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    final cardTimeText = TextStyles.Body2.textColor(theme.txt);
    final cardContentText = TextStyles.H2.textColor(theme.txt);

    Widget fileIcon;
    switch (file.resourceVisualization.type) {
      case "PowerPoint":
        fileIcon = Image(image: StyledIcons.ppt);
        break;
      case "Excel":
        fileIcon = Image(image: StyledIcons.excel);
        break;
      case "Word":
        fileIcon = Image(image: StyledIcons.word);
        break;
      default:
        fileIcon = Image(image: StyledIcons.label);
        break;
    }

    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              fileIcon,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(file.resourceVisualization.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyles.Body1.textHeight(1.4)
                            .textColor(theme.txt)),
                    VSpace(Insets.xs),
                    Row(
                      children: [
                        Text(file.lastShared.sharedBy.displayName,
                            style: cardContentText),
                        Text(" shared", style: cardTimeText),
                        Container(
                                width: 4,
                                height: 4,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle))
                            .opacity(0.9),
                        Text(
                          DateFormats.friendlyDateTime(
                              DateTime.parse(file.lastShared.sharedDateTime),
                              'MM-dd'),
                          style: cardTimeText,
                        ).opacity(0.6),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: theme.greyWeak.withOpacity(.35)),
        ],
      ),
    ).gestures(onTap: _handleSharedFilePressed);
  }
}
