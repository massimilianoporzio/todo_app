import 'package:flutter/material.dart';
import 'package:todo_app/features/dashboard/presentation/widgets/bottom_nav_widget.dart';

class DashboardScreen extends StatelessWidget {
  final Widget child;
  const DashboardScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationWidget(),
      body: child,
    );
  }
}
