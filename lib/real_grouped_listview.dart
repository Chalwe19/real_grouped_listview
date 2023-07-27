import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RealGroupedList<T, E> extends StatefulWidget {
  ///List items
  final int itemCount;
  final List<T> items;
  final Widget Function(BuildContext context, int inedx) itemBuilder;

  const RealGroupedList({
    super.key,
    required this.itemCount,
    required this.items,
    required this.itemBuilder,
  });

  @override
  State<RealGroupedList> createState() => _RealGroupedListState();
}

class _RealGroupedListState<T, E> extends State<RealGroupedList<T, E>> {
  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemCount,
      // separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: widget.itemBuilder,
    );
  }
}
