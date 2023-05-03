import 'package:flutter/material.dart';

import 'views/dashboard/dashboard.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xffee0000),
          background: Color(0xff2e2e2e),
        ),
      ),
      home: const DashboardView(),
    );
  }
}
