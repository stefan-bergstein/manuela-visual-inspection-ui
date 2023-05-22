import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manuela_visual_inspection_ui/providers/user_theme.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userTheme = ref.watch(userThemeProvider);

    return IconButton(
      onPressed: ref.read(userThemeProvider.notifier).nextThemeMode,
      icon: Icon(
        switch (userTheme) {
          ThemeMode.light => CupertinoIcons.lightbulb_fill,
          ThemeMode.dark => CupertinoIcons.lightbulb,
          ThemeMode.system => CupertinoIcons.lightbulb_slash,
        },
      ),
    );
  }
}
