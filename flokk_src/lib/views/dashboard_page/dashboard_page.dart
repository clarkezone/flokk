import 'package:flokk/_internal/components/scrolling_flex_view.dart';
import 'package:flokk/_internal/components/spacing.dart';
import 'package:flokk/app_extensions.dart';
import 'package:flokk/data/contact_data.dart';
import 'package:flokk/styles.dart';
import 'package:flokk/views/dashboard_page/dates/important_dates_section.dart';
import 'package:flokk/views/dashboard_page/social/social_activities_section.dart';
import 'package:flokk/views/dashboard_page/top/top_contacts_section.dart';
import 'package:flutter/material.dart';
import 'package:multiple_screens/multiple_screens.dart';
import 'package:flutter/services.dart';
import 'package:flokk/views/main_scaffold/main_scaffold.dart';

class DashboardPage extends StatefulWidget {
  final ContactData selectedContact;
  final MainScaffoldState state;

  const DashboardPage({Key key, this.selectedContact, this.state})
      : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  // // Duo platform support
  // final duoPlatform = const MethodChannel('duosdk.microsoft.dev');
  // bool isDuo = false;
  // bool isDuoSpanned = false;
  // double hingeSize = 0.0;

  // @override
  // void initState() {
  //   MultipleScreensMethods.isAppSpannedStream().listen(
  //     (data) => setState(() => isDuoSpanned = data),
  //   );

  //   checkForDuo();
  //   super.initState();
  // }

  // void checkForDuo() async {
  //   try {
  //     isDuo = await duoPlatform.invokeMethod('isDualScreenDevice');
  //     hingeSize = await duoPlatform.invokeMethod('gethingeSize');
  //   } catch (_) {
  //     // if we fail it is likely because we aren't on a duo
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ConstrainedFlexView(
      850,
      scrollPadding: EdgeInsets.only(right: Insets.m),
      child: widget.state.isDuoSpanned
          ? Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(height: Insets.l),
                      TopContactsSection(),
                      VSpace(Insets.m),
                      RepaintBoundary(
                        child: UpcomingActivitiesSection()
                            .height(170)
                            .padding(horizontal: Insets.lGutter),
                      ),
                      SizedBox(height: Insets.l),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: SizedBox(width: widget.state.hingeSize),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      SocialActivitySection()
                          .padding(horizontal: Insets.lGutter)
                          .flexible(),
                      SizedBox(height: Insets.l),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: <Widget>[
                SizedBox(height: Insets.l),
                TopContactsSection(),
                VSpace(Insets.m),
                SocialActivitySection()
                    .padding(horizontal: Insets.lGutter)
                    .flexible(),
                SizedBox(height: Insets.l * 1.5),
                RepaintBoundary(
                  child: UpcomingActivitiesSection()
                      .height(170)
                      .padding(horizontal: Insets.lGutter),
                ),
                SizedBox(height: Insets.l),
              ],
            ),
    );
  }
}
