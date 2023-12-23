import 'package:bus_tracking/blocs/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:bus_tracking/blocs/bottom_nav_bloc/bottom_nav_state.dart';
import 'package:bus_tracking/pages/home_page.dart';
import 'package:bus_tracking/pages/map_page.dart';
import 'package:bus_tracking/pages/profile_page.dart';
import 'package:bus_tracking/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: BlocBuilder<BottomNavBloc, BottomNavState>(
            builder: (context, state) {
              if (state is BottomNavStateIdle) {
                return const HomePage();
              } else if (state is BottomNavLoadedState) {
                if (state.selectedIndex! == 1) {
                  return const HomePage();
                } else if (state.selectedIndex! == 2) {
                  return const MapPage();
                } else if (state.selectedIndex! == 3) {
                  return ProfilePage();
                } else {
                  return const SizedBox();
                }
              }
              return SizedBox();
            },
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          if (state is BottomNavStateIdle) {
            return const BottomNavBar(
              selectedIndex: 1,
            );
          } else if (state is BottomNavLoadedState) {
            return BottomNavBar(
              selectedIndex: state.selectedIndex!,
            );
          }
          return const BottomNavBar(
            selectedIndex: 1,
          );
        },
      ),
    );
  }
}
