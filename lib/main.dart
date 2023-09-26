import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'container.dart';
import 'state.dart';

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
