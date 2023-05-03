import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/damaged_yolo_images_overview.dart';
import 'widgets/image_show.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationRail(
            selectedIndex: 0,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.info_circle_fill),
                label: Text('About'),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ImageShow(),
                  DamagedYOLOImagesOverview(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
