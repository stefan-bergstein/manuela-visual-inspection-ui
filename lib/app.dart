import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterUtils.router,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xffee0000),
          secondary: Color(0xffee0000),
          tertiary: Color(0xffee0000),
          background: Color(0xff2e2e2e),
        ),
      ),
    );
  }
}
