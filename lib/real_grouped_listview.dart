import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RealGroupedList<T, E> extends StatefulWidget {
  ///List items
  final int itemCount;
  final List<T> elements;

  const RealGroupedList({
    super.key,
    required this.itemCount,
    required this.elements,
  });

  @override
  State<RealGroupedList> createState() => _RealGroupedListState();
}

class _RealGroupedListState<T, E> extends State<RealGroupedList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) => Container(
        height: 100,
        width: 100,
        color: index % 2 == 0 ? Colors.red : Colors.blue,
      ),
    );
  }
}
