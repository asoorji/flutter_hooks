import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'container.dart'; // Import the ColorContainer widget from the separate file

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

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorContainer(), // Use the ColorContainer widget here
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
