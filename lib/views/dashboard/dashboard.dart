import 'package:flutter/material.dart';

import 'widgets/damaged_yolo_images_overview.dart';
import 'widgets/image_show.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageShow(),
            DamagedYOLOImagesOverview(),
          ],
        ),
      ),
    );
  }
}
