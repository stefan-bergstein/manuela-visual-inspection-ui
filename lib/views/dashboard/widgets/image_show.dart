import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../types/classes/yolo_image.dart';
import '../providers/yolo_images.dart';
import 'decorated_yolo_image.dart';

class ImageShow extends ConsumerStatefulWidget {
  const ImageShow({super.key});

  @override
  ConsumerState<ImageShow> createState() => _ImageShowState();
}

class _ImageShowState extends ConsumerState<ImageShow> {
  final GlobalKey _imageBoxKey = GlobalKey();
  final LayerLink _link = LayerLink();

  final List<OverlayEntry> _currentEntries = [];

  void _addImageOverlay(YOLOImage image) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.read(yOLOImagesProvider.notifier).addImage(image);

        double imageHeight = _link.leaderSize!.height * 2 / 3;

        late OverlayEntry entry;
        entry = OverlayEntry(
          builder: (context) => Positioned(
            height: imageHeight,
            child: CompositedTransformFollower(
              link: _link,
              offset: Offset(
                0,
                (_link.leaderSize!.height - imageHeight) / 2,
              ),
              child: DecoratedYOLOImage(
                image: image,
                height: _link.leaderSize!.height * 2 / 3,
              )
                  .animate(
                    onComplete: (controller) {
                      entry.remove();
                      _currentEntries.remove(entry);
                    },
                  )
                  .fadeIn(
                    duration: const Duration(milliseconds: 1000),
                  )
                  .moveX(
                    duration: const Duration(milliseconds: 10000),
                    end: _link.leaderSize!.width - 500,
                  )
                  .fadeOut(
                    delay: const Duration(milliseconds: 9000),
                    duration: const Duration(milliseconds: 1000),
                  ),
            ),
          ),
        );
        Overlay.of(context).insert(entry);
        _currentEntries.add(entry);
      },
    );
  }

  @override
  void dispose() {
    for (var entry in _currentEntries) {
      entry.remove();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final yoloImage = ref.watch(yOLOImagesStreamProvider());

    return CompositedTransformTarget(
      link: _link,
      child: NotificationListener<SizeChangedLayoutNotification>(
        // onNotification: (notification) {
        //   if (_entry.mounted) {
        //     SchedulerBinding.instance.addPostFrameCallback((_) {
        //       _entry.markNeedsBuild();
        //     });
        //   }
        //   return true;
        // },
        child: SizeChangedLayoutNotifier(
          child: Container(
            key: _imageBoxKey,
            alignment: Alignment.center,
            height: 500,
            width: double.infinity,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
            child: yoloImage.when(
              data: (image) {
                _addImageOverlay(image);
                return const SizedBox();
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Text(
                '${error.toString()}\n\n${stackTrace.toString()}',
              ),
            ),
            // StreamBuilder<YOLOImage>(
            //   stream: _images,
            //   builder: (context, imagesSnapshot) {
            //     if (imagesSnapshot.connectionState ==
            //         ConnectionState.active) {
            //       if (imagesSnapshot.hasData) {
            //         _addImageOverlay(imagesSnapshot.data!);
            //         return const SizedBox();
            //       } else {
            //         return const Text('ERROR');
            //       }
            //     } else if (imagesSnapshot.connectionState ==
            //         ConnectionState.waiting) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else {
            //       return Text(
            //           imagesSnapshot.error?.toString() ?? 'The end');
            //     }
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
