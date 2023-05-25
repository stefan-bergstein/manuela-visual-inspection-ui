import 'package:flutter/material.dart';
import 'package:manuela_visual_inspection_ui/views/dashboard/widgets/theme_switcher.dart';

import '../../widgets/base/ui/title.dart';
import 'widgets/damaged_yolo_images_overview.dart';
import 'widgets/image_show.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseTitle(text: 'MANUela Visual Inspection'),
                ThemeSwitcher(),
              ],
            ),
            Divider(height: 1.0),
            ImageShow(),
            BaseTitle(text: 'Damaged Parts'),
            Divider(height: 1.0),
            DamagedYOLOImagesOverview(),
          ],
        ),
      ),
    );
  }
}
