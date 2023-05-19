import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app.dart';
import 'types/classes/env.dart';

late Env env;

Future<void> loadENV() async {
  String envString =
      await rootBundle.loadString('assets/env/config', cache: false);

  env = Env(apiURL: envString.split('API_URL=')[1]);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  await loadENV();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
