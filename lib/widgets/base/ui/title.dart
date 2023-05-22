import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/utils/design_system.dart';

enum TitleStyle {
  small,
  medium,
  large;
}

class BaseTitle extends StatelessWidget {
  final String text;
  final TitleStyle style;

  const BaseTitle({
    super.key,
    required this.text,
    this.style = TitleStyle.medium,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(DesignSystem.spacing.x12),
      child: Text(
        text,
        style: (switch (style) {
          TitleStyle.small => Theme.of(context).textTheme.headlineSmall,
          TitleStyle.medium => Theme.of(context).textTheme.headlineMedium,
          TitleStyle.large => Theme.of(context).textTheme.headlineLarge,
        })!
            .copyWith(color: Theme.of(context).textTheme.bodyMedium!.color),
      ),
    );
  }
}
