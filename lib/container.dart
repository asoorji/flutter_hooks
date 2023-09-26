import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main.dart';

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
