import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ContainerColor {
  orange,
  blue,
  green,
  purple,
}

Color mapContainerColor(ContainerColor containerColor) {
  switch (containerColor) {
    case ContainerColor.orange:
      return Colors.orange;
    case ContainerColor.blue:
      return Colors.blue;
    case ContainerColor.green:
      return Colors.green;
    case ContainerColor.purple:
      return Colors.purple;
    default:
      return Colors.transparent; // You can choose a default color here.
  }
}

final containerColorProvider =
    StateNotifierProvider.autoDispose<ContainerColorNotifier, ContainerColor>(
        (ref) => ContainerColorNotifier());

class ContainerColorNotifier extends StateNotifier<ContainerColor> {
  ContainerColorNotifier() : super(ContainerColor.orange);

  void changeColor(ContainerColor color) {
    state = color;
  }
}

final containerColor = Provider.autoDispose((ref) {
  return ref.watch(containerColorProvider);
});

class ColorContainer extends ConsumerWidget {
  const ColorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final containerColor = ref.watch(containerColorProvider);

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: mapContainerColor(containerColor),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorContainer(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(containerColorProvider.notifier).changeColor(
                          ContainerColor.orange,
                        );
                  },
                  child: Text('Orange'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref.read(containerColorProvider.notifier).changeColor(
                          ContainerColor.blue,
                        );
                  },
                  child: Text('Blue'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref.read(containerColorProvider.notifier).changeColor(
                          ContainerColor.green,
                        );
                  },
                  child: Text('Green'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref.read(containerColorProvider.notifier).changeColor(
                          ContainerColor.purple,
                        );
                  },
                  child: Text('Purple'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}
