import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manuela_visual_inspection_ui/router/router.dart';
import 'package:manuela_visual_inspection_ui/utils/design_system.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab_base.g.dart';

@riverpod
class TabIndex extends _$TabIndex {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

class TabBase extends ConsumerWidget {
  final Widget child;

  const TabBase({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabIndexProvider);
    final breakpoint =
        DesignSystem.breakpoint(MediaQuery.of(context).size.width);

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (breakpoint > Breakpoint.sm)
            NavigationRail(
              selectedIndex: tabIndex,
              labelType: NavigationRailLabelType.all,
              destinations: TabMeta.values
                  .map(
                    (tab) => NavigationRailDestination(
                      icon: Icon(tab.icon),
                      label: Text(tab.text),
                    ),
                  )
                  .toList(),
              onDestinationSelected: (index) {
                if (index != ref.read(tabIndexProvider)) {
                  ref.read(tabIndexProvider.notifier).setIndex(index);

                  RouterUtils.goTo(
                    context,
                    ref,
                    tab: TabMeta.values[index],
                  );
                }
              },
            ),
          Expanded(
            child: child,
          ),
        ],
      ),
      bottomNavigationBar: breakpoint <= Breakpoint.sm
          ? NavigationBar(
              selectedIndex: tabIndex,
              destinations: TabMeta.values
                  .map(
                    (tab) => NavigationDestination(
                      icon: Icon(tab.icon),
                      label: tab.text,
                    ),
                  )
                  .toList(),
              onDestinationSelected: (index) {
                if (index != ref.read(tabIndexProvider)) {
                  ref.read(tabIndexProvider.notifier).setIndex(index);

                  RouterUtils.goTo(
                    context,
                    ref,
                    tab: TabMeta.values[index],
                  );
                }
              },
            )
          : const SizedBox(),
    );
  }
}
