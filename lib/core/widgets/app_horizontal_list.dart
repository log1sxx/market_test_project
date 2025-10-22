import 'package:flutter/material.dart';

class AppHorizontalList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T item, int index) itemBuilder;
  final double spacing;
  final EdgeInsets padding;

  const AppHorizontalList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.spacing = 10.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 15),
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: [
            for (int index = 0; index < items.length; index++) ...[
              itemBuilder(context, items[index], index),
              if (index < items.length - 1) SizedBox(width: spacing),
            ],
          ],
        ),
      ),
    );
  }
}
