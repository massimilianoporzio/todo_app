import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/features/dashboard/presentation/cubit/dashboard_cubit.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return NavigationBar(
            selectedIndex: state.pageIndex,
            onDestinationSelected: (value) =>
                _onItemSelected(context: context, index: value),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              )
            ],
          );
        },
      ),
    );
  }

  void _onItemSelected({required BuildContext context, required int index}) {
    context.read<DashboardCubit>().setPageIndex(index);
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/settings');
        break;
      default:
        throw Exception('No item found');
    }
  }
}
