import 'package:flokk/app_extensions.dart';
import 'package:flokk/styled_components/buttons/transparent_btn.dart';
import 'package:flokk/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactBadge extends StatelessWidget {
  final IconData icon;
  final IconData iconPlaceholder;
  final bool hasAccount;
  final Function() onPressed;

  const ContactBadge(
      {this.icon, this.iconPlaceholder, Key key, this.hasAccount, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    double size = 22;
    return TransparentBtn(
      onPressed: onPressed,
      child: Stack(
        children: [
          /// PLACEHOLDER
          if (!hasAccount) Icon(iconPlaceholder, size: 22, color: theme.greyWeak.withOpacity(.7)).center(),
          /// VALID ACCOUNT
          if (hasAccount) Icon(icon, size: 22, color: theme.grey),
        ],
      ).width(size).height(size),
    );
  }
}
