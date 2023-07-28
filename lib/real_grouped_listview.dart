import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum GroupListOrder { asc, dsc, none }

class RealGroupedList<T, E> extends StatefulWidget {
  final List<T> items;
  final E Function(T element) groupBy;
  final Widget Function(T element) itemWidget;
  final Widget Function(E element) headerBuilder;
  final GroupListOrder order;

  const RealGroupedList({
    super.key,
    required this.items,
    required this.groupBy,
    required this.itemWidget,
    required this.headerBuilder,
    this.order = GroupListOrder.asc,
  });

  @override
  State<RealGroupedList> createState() => _RealGroupedListState();
}

class _RealGroupedListState<T, E> extends State<RealGroupedList<T, E>> {
  final GlobalKey _key = GlobalKey();
  late Map<E, List<T>> _sortedMap;

  @override
  void initState() {
    super.initState();
    _sortedMap = _groupObjects();
  }

  _groupObjects() {
    List<T> ungroupedList = [...widget.items];
    Map<E, List<T>> groupedObjects = {};

    for (var item in ungroupedList) {
      var groupedKey = widget.groupBy(item);
      if (groupedObjects.containsKey(groupedKey)) {
        groupedObjects[groupedKey]!.add(item);
      } else {
        groupedObjects[groupedKey] = [item];
      }
    }
    var sortedMap = _sortList(groupedObjects);
    return sortedMap;
  }

  _sortList(Map<E, List<T>> unsordtedMap) {
    var entries = unsordtedMap.keys;

    var sortedEntries = entries.toList()..sort();

    late Map<E, List<T>> sortedMap;

    if (widget.order == GroupListOrder.asc) {
      sortedMap = {for (var key in sortedEntries) key: unsordtedMap[key]!};
    } else {
      var reversedSortedEntries = sortedEntries.reversed;

      sortedMap = {
        for (var key in reversedSortedEntries) key: unsordtedMap[key]!
      };
    }
    return sortedMap;
  }

  Widget _buildList(context, index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      widget.headerBuilder(_sortedMap.entries.elementAt(index).key),
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _sortedMap.entries.elementAt(index).value.length,
        itemBuilder: (context, idx) {
          return widget.itemWidget(
            _sortedMap.entries.elementAt(index).value[idx],
          );
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _sortedMap.keys.length,
      itemBuilder: _buildList,
    );
  }
}
