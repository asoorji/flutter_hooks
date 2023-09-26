import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Define constants for container colors
const Color orangeColor = Colors.orange;
const Color blueColor = Colors.blue;
const Color greenColor = Colors.green;
const Color purpleColor = Colors.purple;

final containerColorProvider =
    StateNotifierProvider<ContainerColorNotifier, Color>(
  (ref) => ContainerColorNotifier(),
);

class ContainerColorNotifier extends StateNotifier<Color> {
  ContainerColorNotifier() : super(orangeColor);

  void changeColor(Color color) {
    state = color;
  }
}

class ColorContainer extends ConsumerWidget {
  const ColorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final containerColor = ref.watch(containerColorProvider);

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: containerColor,
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
                    ref
                        .read(containerColorProvider.notifier)
                        .changeColor(orangeColor);
                  },
                  child: Text('Orange'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(containerColorProvider.notifier)
                        .changeColor(blueColor);
                  },
                  child: Text('Blue'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(containerColorProvider.notifier)
                        .changeColor(greenColor);
                  },
                  child: Text('Green'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(containerColorProvider.notifier)
                        .changeColor(purpleColor);
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
