import 'package:flutter/material.dart';
import 'package:todo_app2/features/home/views/index_view.dart';

class IndexModel {
  static const List<Widget> indexWidgets = [
    IndexView(),
    Center(
      child: Text('two'),
    ),
    Center(
      child: Text('theree'),
    ),
    Center(
      child: Text('four'),
    )
  ];
}
