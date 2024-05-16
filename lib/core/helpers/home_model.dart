import 'package:flutter/material.dart';
import 'package:todo_app2/features/home/views/calender_view.dart';
import 'package:todo_app2/features/home/views/index_view.dart';

class IndexModel {
  static const List<Widget> homeWidgets = [
    IndexView(),
    CalenderView(),
    Center(
      child: Text('theree'),
    ),
    Center(
      child: Text('four'),
    )
  ];
}
