import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/view/home_page.dart';
import '../../profile/view/profile_page.dart';
import '../cubit/bottom_nav_cubit.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: BottomNavPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: const BottomNavView(),
    );
  }
}

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = [
      const HomePage(),
      const ProfilePage(),
    ];

    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: widgetOptions.elementAt(state),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile',
              ),
            ],
            currentIndex: state,
            selectedItemColor: Colors.amber,
            onTap: (index) => context.read<BottomNavCubit>().onNavigated(index),
          ),
        );
      }
    );
  }
}
