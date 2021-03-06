import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reordeable_collection/reordeable_collection.dart';
import 'package:gm5_utils/extended_functionality/collections.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random _random = Random();
  String _platformVersion = 'Unknown';
  List<String> _sortableItems = List.generate(20, (index) => '$index');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('General reordeable example'),
        ),
        body: ReordeableCollectionController(
          limitToAxis: null,
          itemCount: _sortableItems.length,
          reorderType: ReordeableCollectionReorderType.reorder,
          itemBuilder: (context, key, dragDetector, index) => dragDetector(
            Container(
              width: 50,
              height: 50,
              key: key,
              margin: const EdgeInsets.all(8),
              alignment: Alignment.center,
              color: Colors.black12,
              child: Text(
                _sortableItems[index],
              ),
            ),
          ),
          dropPlaceholderBuilder: (context, from, to) => Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: -10,
                  blurRadius: 15,
                ),
              ],
            ),
          ),
          collectionBuilder: (context, key, itemBuilder, scrollController, disableScroll, itemCount) => Wrap(
            key: key,
            children: _sortableItems
                .mapIndexed(
                  (index, item) => itemBuilder(context, index),
                )
                .toList(),
          ),
          onReorder: _sortableItems.move,
        ),
      ),
    );
  }
}
