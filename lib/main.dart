import 'package:flutter/material.dart';

import 'pages/responsive/mobile_body.dart';
import 'pages/responsive2/admin_tablet_body.dart';
import 'responsive_layout.dart';
import 'pages/responsive/tablet_body.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/responsive2',
      routes: {
        '/responsive': (context) => const ResponsiveLayout(
              mobileBody: MobileBody(),
              tabletBody: TabletBody(),
            ),
        '/responsive2': (context) => const ResponsiveLayout(
              mobileBody: AdminTabletBody(),
              tabletBody: AdminTabletBody(),
            ),
      },
    );
  }
}
