import 'package:flutter/material.dart';

import 'responsive/mobile_body.dart';
import 'responsive/responsive_layout.dart';
import 'responsive/tablet_body.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileBody: MobileBody(),
        tabletBody: TabletBody(),
      ),
    );
  }
}
