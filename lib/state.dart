import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
