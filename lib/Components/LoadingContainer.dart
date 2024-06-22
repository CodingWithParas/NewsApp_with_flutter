import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loadingcontainer extends StatelessWidget {

  final double width;
  final double height;

  const Loadingcontainer({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.background,
      highlightColor: Theme.of(context).colorScheme.primaryContainer,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10)
        ),
      )
    );
  }
}
