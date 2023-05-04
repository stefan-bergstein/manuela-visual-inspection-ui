import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../types/classes/yolo_image.dart';
import '../providers/yolo_images.dart';
import 'decorated_yolo_image.dart';

class DamagedYOLOImagesOverview extends ConsumerWidget {
  const DamagedYOLOImagesOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<YOLOImage> damagedImages = ref.watch(damagedYOLOImagesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Damaged Parts',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        const Divider(height: 1.0),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Wrap(
            spacing: 24.0,
            runSpacing: 24.0,
            children: damagedImages
                .map(
                  (damagedImage) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DecoratedYOLOImage(
                          image: damagedImage,
                          height: 128.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(const Uuid().v4()),
                              Text(damagedImage.timestamp.toIso8601String()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList()
                .animate()
                .fade(
                  duration: const Duration(milliseconds: 500),
                ),
          ),
        ),
      ],
    );
  }
}
