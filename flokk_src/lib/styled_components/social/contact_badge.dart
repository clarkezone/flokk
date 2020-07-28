import 'package:flokk/app_extensions.dart';
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
    var accountIcon = hasAccount
        ? Icon(icon, size: size, color: theme.grey)
        : Icon(iconPlaceholder, size: size, color: theme.greyWeak.withOpacity(.7)).center();
    return
      RawMaterialButton(
        onPressed: onPressed,
        elevation: 0,
        fillColor: Color(0xffeeeeee),
        child: accountIcon,
        shape: CircleBorder(),
      ).width(size * 1.8).height(size * 1.8);
  }
}
