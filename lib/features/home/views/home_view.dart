import 'package:flutter/material.dart';
import 'package:todo_app2/features/home/views/widgets/custom_Bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        elevation: 5,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Container(),
    );
  }
}
