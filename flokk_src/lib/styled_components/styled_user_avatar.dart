import 'dart:math';

import 'package:flokk/_internal/utils/string_utils.dart';
import 'package:flokk/data/contact_data.dart';
import 'package:flokk/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StyledUserAvatar extends StatefulWidget {
  final ContactData contact;
  final double size;
  final bool useInitials;

  const StyledUserAvatar({Key key, this.contact, this.size, this.useInitials = false}) : super(key: key);

  @override
  _StyledUserAvatarState createState() => _StyledUserAvatarState();
}

class _StyledUserAvatarState extends State<StyledUserAvatar> {
  int _seed;

  @override
  void initState() {
    _seed = widget.contact?.id?.hashCode ?? 0;
    super.initState();
  }

  @override
  void didUpdateWidget(StyledUserAvatar oldWidget) {
    if (oldWidget.contact.profilePicBytes != widget.contact.profilePicBytes) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    Widget child;
    if (widget.contact.profilePicBytes != null) {
      child = Image.memory(widget.contact.profilePicBytes, fit: BoxFit.cover);
    } else if (widget.contact.profilePic != null && !widget.contact.isDefaultPic) {
      child = Image.network(widget.contact.profilePic, fit: BoxFit.cover);
    } else if (widget.useInitials && StringUtils.isNotEmpty("$widget.contact?.nameGiven$widget.contact?.nameFamily")) {
      child = InitialsAvatar(
        seed: _seed,
        contact: widget.contact,
        size: widget.size,
      );
    } else {
      child = AnimalAvatar(seed: _seed);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(99),
      child: Container(
        width: widget.size ?? 50,
        height: widget.size ?? 50,
        child: child,
      ),
    );
  }
}

class AnimalAvatar extends StatelessWidget {
  final int seed;

  final List<Color> backgrounds = [
    Color(0xFF44D3B8),
    Color(0xFFACC66B),
    Color(0xFF915599),
    Color(0xFF85CADB),
    Color(0xFF37598C),
    Color(0xFF5A5587),
    Color(0xFFD4B99F),
    Color(0xFFEDABA9),
    Color(0xFFE09BD6),
    Color(0xFFF4A647),
  ];

  final List<String> foregrounds = [
    "bird-hummingbird",
    "bird-parrot",
    "bird-pelican",
    "bird-swan",
    "bird-woodpecker",
    "bird-flamingo",
    "bird-owl",
    "bird-peacock",
    "bird-penguin",
    "bird-toucan"
  ];

  AnimalAvatar({Key key, this.seed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random r = Random(seed);
    return Stack(
      children: <Widget>[
        Container(
          color: backgrounds[r.nextInt(backgrounds.length)],
        ),
        Image.asset("assets/images/birds/${foregrounds[r.nextInt(foregrounds.length)]}.png"),
      ],
    );
  }
}

class InitialsAvatar extends AnimalAvatar {
  final ContactData contact;
  final double size;

  InitialsAvatar({Key key, int seed, this.contact, this.size}) : super(key: key, seed: seed);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    Random r = Random(seed);
    var initials = [contact?.nameGiven, contact?.nameFamily]
        .where(StringUtils.isNotEmpty)
        .map((e) => e[0])
        .join('');
    return CircleAvatar(
      backgroundColor: backgrounds[r.nextInt(backgrounds.length)],
      foregroundColor: theme.accent1Darker,
      child: Text(initials, style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
      )),
      minRadius: size,
      maxRadius: size,
    );
  }
}

//Widget _buildAvatar(double size) {
//  Widget content = (widget.contact.profilePic == null
//                    ? Container()
//                    : ClipRRect(
//    borderRadius: BorderRadius.circular(999),
//    child: Image.network(widget.contact.profilePic, fit: BoxFit.cover),
//    ));
//  return content.constrained(width: size, height: size);
//}
